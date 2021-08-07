# *** Settings ***
# Documentation     Testes de Login com a API RockLov
# Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
# Library           RequestsLibrary


# *** Test Cases ***
# User Login

#     # &{payload}    Create Dictionary
#     # ...    email=handmartins@gmail.com
#     # ...    password=123321
#     ${payload}    Get Json    user_login.json

#     ${response}    POST LOGIN       ${payload}
#     Status Should Be    200         ${response}

#     Log    ${response.json()}[user_token]

#     ${token}    Set Variable    ${response.json()}[user_token]
#     Length Should Be    ${token}    24


# Incorrect Password
#     [Template]    Attempt Login
#     incorrect_password.json    401    Unauthorized    

#     # &{payload}    Create Dictionary
#     # ...    email=handmartins@gmail.com
#     # ...    password=123

#     # ${payload}    Get Json    incorrect_password.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    401      ${response}
#     # Log    ${response.json()}[error]
#     # Should Be Equal    Unauthorized    ${response.json()}[error]    


# User Not Found
#     [Template]    Attempt Login
#     user_not_found.json    401    Unauthorized

#     # ${payload}     Get Json      user_not_found.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    401      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    Unauthorized    ${response.json()}[error]


# Wrong Email
#     [Template]    Attempt Login
#     wrong_email.json    412    wrong email

#     # ${payload}     Get Json      wrong_email.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    412      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    wrong email    ${response.json()}[error]


# Empty Email
#     [Template]    Attempt Login
#     empty_email.json    412    required email

#     # ${payload}     Get Json      empty_email.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    412      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    required email    ${response.json()}[error]


# Empty Password
#     [Template]    Attempt Login
#     empty_pass.json    412    required password

#     # ${payload}     Get Json      empty_pass.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    412      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    required password    ${response.json()}[error]


# Without Email
#     [Template]    Attempt Login
#     without_email.json    412    required email

#     # ${payload}     Get Json      without_email.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    412      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    required email    ${response.json()}[error]


# Without Password
#     [Template]    Attempt Login
#     without_pass.json    412    required password    

#     # ${payload}     Get Json      without_pass.json
#     # ${response}    POST LOGIN    ${payload}
#     # Status Should Be    412      ${response}
#     # Log       ${response.json()}[error]
#     # Should Be Equal    required password    ${response.json()}[error]     


# *** Keywords ***
# Attempt Login
#     [Arguments]    ${json_file}    ${status_code}    ${message}
    
#     ${payload}          Get Json          ${json_file}
#     ${response}         POST LOGIN        ${payload}
#     Status Should Be    ${status_code}    ${response}

#     Log       ${response.json()}[error]
    
#     Should Be Equal    ${message}    ${response.json()}[error]
    