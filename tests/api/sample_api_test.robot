*** Settings ***
Documentation       Use following command to run the test
...                 robot -d results .\tests\api\sample_api_test.robot

Library                 RequestsLibrary
Library                 Collections

Resource                ../../resources/keywords.resource
Resource                ../../resources/variables.resource

Suite Setup             Ignore Python Warnings


*** Variables ***
${BASE_URL}             https://reqres.in
${GET_ENDPOINT}         /api/users/2
${POST_ENDPOINT}        /api/users


*** Test Cases ***
GET User Details
    [Tags]    api    get
    Create Session    reqres    ${BASE_URL}
    ${response}=    GET On Session    reqres    ${GET_ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.json()}    data
    Log    ${\n}User Found: ${response.json()['data']['first_name']}${\n}    console=True


Create New User
    [Tags]    api    post
    Create Session    reqres    ${BASE_URL}    # headers=${HEADERS}
    ${payload}=    Create Dictionary    name=John    job=Devloper
    ${response}=    POST On Session    reqres    ${POST_ENDPOINT}    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    201
    Log    ${\n}Created: ${response.json()}${\n}    console=True
