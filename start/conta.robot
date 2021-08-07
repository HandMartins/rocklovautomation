***Settings***
Documentation   Suite para testar a classe ContaLibrary
Library         ../start/app/ContaLibrary.py

***Test Cases***
Quando abro uma nova conta deve retornar saldo Zerado
    Abrir Conta
    
    ${saldo}               Obter Saldo
    ${saldo_esperado}      Convert To Number    0.0

    Should Be Equal        ${saldo}    ${saldo_esperado}

    Log                    ${saldo}

Quando faco um deposito deve refletir o valor do saldo    
    Abrir Conta
    
    ${valor_deposito}          Convert To Number    500
    Deposita                   ${valor_deposito}

    ${saldo_final}             Obter Saldo

    Should Be Equal            ${valor_deposito}    ${saldo_final}

    Log To Console             Valor deposito: ${valor_deposito}
    ...                        Valor Final: ${saldo_final}


Quando faço um saque deve deduzir o valor do meu saldo
    Abrir Conta
    
    ${valor_deposito}          Convert To Number             1000
    Deposita                   ${valor_deposito}

    ${valor_saque}            Convert To Number                200
    Saca                      ${valor_saque}

    ${saldo_esperado}         Evaluate    ${valor_deposito} - ${valor_saque} - 2
    ${saldo_final}            Obter Saldo


    Should Be Equal           ${saldo_final}    ${saldo_esperado}

    Log To Console            Saldo final Atual: ${saldo_final}    
    ...                       Resultado final Atual: ${saldo_esperado}

