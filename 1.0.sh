#!/bin/bash

# Definindo as credenciais de login e senha
login_correto="root"
senha_correta="admin"

verde='\033[0;32m'
azul='\033[0;34m'
cor_vermelha="\e[31m"
cor_amarela="\e[33m"
reset_cor="\e[0m"
pineOS="pineOS"

echo "Bem-vindo ao PineSync OS"
echo "Versão 1.0. Criada por GB"
echo "Digite seus comandos. Para sair, digite 'exit'."
echo "Para ter uma lista de comandos, digite 'ajuda'"

# Solicitar login
read -p "Login: " user
# Solicitar senha
read -s -p "Senha: " password

# Verificar login e senha
if [ "$user" != "$login_correto" ] || [ "$password" != "$senha_correta" ]; then
    echo -e "\nAcesso negado. Saindo..."
    exit 1
fi

echo -e "\nAcesso concedido. Bem-vindo, \e[31m$user\e[0m!"

while true; do
    echo -n -e "${cor_vermelha}$user${reset_cor}@${cor_amarela}$pineOS${reset_cor}$ "
    read command
    
    case $command in
        "exit")
            echo "Saindo..."
            break
            ;;
        "listar")
            ls
            ;;
        "data")
            date
            ;;
        "versao")
            echo "PineSync OS versão 1.0 desenvolvida por GB."
            ;;
        "--help" | "ajuda")
            echo "Lista de comandos:"
            echo "  listar - Lista os arquivos no diretório"
            echo "  data   - Exibe a data atual"
            echo "  versao - Exibe a versão do sistema"
            echo "  ajuda  - Exibe esta mensagem de ajuda"
            echo "  teste  - Testa os caracteres do sistema"
            echo "  exit   - Sai do sistema"
            ;;
        "teste")
            echo -e "\nTestando números:"
            for num in {1..9}; do
                echo -e -n "\e[93m$num\e[0m"
                sleep 0.1
            done

            echo -e "\nTestando alfabeto:"
            for letter in {a..z}; do
                echo -e -n "\e[93m$letter\e[0m"
                sleep 0.1
            done

            echo -e "\nTestando alfabeto maiúsculo:"
            for letter in {A..Z}; do
                echo -e -n "\e[93m$letter\e[0m"
                sleep 0.1
            done

            echo -e "\n\e[92mTeste concluído.\e[0m"
            ;;
        *)
            case $command in
                "ls" | "date" | "echo")
                    $command
                    ;;
                *)
                    echo "Comando não reconhecido. Digite '--help' ou 'ajuda' para obter ajuda."
                    ;;
            esac
            ;;
    esac
done

