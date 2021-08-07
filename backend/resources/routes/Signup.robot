*** Settings ***
Documentation    Implementação da Rota / Signup
Library          RequestsLibrary


*** Keywords ***
POST USER
    [Arguments]        ${payload}
    
    ${response}        POST          
    ...                ${base_url}/signup    
    ...                json=${payload}
    ...                expected_status=any

    [Return]           ${response}