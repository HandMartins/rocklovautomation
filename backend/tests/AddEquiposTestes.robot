*** Settings ***
Documentation     Testes de Tentativas de Login
Resource          ../resources/Base.robot            #${EXECDIR} busca o caminho absoluto
Library           RequestsLibrary



*** Test Cases ***
Add New Equipo   
    
    ${token}           Get Token            xxx@gmail.com    123321

    ${payload}          Get Json          equipos     fender.json

    ${response}         POST EQUIPOS      ${payload}   ${token}    guitarra-strato.png 


    