*** Settings ***

Resource    ../config/package.resource

*** Variables ***
${ERROR_RENOV}    O título de residência que possui não permite a utilização da funcionalidade “renovação automática”. Para mais informações, o Centro de Contacto do SEF está ao seu dispor, todos os dias úteis, das 8:00 às 20:00 através dos números – 808 202 653 (rede fixa) ou 808 962 690 (rede móvel).    
${AR}
${PWD}
${EMAIL}

*** Keywords ***
Executar tentativa de schedule
    [Documentation]    asdasd

    
    Open Browser    https://www.sef.pt/pt/Pages/pre-marcacao-online.aspx   Chrome
    Wait Until Element Is Visible    //*[@id="pnlLogin"]/div
    Click Element    //*[@id="pnlLogin"]/div
    Wait Until Element Is Visible    //*[@id="login-box-id"]/div[2]/div/p
    Input Text    //*[@id="txtUsername"]    ${EMAIL}
    Input Password    //*[@id="txtPassword"]    ${PWD}
    Click Element    //*[@id="btnLogin"]
    Wait Until Element Is Visible    //*[@id="renovacaoAutomaticaLink"]
    Click Element    //*[@id="renovacaoAutomaticaLink"]
    Wait Until Element Is Visible    //*[@id="txtAuthPanelPassword"]
    Input Password    //*[@id="txtAuthPanelPassword"]    ${PWD}
    Input Text    //*[@id="txtAuthPanelDocument"]     ${AR}
    Click Button    //*[@id="btnAutenticaUtilizador"]
    Element Should Contain    //*[@id="ctl00_ctl53_g_49abea8d_9129_4f50_bf46_33662dfac0a6_ctl00_lblAuthError"]
    ...        ${ERROR_RENOV}    
    ...    PROVAVELMENTE DÁ PRA RENOVAR!


Carregar Variaveis

    Load Env File

    Set Log Level    NONE  
    ${PWD}    Get Env Variable    SENHA    
    LOG    ${PWD}    formatter=repr
    VAR    ${PWD}    ${PWD}    scope=SUITE 
    ${EMAIL}    Get Env Variable    EMAIL
    VAR    ${EMAIL}    ${EMAIL}    scope=SUITE    
    ${AR}    Get Env Variable    ARDOC
    VAR    ${AR}    ${AR}    scope=SUITE
    Set Log Level    INFO    

    RETURN    