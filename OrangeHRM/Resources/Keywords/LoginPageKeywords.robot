*** Settings ***
Library    SeleniumLibrary
Library    ../../Libraries/MyLibrary.py
Variables    ../PageObjects/LoginPageLocators.py
Resource    ./CommonKeywords.robot

*** Keywords ***
Verify All Items Should Be Visible
    element should be visible    ${logo_orangeHRM}

    element should be visible    ${txt_account}
    ${text_account} =  get text    ${txt_account}
    should be equal    ${text_account}    ( Username : Admin | Password : admin123 )
    ${attribute_account} =    Get CSS Value    ${txt_account}    color
    ${color_hex} =    transform RGBA to HEX    ${attribute_account}
    should be equal    ${color_hex}    \#ff0000

    element should be visible    ${logo_hrForAll_1}
    element should be visible    ${logo_hrForAll_2}
    element should be visible    ${logo_hrForAll_3}

    element should be visible    ${txt_loginPanel}
    ${text_loginPanel} =  get text    ${txt_loginPanel}
    should be equal    ${text_loginPanel}    LOGIN Panel
    ${attribute_loginPanel} =    Get CSS Value    ${txt_loginPanel}    color
    ${color_hex} =    transform RGBA to HEX    ${attribute_loginPanel}
    should be equal    ${color_hex}    \#000000

    element should be visible    ${background_txt_loginPanel}

    element should be visible    ${txt_username}
    ${text_hint_username} =    get text    ${txt_hint_username}
    should be equal    ${text_hint_username}    Username
    element should be visible    ${icon_person}

    element should be visible    ${txt_password}
    ${text_hint_password} =    get text    ${txt_hint_password}
    should be equal    ${text_hint_password}    Password
    element should be visible    ${icon_password}

    element should be visible    ${btn_login}
    ${text_btn_login} =    get value    ${btn_login}
    should be equal    ${text_btn_login}    LOGIN
    ${attribute_btn_login} =    Get CSS Value    ${btn_login}    color
    ${color_hex} =    transform RGBA to HEX    ${attribute_btn_login}
    should be equal    ${color_hex}    \#ffffff

    element should be visible    ${background_btn_login}

    element should be visible    ${link_forgotPassword}
    ${text_forgotPassword} =    get text    ${link_forgotPassword}
    should be equal    ${text_forgotPassword}    Forgot your password?
    ${text_decoration_link_forgotPassword} =    Get CSS Value    ${link_forgotPassword}    text-decoration
    should contain    ${text_decoration_link_forgotPassword}    underline

    element should be visible    ${txt_footer}
    ${text_footer} =    get text    ${txt_footer}
    should be equal    ${text_footer}    OrangeHRM 4.10.1\n© 2005 - 2022 OrangeHRM, Inc. All rights reserved.
    ${text_decoration_link_footer} =    Get CSS Value    ${link_footer}    text-decoration
    should contain    ${text_decoration_link_footer}    underline

    element should be visible    ${btn_linkedin}

    element should be visible    ${btn_facebook}

    element should be visible    ${btn_twitter}

    element should be visible    ${btn_youtube}

Click On Username Box
    click element    ${txt_username}
    element should not be visible    ${txt_hint_username}
    element should be visible    ${txt_hint_password}

Input Value Into The Username Box
    [Arguments]    ${username}
    input text    ${txt_username}    ${username}
    textfield value should be    ${txt_username}    ${username}
    textfield value should be    ${txt_password}    ${EMPTY}

Delete Input Value And Click Outside The Username Box
    clear element text    ${txt_username}
    textfield value should be    ${txt_username}    ${EMPTY}
    click element    ${txt_account}
    element should be visible    ${txt_hint_username}

Click On Password Box
    click element    ${txt_password}
    element should not be visible    ${txt_hint_password}
    element should be visible    ${txt_hint_username}

Input Value Into The Password Box
    [Arguments]    ${passwprd}
    input text    ${txt_password}    ${passwprd}
    textfield value should be    ${txt_password}    ${passwprd}
    ${type_txt_password} =    get element attribute    ${txt_password}    type
    should be equal    ${type_txt_password}    password
    textfield value should be    ${txt_username}    ${EMPTY}

Delete Input Value And Click Outside The Password Box
    clear element text    ${txt_password}
    textfield value should be    ${txt_password}    ${EMPTY}
    click element    ${txt_account}
    element should be visible    ${txt_hint_password}

Verify Forgot Passwork Link
    click element    ${link_forgotPassword}
    location should be    https://opensource-demo.orangehrmlive.com/index.php/auth/requestPasswordResetCode

Go To Login Page
    go to    https://opensource-demo.orangehrmlive.com/
    title should be    OrangeHRM

Verify OrangeHRM Link
    click element    ${link_footer}
    switch window    NEW
    location should be    https://www.orangehrm.com/
    close window
    switch window    MAIN

Verify Linkedin Button
    click element    ${btn_linkedin}
    switch window    NEW
    location should be    http://www.linkedin.com/groups?home=&gid=891077
    close window
    switch window    MAIN

Verify Facebook Button
    click element    ${btn_facebook}
    switch window    NEW
    location should be    https://www.facebook.com/OrangeHRM
    close window
    switch window    MAIN

Verify Twitter Button
    click element    ${btn_twitter}
    switch window    NEW
    location should be    https://twitter.com/orangehrm
    close window
    switch window    MAIN

Verify Youtube Button
    click element    ${btn_youtube}
    switch window    NEW
#    title should be    OrangeHRM Inc - YouTube
    location should be    https://www.youtube.com/orangehrm
    close window
    switch window    MAIN

Enter Username
    [Arguments]    ${username}
    input text    ${txt_username}    ${username}

Enter Password
    [Arguments]    ${password}
    input text    ${txt_password}    ${password}

Click Login Button
    click element    ${btn_login}

Verify Successful Login
    location should be    https://opensource-demo.orangehrmlive.com/index.php/dashboard
    page should contain    Welcome

Verify Unsuccessful Login
    [Arguments]    ${error_message}
    ${message} =    get text    ${txt_errorMessage}
    should be equal    ${message}    ${error_message}