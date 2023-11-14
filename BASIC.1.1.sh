#!/bin/bash

# Definindo as credenciais de login e senha
login_correto="root"
senha_correta=""

verde='\033[0;32m'
azul='\033[0;34m'
cor_vermelha="\e[31m"
cor_amarela="\e[33m"
reset_cor="\e[0m"
pineOS="pineOS"

history_file="$HOME/.pinesync_history"
touch "$history_file"

comandos_validos=("listar" "data" "versao" "ajuda" "teste" "uso_cpu" "info_sistema" "espaco_disco" "criar_diretorio" "remover_arquivo" "info_memoria" "links2" "historico" "limpar" "sair")

echo -n -e "${reset_cor}Bem-vindo ao${cor_amarela} PineSync OS${reset_cor}\n"
echo -n -e "${reset_cor}Versão ${cor_amarela}Dummy 1.1\n"
echo -n -e "${reset_cor}Desenvolvida por ${cor_amarela}@gb.destroy7${reset_cor}\n"
echo -n -e "${reset_cor}Digite seus comandos. Para sair, digite ${cor_vermelha}'sair'${reset_cor}\n"
echo -n -e "Para ter uma lista de comandos, digite ${cor_amarela}'ajuda'${cor_vermelha}\n"
echo -n -e "${verde}----------------------------------------------${reset_cor}\n"
# Solicitar login
read -p "Login: " user
# Solicitar senha
read -s -p "Senha: " password

# Verificar login e senha
if [ "$user" != "$login_correto" ] || [ "$password" != "$senha_correta" ]; then
    echo -e -n "\n${cor_vermelha}Acesso negado. Saindo...\n"
    exit 1
fi

echo -e "\n${verde}Acesso concedido. Bem-vindo, \e[31m$user\e[0m!"

while true; do
    read -e -p "$(echo -e "${cor_vermelha}$user${reset_cor}@${cor_amarela}$pineOS${reset_cor}$ >") " command
    PS1="${cor_vermelha}$user${reset_cor}@${cor_amarela}$pine${reset_cor} >"

    output="${verde}"
    echo -n -e "${verde}Systemx86_64 > $output${reset_cor}"

    # Adiciona o comando ao histórico
    echo "$command" >> "$history_file"

    # Verifica se o comando está na lista de comandos válidos

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
            echo -e -n "\n${azul}PineSync OS. \n${reset_cor}Versão ${cor_amarela}Dummy.\n${reset_cor}Sistema desenvolvido por GB.\n${reset_cor}Propriedade da ${azul}PineSync OS S.A.\n${reset_cor}Todos os direitos reservados.\nRecife, 13/11/2023\n"
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
            echo "  historico      - Exibe os últimos comandos"
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
        "historico")
            echo "Últimos comandos:"
            tail -n 10 "$history_file"  # Mostra os últimos 10 comandos, você pode ajustar conforme necessário.
            ;;
        "limpar")
            clear
            ;;
        *)
            echo -e -n "${cor_vermelha}Comando não reconhecido. ${reset_cor}Digite '${verde}ajuda'${reset_cor} para obter ajuda.\n"
            ;;
    esac
done
