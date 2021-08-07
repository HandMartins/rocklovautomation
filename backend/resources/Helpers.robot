*** Settings ***
Documentation    Teremos KWs de ajuda

Library    OperatingSystem

*** Keywords ***
Get Json
    [Arguments]    ${route}    ${file_name}

    ${fixture}    Get File    C:/git/qa-ninja/ROBOTXPERT/backend/resources/fixtures/${route}/${file_name}
    ${json}       Evaluate    json.loads($fixture)    json

    [Return]    ${json}