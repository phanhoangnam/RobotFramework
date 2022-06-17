*** Settings ***
Resource    ../../Resources/Keywords/CommonKeywords.robot
Suite Setup  Open My Browser    ${url}    ${browser}
Suite Teardown  Close My Browser

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/
${browser}    chrome