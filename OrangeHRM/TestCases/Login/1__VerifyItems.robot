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

HO-39: Verify that all links in login page work correctly
    Go To Login Page
    Verify Forgot Passwork Link
    Go To Login Page
    Verify OrangeHRM Link
    Go To Login Page
    Verify Linkedin Button
    Go To Login Page
    Verify Facebook Button
    Go To Login Page
    Verify Twitter Button
    Go To Login Page
    Verify Youtube Button