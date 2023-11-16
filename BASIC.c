#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_COMMAND_LENGTH 100
#define MAX_USER_LENGTH 50
#define MAX_PASSWORD_LENGTH 50

// Definindo as credenciais de login e senha
const char *login_correto = "root";
const char *senha_correta = "admin";

void listar() {
    system("ls --color=auto");
}

void data() {
    system("date");
}

void versao() {
    printf("PineSync OS Versão 1.0 desenvolvida por GB.\nTodos os direitos reservados.\n13/11/2023\n");
}

void ajuda() {
    printf("Lista de comandos:\n");
    // Adicione os outros comandos aqui...
}

// Adicione funções para outros comandos conforme necessário...

int main() {
    char user[MAX_USER_LENGTH];
    char password[MAX_PASSWORD_LENGTH];

    printf("Bem-vindo ao PineSync OS\n");
    printf("Versão 1.0. Criada por GB\n");
    printf("Digite seus comandos. Para sair, digite 'exit'.\n");
    printf("Para ter uma lista de comandos, digite 'ajuda'\n");

    // Solicitar login
    printf("Login: ");
    scanf("%s", user);

    // Solicitar senha
    printf("Senha: ");
    scanf("%s", password);

    // Verificar login e senha
    if (strcmp(user, login_correto) != 0 || strcmp(password, senha_correta) != 0) {
        printf("Acesso negado. Saindo...\n");
        return 1;
    }

    printf("Acesso concedido. Bem-vindo, %s!\n", user);

    char command[MAX_COMMAND_LENGTH];

    while (1) {
        printf("%s@pineOS$ ", user);
        scanf("%s", command);

        if (strcmp(command, "exit") == 0) {
            printf("Saindo...\n");
            break;
        } else if (strcmp(command, "listar") == 0) {
            listar();
        } else if (strcmp(command, "data") == 0) {
            data();
        } else if (strcmp(command, "versao") == 0) {
            versao();
        } else if (strcmp(command, "ajuda") == 0) {
            ajuda();
        } else {
            printf("Comando não reconhecido. Digite 'ajuda' para obter ajuda.\n");
        }
    }

    return 0;
}
