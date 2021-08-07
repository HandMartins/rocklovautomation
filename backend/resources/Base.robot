*** Settings ***
Documentation    Arquivo base com as bibliotecas e url usadas
Library          RequestsLibrary

Resource        Helpers.robot
Resource        ../resources/routes/Sessions.robot
Resource        ../resources/routes/Signup.robot


*** Variables ***
${base_url}        https://rocklov-hand-api.herokuapp.com
