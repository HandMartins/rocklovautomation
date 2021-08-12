*** Settings ***
Documentation    Arquivo base com as bibliotecas e url usadas
Library          RequestsLibrary
Library          ../resources/libs/mongo.py

Resource        Helpers.robot
Resource        ../resources/routes/Sessions.robot
Resource        ../resources/routes/Signup.robot
Resource        ../resources/routes/Equipos.robot




*** Variables ***
${base_url}        https://rocklov-hand-api.herokuapp.com
