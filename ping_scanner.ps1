#
# Ping Scanner - Powershell
#
# use o powershell:
# ~ powershell ./ping_scan.ps1 192.168.0
#
param($p1)

if (!$p1) {
    mode 52,10
    cls
    echo "---------------------------------------------------"
    echo "|            PING SCANNER - POWERSHELL            |"
    echo "|                                                 |"
    echo "|     Exemplo de uso: .\script.ps1 192.168.0      |"
    echo "|                                                 | "
    echo "| *** Digite o IP da rede sem o ultimo octeto *** |"
    echo "---------------------------------------------------"
    echo " "
    pause
} else {
    mode 52,50
    cls
    echo "---------------------------------------------------"
    echo "|            PING SCANNER - POWERSHELL            |"
    echo "---------------------------------------------------"
    echo ""
    foreach($ip in 1..254) {
        
        ## Exemplo de grep
        ## O try serve para remover as saidas de erros. ele abre chaves e fecha no final do script
        try {$resp = ping -n 1 "$p1.$ip" | Select-String "bytes=32"
        
        ## Exemplo de Cut, porem so funciona manipulando o texto de uma variavel, por isso foi salvo em "resp".
        ## Exemplo de Sed, o replace substitui caracteres
        $resp.Line.split(' ')[2] -replace ":"," < HOST ATIVO"
    } catch {}
}
}
