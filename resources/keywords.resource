*** Settings ***
Library    SSHLibrary

Resource        variables.resource


*** Keywords ***
Ignore Python Warnings
    Import Library      warnings
    Evaluate            warnings.filterwarnings("ignore")

Open Connection And Login To Server
    [Arguments]     ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}
    Open Connection    ${HOST}    port=${PORT}
    Login    ${USERNAME}    ${PASSWORD}