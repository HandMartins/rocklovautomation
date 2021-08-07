*** Settings ***
Documentation     Testes de Login com a API RockLov de Sucesso
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
Library           RequestsLibrary


*** Test Cases ***
User Login
    ${payload}         Get Json         sessions    user_login.json

    ${response}        POST LOGIN       ${payload}
    Status Should Be   200              ${response}

    Log                ${response.json()}[user_token]

    ${token}           Set Variable     ${response.json()}[user_token]
    Length Should Be   ${token}         24

    