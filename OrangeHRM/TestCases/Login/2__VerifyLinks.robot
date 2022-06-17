*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/Keywords/LoginPageKeywords.robot

*** Test Cases ***
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