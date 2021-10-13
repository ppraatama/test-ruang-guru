*** Settings ***
Resource            ../../Frameworks/Routers.robot

*** Keywords ***
Open Normal Browser
    [Arguments]     ${URL}
    Open Browser                ${URL_BLANK}      ${BROWSER}
    Maximize Browser Window
    Go To                       ${URL}