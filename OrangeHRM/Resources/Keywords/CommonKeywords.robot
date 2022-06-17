*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open My Browser
    [Arguments]    ${url}    ${browser}
    open browser    ${url}    ${browser}
    maximize browser window
    set browser implicit wait    15

Close My Browser
    close all browsers

Get CSS Value
    [Arguments]    ${locator}    ${css_property}
    ${css} =         get webelement    ${locator}
    ${css_value} =    call method    ${css}    value_of_css_property    ${css_property}
    [Return]    ${css_value}