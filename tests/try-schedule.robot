*** Settings ***
Documentation    Aqui fica o teste

Resource    ../resources/try-schedule.resource
Suite Setup    Carregar Variaveis
Test Teardown    Close Browser

*** Test Cases ***
Verificar se ainda NÃO está disponível a renovação automática 
    Executar tentativa de schedule