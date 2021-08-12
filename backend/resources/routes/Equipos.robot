*** Settings ***
Documentation    Implementação da Rota /Equipos  Lembrando que trabalha com binary(form-data)
Library          RequestsLibrary
Library          OperatingSystem

*** Keywords ***
POST EQUIPOS
    [Arguments]        ${payload}    ${token}    ${image_file}
    
    &{headers}         Create Dictionary    user_token=${token}

    ${bin_image}       Get Binary File    C:/git/qa-ninja/ROBOTXPERT/backend/resources/fixtures/equipos/fotos/${image_file}
    &{thumbnaill}      Create Dictionary    thumbnaill=${bin_image}

    ${response}        POST          
    ...                ${base_url}/equipos    
    ...                data=${payload}
    ...                headers=${headers}
    ...                files=${thumbnaill}
    ...                expected_status=any

    [Return]           ${response}