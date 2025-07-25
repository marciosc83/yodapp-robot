*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***
Deve selecionar o nível Padawan

    Start session
    Get started
    Navigate to      Formulários
    Go to item       Cadastro       Crie sua conta.

    Select level    Padawan

    Close session

Deve selecionar o nível Jedi

    Start session
    Get started
    Navigate to      Formulários
    Go to item       Cadastro       Crie sua conta.

    Select level    Jedi

    Close session

Deve selecionar o nível Sith

    Start session
    Get started
    Navigate to      Formulários
    Go to item       Cadastro       Crie sua conta.

    Select level    Sith

    Close session

Deve selecionar o nível Outros

    Start session
    Get started
    Navigate to      Formulários
    Go to item       Cadastro       Crie sua conta.

    Select level    Outros

    Close session

*** Keywords ***
Select level
    [Arguments]                      ${level}
    Click Element                    id=com.qaxperience.yodapp:id/spinnerJob
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text                       ${level}