*** Settings ***
Library        SeleniumLibrary
Library        XML

*** Variables ***
${URL}                         http://automationpractice.com/index.php?controller=authentication&back=my-account
${SIGN_IN}                     //a[@class='login'][contains(.,'Sign in')]
${EMAIL}                       //input[@type='text'][contains(@id,'create')]
${CREATE_ACCOUNT}              //span[contains(.,'Create an account')]
${EMAIL_TEXTO}                 fernando@fernando.com.br
${VALIDA_FORMULARIO}           //h1[contains(.,'Create an account')]
${LOCAL_COR}                   css=.form-group.form-error input


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
    
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que o usuário está na tela de “Sign in”
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${SIGN_IN}

Quando deixar o campo “Email address” em branco
   Input Text    locator=${EMAIL}    text=

E clicar em “Create an account”
    Click Element    locator=${CREATE_ACCOUNT}

Então deve ser mostrado um alerta informando que o email é inválido
    Wait Until Page Contains    text=Invalid email address

E o campo deve mostrar a coloração vermelha
    Wait Until Element Is Visible       locator=${LOCAL_COR} 

Quando preencher o campo “Email address” com um email válido
   Input Text    locator=${EMAIL}    text=${EMAIL_TEXTO}

Então o usuário deve ser direcionado para o formulário de criação de conta
     Wait Until Element Is Visible    locator=${VALIDA_FORMULARIO}