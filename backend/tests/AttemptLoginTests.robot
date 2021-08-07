*** Settings ***
Documentation     Testes de Tentativas de Login
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
Library           RequestsLibrary
Test Template     Attempt Login                      #1 - Suíte Template


*** Test Cases ***    json_file                status_code            message        #2 - Suíte Template
Incorrect Password    incorrect_password.json    401                Unauthorized
User Not Found        user_not_found.json        401                Unauthorized
Wrong Email           wrong_email.json           412                wrong email
Empty Email           empty_email.json           412                required email
Empty Password        empty_pass.json            412                required password
Without Email        without_email.json          412                required email
Without Password     without_pass.json           412                required password    




*** Keywords ***
Attempt Login                                                        #2 - Suíte Template
    [Arguments]    ${json_file}    ${status_code}    ${message}
    
    ${payload}          Get Json          sessions    ${json_file}
    ${response}         POST LOGIN        ${payload}
    Status Should Be    ${status_code}    ${response}

    Log       ${response.json()}[error]
    
    Should Be Equal    ${message}    ${response.json()}[error]
    