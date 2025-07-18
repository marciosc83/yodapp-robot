*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***
Deve abrir a tela principal

    Start session

    Wait Until Page Contains    Yodapp             5
    Wait Until Page Contains    Mobile Training    5
    Wait Until Page Contains    by Papito!         5

    Close session