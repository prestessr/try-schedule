*** Settings ***
Documentation    Este teste serve meramente para tentar agendar a tão aguardada renovação de AR :)

Resource    ../resources/try-schedule.resource
Suite Setup    Carregar Variaveis
Test Teardown    Close Browser

*** Test Cases ***
Verificar Se A Renovação Automática Ainda Encontra-se Indisponível
    [Documentation]    Verifica em qual status ainda se encontra
    Acessar Portal
    Fazer Login
    Verificar Status "O seu processo está a aguardar a decisão por parte da AIMA."
