*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${wikipedia_login}    RobotTests
${wikipedia_password}    RobotFramework
${error_message}    Podany login lub hasło są nieprawidłowe. Spróbuj jeszcze raz.

*** Keywords ***
Log In Wikipedia
    [Arguments]    ${login}    ${password}
    Open Browser    https://pl.wikipedia.org    chrome    #executable_path=C:/chromedriver/chromedriver.exe
    Click Element    id:pt-login
    ${my_value}    get text     id:wpName1
    Should Be Empty    ${my_value}
    Input Text    id:wpName1    ${login}
    Input Password    id:wpPassword1    ${password}
    Checkbox Should Not Be Selected    wpRemember
    Select Checkbox    wpRemember
    click button    id:wpLoginAttempt

*** Test Cases ***

Successful login to Wikipedia
    Log In Wikipedia    ${wikipedia_login}    ${wikipedia_password}
    Capture Page Screenshot
    Close Browser

Unsuccessful login to Wikipedia
    Log In Wikipedia    ${wikipedia_login}    abcd
    Wait Until Element Is Visible    //*[@id="userloginForm"]/form/div[1]    3
    ${current_error_message}    get text    //*[@id="userloginForm"]/form/div[1]
    Log    ${current_error_message}
    log to console    ${current_error_message}
    Should Be Equal As Strings    ${current_error_message}    ${error_message}

    Capture Page Screenshot
    Close Browser

#Search in Wikipedia - Border Colie
#    Log In Wikipedia    ${wikipedia_login}    ${wikipedia_password}
#    Input Text    id:searchInput   Border Colie
#    Close Browser
#
#Search in Wikipedia - bad word
#    Log In Wikipedia    ${wikipedia_login}    ${wikipedia_password}
#    Input Text    id:searchInput   k***a
#    Close Browser
