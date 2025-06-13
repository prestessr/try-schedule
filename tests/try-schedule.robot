*** Settings ***
Documentation    Este teste serve meramente para tentar agendar a tão aguardada renovação de AR :)

Resource    ../resources/try-schedule.resource
Suite Setup    Carregar Variaveis
Test Teardown    Close Browser

*** Test Cases ***
Verificar Se A Renovação Automática Ainda Encontra-se Indisponível
    Executar Tentativa De Agendamento Online