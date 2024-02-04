*** Settings ***
Documentation    Playground Git and BDD
Library    SeleniumLibrary

*** Variables ***
${user}    beata.tar@gmail.se
${pass}    monkey1
${url}    https://automationplayground.com/crm/login.html
${speed}    1

*** Test Cases ***
Scenario: Logga in på Playground
    [Documentation]    Logga in på playground
    [Tags]    Test1
    Set Selenium Speed    ${speed}
    Given Användaren är på login sidan
    When Användaren loggar in med sitt namn och pass
    Then Användaren borde vara inloggad
Scenario: Skapa ny customer
    [Documentation]    Skapa ny customer
    [Tags]    Test2
    Given Användaren är på login sidan
    When Användaren loggar in med sitt namn och pass
    Then Användaren borde kunna se texten new customer på sidan
Scenario: Add ny customer
    [Documentation]    Add customer
    [Tags]    Test3
    Given Användaren är inloggad
    When Användaren clickar på new customer knappen
    Then Användaren borde hamna på add customer sidan

    
*** Keywords ***
Användaren är på login sidan
    Open Browser    browser=chrome
    Go To    ${url}

Användaren loggar in med sitt namn och pass
    Input Text    //input[@id='email-id']    ${user}
    Input Password    //input[@id='password']    ${pass}
    Click Button    //button[@id='submit-id']

Användaren borde vara inloggad
    Wait Until Page Contains Element    //input[@placeholder='Search']
Användaren är inloggad
    Open Browser    browser=chrome
    Go To    ${url}
    Input Text    //input[@id='email-id']    ${user}
    Input Password    //input[@id='password']    ${pass}
    Click Button    //button[@id='submit-id']
    Wait Until Page Contains Element    //input[@placeholder='Search']
Användaren clickar på new customer knappen
    Click Element    //a[@id='new-customer']
Användaren borde kunna se texten new customer på sidan
    Wait Until Page Contains Element    //a[@id='new-customer']
Användaren borde hamna på add customer sidan
    Wait Until Page Contains Element    //h2[normalize-space()='Add Customer']



      