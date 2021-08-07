*** Settings ***
Documentation     Testes na rota Signup
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
Library           RequestsLibrary


*** Test Cases ***
Add New User
    ${payload}          Get Json         signup        new_user.json
    ${response}         POST USER        ${payload}
    Status Should Be    200              ${response}
