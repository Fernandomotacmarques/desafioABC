*** Settings ***
Documentation     Esta suite testa o automationpractice.com/index.php
Resource          resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***
Cenário 01: Usuário tenta criar uma conta sem inserir email
    [Documentation]        Este teste valida mensagem de erro ao tentar criar conta sem inserir e-mail
    [Tags]                 email  createaccount falha
    Dado que o usuário está na tela de “Sign in”
    Quando deixar o campo “Email address” em branco
    E clicar em “Create an account”
    Então deve ser mostrado um alerta informando que o email é inválido
    E o campo deve mostrar a coloração vermelha
Cenário 02: Usuário insere email válido e vai para o formulário de criação de conta
     [Documentation]        Este teste verifica se ao preencher um e-mail válido é aberto o formulário para criação de conta.
     [Tags]                 signin  createaccount
     Dado que o usuário está na tela de “Sign in”
     Quando preencher o campo “Email address” com um email válido
     E clicar em “Create an account”
     Então o usuário deve ser direcionado para o formulário de criação de conta