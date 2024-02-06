*** Settings ***
Documentation       Logga in och skapa ny kund i Automation Playground
Library             SeleniumLibrary
Suite Setup

*** Variables ***
${EmailAddress}    hassan.mire@iths.se
${PASSWORD}         password
${BASE_URL}         https://automationplayground.com/crm/

*** Test Cases ***
Logga in
    [Documentation]    Logga in på Customer Service-portalen
    [Tags]             Logga in
    Open Browser       ${BASE_URL}login.html    chrome
    Input Text        id=email-id              ${EmailAddress}
    Input Text         id=password              ${PASSWORD}
    Click Element      id=remember
    Click Element      css=button[type="submit"]

Skapa ny kund
    [Documentation]    Skapa en ny kund i CRM
    [Tags]             Skapa kund
    Open Browser       ${BASE_URL}customers.html    chrome



Klicka på "Add Customer"
    [Documentation]    Klicka på knappen "Add Customer"
   Click Element    css=a#new-customer

Fyll i kundinformation
    [Documentation]    Fyll i kundinformation
    Input Text          id=EmailAddress         test@gmail.com
    Input Text         id=FirstName             Hassan
    Input Text         id=LastName              Mire
    Input Text         City                     Boras
    Select From List by Value    id=StateOrRegion    NY
    Click Element    xpath=//input[@value='male']


Markera "Add to promotional list"
    [Documentation]    Markera kryssrutan "Add to promotional list"
    Click Element      css=button.btn.btn-primary


Klicka på "Submit"
    [Documentation]    Klicka på knappen "Submit"
   Click Element      css=button[type="submit"]

Verifiera att lyckad meddelande visas
    [Documentation]    Verifiera att ett lyckat meddelande visas
    Wait Until Page Contains Element    css=#Success.alert-success
    ${success_message}    Get Text    css=#Success.alert-success
    Should Contain    ${success_message}    Success! New customer added.