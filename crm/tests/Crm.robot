# Each robot fil will have different sections include settings, variables, test cases and key words  
# These are just txt files with a robot extension

# testing https://automationplayground.com/crm/index.html


#runs the script: robot -d ./crm/results ./crm/tests
*** Settings ***
Documentation    This is an example robot test, make sure to use tabs
Library          SeleniumLibrary    # can provide arguments to this library ex: timeout=0:00:05

*** Variables ***

*** Test Cases ***

Should be able to add a new customer 
    [Documentation]             This is a test description
    [Tags]                      1006    Smoke    Contacts
    Log                         Starting the test case


    # These selenium settings are optional
    #Initialize selenium timeout 
    Set Selenium Timeout        10s
    # Slows down the execution of key words
    # Set Selenium Speed          .2s 

    # Open the chrome browser to this url
    Open Browser                https://automationplayground.com/crm/    chrome


    # Can resize and position the browser (optional)
    Set Window Position         x=0    y=0
    Set Window Size             width=1200    height=1090


    Page Should Contain         Customers Are Priority One!

    # Various different ways to click the link
    # Click Link        Sign In
    # Click Link        login.html
    # Click Link        xpath=...
    # Click Link        css=#SignIn
    Click Link                  id=SignIn

    Page Should Contain         Login

    Input Text                  id=email-id    admin@robotframeworktutorial.com
    Input Text                  id=password    test-pwd
    Click Button                Submit

    Page Should Contain         Our Happy Customers
    
    Click Link                  id=new-customer
    Page Should Contain         Add Customer
    
    Input Text                  id=EmailAddress    test@test.com
    Input Text                  id=FirstName    Joe
    Input Text                  id=LastName    Doe
    Input Text                  id=City    Dallas
    Select From List By Value    id=StateOrRegion    TX
    Select Radio Button         gender    female
    # can also use the selector labels 
    Select Checkbox             locator=promos-name 

    Click Button                 Submit

    Wait Until Page Contains    Success! New customer added.

    Sleep                       3s
    Close All Browsers

*** Keywords ***