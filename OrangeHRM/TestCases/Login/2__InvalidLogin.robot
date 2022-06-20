*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Keywords/LoginPageKeywords.robot
Library    DataDriver    ../../Resources/TestDatas/InvalidLoginData.csv
Test Template  Invalid login

*** Test Cases ***
Test case invalid login

*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}    ${error_message}
    Go To Login Page
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Verify Unsuccessful Login    ${error_message}