*** Settings ***
Documentation     Testes de Tentativas de Login
Resource          ../resources/Base.robot    #${EXECDIR} busca o caminho absoluto



*** Test Cases ***
Add New Equipo
    ${token}        Get Token        handmartins@gmail.com        123321
    ${equipo}      Get Json         equipos                      fender.json

    Remove Equipo    ${equipo}[payload][name]

    ${response}     POST EQUIPO     ${equipo}    ${token}       
    Status Should Be    200    ${response}

    
