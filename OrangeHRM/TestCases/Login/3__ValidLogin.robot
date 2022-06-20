*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Keywords/LoginPageKeywords.robot
Variables    ../../Resources/TestDatas/ValidLoginData.py

*** Test Cases ***
HO-22: Verify that login functionality works correctly with the valid account
    Go To Login Page
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login Button
    Verify Successful Login