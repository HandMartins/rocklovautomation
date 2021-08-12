*** Settings ***
Documentation    Teremos KWs de ajuda

Library    OperatingSystem
Resource    routes/Sessions.robot

*** Keywords ***
Get Json
    [Arguments]    ${route}    ${file_name}

    ${fixture}    Get File    C:/git/qa-ninja/ROBOTXPERT/backend/resources/fixtures/${route}/${file_name}
    ${json}       Evaluate    json.loads($fixture)    json

    [Return]    ${json}

Get Token
    [Arguments]     ${email}    ${password}

    &{payload}    Create Dictionary    email=${email}    password=${password}

    ${response}      POST LOGIN      ${payload}
    ${user_token}    Set Variable    ${response.json()}[user_token]

    [Return]    ${user_token} 