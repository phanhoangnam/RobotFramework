*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Keywords/LoginPageKeywords.robot

*** Test Cases ***
HO-21: Verify that all items in login page display correctly
    Go To Login Page
    Verify All Items Should Be Visible
    Click On Username Box
    Input Value Into The Username Box    Admin
    Delete Input Value And Click Outside The Username Box
    Click On Password Box
    Input Value Into The Password Box    Admin
    Delete Input Value And Click Outside The Password Box