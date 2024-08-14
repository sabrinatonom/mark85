*** Settings ***
Documentation       Cenário de testes do cadastro de usuários com dados faker, usado apenas para base de estudos

Library        FakerLibrary

Resource    ../resources/base.resource

*** Test Cases ***
Deve poder cadastrar um novo usuário

    ${name}        FakerLibrary.Name
    ${email}       FakerLibrary.Email
    ${password}    Set Variable    pdw123

    Start Session
    Go To    http://localhost:3000/signup

    # Checkpoint
    Wait For Elements State    css=h1    visible    5
    Get Text    css=h1    equal    Faça seu cadastro

    Fill Text        id=name        ${name}
    Fill Text        id=email       ${email}
    Fill Text        id=password    ${password}
    Click            id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.