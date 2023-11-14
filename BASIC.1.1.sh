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

history_file="$HOME/.pinesync_history"
touch "$history_file"

echo -n -e "Bem-vindo ao${cor_amarela} PineSync OS${reset_cor}\n"
echo "Versão DUMMY 1.1"
echo "Desenvolvida por @gb.destroy7"
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
    read -e -p "$(echo -e "${cor_vermelha}$user${reset_cor}@${cor_amarela}$pineOS${reset_cor}$") " command
    PS1="${cor_vermelha}$user${reset_cor}@${cor_amarela}$pine${reset_cor}"

output="System_x86 > "
    echo -n -e "${verde}$output${reset_cor}"

    # Adiciona o comando ao histórico
    echo "$command" >> "$history_file"

    case $command in
        "sair")
            echo "Saindo..."
            break
            ;;
        "listar")
            ls --color=auto
            ;;
        "data")
            date
            ;;
        "versao")
            echo -e "PineSync OS Versão 1.0 desenvolvida por GB.\nTodos os direitos reservados.\n13/11/2023"
            ;;
        "--ajuda" | "ajuda")
            echo "Lista de comandos:"
            echo "  listar         - Lista os arquivos no diretório"
            echo "  links2         - Acessa a web"
            echo "  data           - Exibe a data atual"
            echo "  versao         - Exibe a versão do sistema"
            echo "  ajuda          - Exibe esta mensagem de ajuda"
            echo "  teste          - Testa os caracteres do sistema"
            echo "  uso_cpu        - Exibe o uso atual da CPU"
            echo "  info_sistema   - Exibe informações do sistema"
            echo "  espaco_disco   - Exibe o espaço em disco"
            echo "  criar_diretorio- Cria um novo diretório"
            echo "  remover_arquivo- Remove um arquivo"
            echo "  info_memoria   - Exibe informações de memória"
            echo "  links2         - Acessa a web"
            echo "  histórico      - Exibe os últimos comandos"
            echo "  limpar         - Limpa a tela"
            echo "  sair           - Sai do sistema"
            ;;
        "teste")
            echo -e "Testando números:"
            for num in {1..9}; do
                echo -e -n "\e[93m$num\e[0m"
                sleep 0.05
            done

            echo -e "\nTestando alfabeto:"
            for letter in {a..z}; do
                echo -e -n "\e[93m$letter\e[0m"
                sleep 0.05
            done

            echo -e "\nTestando alfabeto maiúsculo:"
            for letter in {A..Z}; do
                echo -e -n "\e[93m$letter\e[0m"
                sleep 0.05
            done

            echo -e "\n\e[92mTeste concluído.\e[0m"
            ;;
        "uso_cpu")
            echo "Uso atual da CPU:"
            top -bn 1 | grep "Cpu(s)"
            ;;
        "info_sistema")
            echo "Informações do Sistema:"
            uname -a
            ;;
        "espaco_disco")
            echo "Espaço em Disco:"
            df -h
            ;;
        "criar_diretorio")
            read -p "Digite o nome do diretório a ser criado: " novo_diretorio
            mkdir "$novo_diretorio"
            echo "Diretório '$novo_diretorio' criado com sucesso."
            ;;
        "remover_arquivo")
            read -p "Digite o nome do arquivo a ser removido: " arquivo_a_remover
            read -p "Tem certeza que deseja remover '$arquivo_a_remover'? (s/n): " confirmacao
            if [ "$confirmacao" = "s" ]; then
                rm -i "$arquivo_a_remover"
                echo "Arquivo '$arquivo_a_remover' removido com sucesso."
            else
                echo "Remoção cancelada."
            fi
            ;;
        "info_memoria")
            echo "Informações de Memória:"
            free -m
            ;;
        "links2")
            links2 google.com
            ;;
        "histórico")
            echo "Últimos comandos:"
            tail -n 10 "$history_file"  # Mostra os últimos 10 comandos, você pode ajustar conforme necessário.
            ;;
        "limpar")
            clear
            ;;
        *)
            echo "Comando não reconhecido. Digite '--ajuda' ou 'ajuda' para obter ajuda."
            ;;
    esac
done
