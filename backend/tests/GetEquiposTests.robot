*** Settings ***
Documentation    Testes com a busca de equipamentos

Resource        ../resources/Base.robot


*** Test Cases ***
#Dado que eu tenho um equipo cadastrado
Get Unique Equipo
    ${token}         Get Token    sambora@bonjovi.com    pwd123
    ${equipo}        Get Json     equipos                piano.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST EQUIPO              ${equipo}              ${token}
    ${equipo_id}     Set Variable             ${result.json()}[_id]

#Quando faço uma requisição GET para a rota equipos
    ${response}      GET UNIQUE EQUIPO        ${token}    ${equipo_id}

#Então o cód de status deve ser 200
    Status Should Be    200    ${response}

    Should Be Equal    ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]       ${response.json()}[price]

   