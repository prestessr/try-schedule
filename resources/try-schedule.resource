*** Settings ***

Resource    ../config/package.resource
Resource    ../config/DOM.resource

*** Variables ***
${EXPECT_1}    O seu processo está em análise.
${EXPECT_2}    Se for necessário apresentar qualquer documento adicional, será contactado para o efeito.
${PWD}
${EMAIL}
${PAGE}    https://portal-renovacoes.aima.gov.pt/ords/r/aima/aima-pr/pr-home

*** Keywords ***
Executar Tentativa De Agendamento Online
    [Documentation]    fluxo completo de tentativa de agendamento

    
    Open Browser    ${PAGE}   Chrome
    Wait Until Element Is Visible    ${BTN_ENTRAR}
    Wait Until Element Is Visible    ${LINK_PORTAL}
    Click Element    ${LINK_PORTAL}
    Switch Window    title=Serviços - AIMA
    Wait Until Element Is Visible    ${CHECKPOINT_PORTAL}
    Click Element    ${LINK_AREA_PESSOAL}
    Input Text    ${FORM_EMAIL}    ${EMAIL}
    Input Password    ${FORM_PWD}    ${PWD}
    Click Element    ${BTN_LOGIN}
    Wait Until Element Is Visible    ${CHECKPOINT_AREA_PESSOAL}

    Element Should Contain  ${STATUS_analise}
    ...        ${EXPECT_1}    
    ...    Provavelmente houve alteração de Status

    Element Should Contain   ${STATUS_analise}
    ...        ${EXPECT_2}    
    ...    Provavelmente houve alteração de Status


Carregar Variaveis

    Load Env File

    Set Log Level    NONE  
    ${PWD}    Get Env Variable    SENHA    
    LOG    ${PWD}    formatter=repr
    VAR    ${PWD}    ${PWD}    scope=SUITE 
    ${EMAIL}    Get Env Variable    EMAIL
    VAR    ${EMAIL}    ${EMAIL}    scope=SUITE    
    Set Log Level    INFO    

    RETURN    