*** Settings ***
Library  SeleniumLibrary
Test Setup  Open My Browser

*** Variables ***
@{emails}  email1@wwwp.pl  email2@wwwp.pl   email3@wwwp.pl   email4@wwwp.pl   email5@wwwp.pl
@{passwords}  pass1  pass2  pass3  pass4  pass5
${message}    Dziękujemy za założenie nowego konta.

*** Keywords ***
Open My Browser
    Open Browser    https://gotujmy.pl/forum/    Chrome
    Run Keyword And Ignore Error    Click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
Registration In Forum
    [Arguments]  ${name}
    Click Element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    input text    //*[@id="f_cmu_email"]    ${name}
    input text    //*[@id="f_cmu_email2"]    ${name}
    input text    //*[@id="f_cmu_password"]    12345
    input text    //*[@id="f_cmu_password2"]    12345
    Checkbox Should Not Be Selected    //*[@id="newsletter_agree"]
    select checkbox    //*[@id="newsletter_agree"]
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[2]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[2]/input
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[3]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[3]/input
    Click Button     //*[@id="user_register_form"]/fieldset/footer/button
    Wait Until Element Is Visible  //*[@id="main_content"]/div/div/h1  timeout=7
    ${my_message}  Get Text  //*[@id="main_content"]/div/div/h1
    Log To Console  ${my_message}
    Should Be Equal As Strings  ${my_message}  ${message}
#    Capture Page Screenshot

*** Test Cases ***
Registration Of Multiple Users
    FOR    ${email}   IN   @{emails}
        Registration In Forum  ${email}
    END