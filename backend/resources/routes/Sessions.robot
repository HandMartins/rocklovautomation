*** Settings ***
Documentation    Implementação da Rota / Sessions
Library          RequestsLibrary


*** Keywords ***
POST LOGIN
    [Arguments]        ${payload}
    
    ${response}        POST          
    ...                ${base_url}/sessions    
    ...                json=${payload}
    ...                expected_status=any

    [Return]           ${response}