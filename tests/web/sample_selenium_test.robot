*** Settings ***
Documentation       Use following command to run the test
...                 robot -d results .\tests\api\sample_selenium_test.robot

Library    SeleniumLibrary

# import resources
Resource    ../../resources/variables.resource
Resource    ../../resources/keywords.resource


*** Variables ***


*** Test Cases ***
Open Webpage And Handle Errors
    [Tags]    smoke
    Open Browser To Page
    [Teardown]    Close Browser


*** Keywords ***
Open Browser To Page
    Run Keyword And Ignore Error    Open Browser And Wait

Open Browser And Wait
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    //body    timeout=10s