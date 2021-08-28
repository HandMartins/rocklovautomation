*** Settings ***
Documentation    Implementação da Rota /Equipos  Lembrando que trabalha com binary(form-data)
Library          RequestsLibrary
Library          OperatingSystem

*** Keywords ***
POST EQUIPO
    [Arguments]        ${equipo}    ${token}    
    
    &{headers}         Create Dictionary    user_token=${token}

    ${bin_image}       Get Binary File      C:/git/qa-ninja/ROBOTXPERT/backend/resources/fixtures/equipos/thumbnail/${equipo}[thumb]
    &{thumbnail}      Create Dictionary    thumbnail=${bin_image}

    ${response}        POST          
    ...                ${base_url}/equipos
    ...                data=${equipo}[payload]
    ...                headers=${headers}
    ...                files=${thumbnail}
    ...                expected_status=any

    [Return]           ${response}

GET UNIQUE EQUIPO
    [Arguments]    ${token}    ${equipo_id}

    &{headers}    Create Dictionary    user_token=${token}

    ${response}    Get
    ...            ${base_url}/equipos/${equipo_id}
    ...            headers=${headers}
    ...            expected_status=any

    [Return]       ${response}