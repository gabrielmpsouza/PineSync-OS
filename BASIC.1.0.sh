#!/bin/bash

echo "Bem-vindo ao PineSync OS"
echo "Versão 1.0. Criada por GB"
echo "Digite seus comandos. Para sair, digite 'exit'."
echo "Para ter uma lista de comandos digite 'ajuda'"

while true; do
    read -p "> " command

    case $command in
        "exit")
            echo "Saindo..."
            break
            ;;
        "listar")
            # Adicionando o comando "listar"
            ls
            ;;
        "data")
            # Adicionando o comando "data"
            date
            ;;
        "versao")
            # Adicionando o comando "versao"
            echo "PineSync OS versão 1.0 desenvolvida por GB."
            ;;
        "--help" | "ajuda")
            # Adicionando o comando "--help" e "ajuda"
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
        *)
            # Verificar se o comando está na lista permitida
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
