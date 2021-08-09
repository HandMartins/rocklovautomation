*** Settings ***
Documentation     Tentativas de Acesso usando um único arquivo como massa attempt.json
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
Library           RequestsLibrary
Test Template     Attempt Signup                      #1 - Suíte Template


*** Test Cases ***            scenario              message        #3 - Suíte Template pegando a massa de um único arquivo
Empty Name                    empty_name            required name
Empty Email                   empty_email           required email
Empty Password                empty_password        required password
Without Name                  without_name          required name
Without Email                 without_email         required email
Without Password              without_password      required password
Wrong Email                   wrong_email           wrong email




*** Keywords ***
Attempt Signup                                                        #2 - Suíte Template
    [Arguments]    ${scenario}    ${message}
    
    ${attempt_payload}          Get Json          signup        attempt.json

    ${response}         POST USER         ${attempt_payload['${scenario}']}
    Status Should Be    412    ${response}

    Log       ${response.json()}[error]
    
    Should Be Equal    ${message}    ${response.json()}[error]
    