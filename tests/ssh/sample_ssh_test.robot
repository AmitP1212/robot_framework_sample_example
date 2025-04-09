*** Settings ***
Documentation       Use following command to run the test
...                 robot -d results .\tests\api\sample_ssh_test.robot

Library         SSHLibrary

Resource        ../../resources/keywords.resource
Resource        ../../resources/variables.resource


*** Variables ***
${COMMAND}      uptime      # this must return uptime of the machine


*** Test Cases ***
Check Disk Space Over SSH
    [Tags]    ssh
    Open Connection And Login To Server    ${HOST}    ${PORT}    ${USERNAME}    ${PASSWORD}

    ${output}=    Execute Command    ${COMMAND}    return_stdout=True
    Log    ${output}    console=True

    Close Connection
