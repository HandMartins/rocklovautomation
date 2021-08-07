*** Settings ***
Documentation     Testes na rota Signup
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto

Library           RequestsLibrary
Library           FakerLibrary



*** Test Cases ***
Add New User
    ${payload}               Get Json         signup        new_user.json
    Log                      ${payload}
    Remove User By Email     ${payload['email']}
    

    # ${email}      FakerLibrary.Free Email

    # &{payload}    Create Dictionary
    # ...           name=Tony Stark
    # ...           email=${email}
    # ...           password=123321

    ${response}         POST USER        ${payload}
    Status Should Be    200              ${response}


Duplicated Email
    ${payload}               Get Json         signup        duplicated.json
    POST USER                ${payload}
    Log                      ${payload}

    ${response}         POST USER        ${payload}
    Status Should Be    409              ${response}

    Remove User By Email     ${payload['email']}