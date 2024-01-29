*** Settings ***
Documentation     This is a sample test suite using Robot Framework
Library           SeleniumLibrary
Suite Setup       Open Browser    http://automationexercise.com   chrome



*** Variables ***
${name}          chekchamp
${email}         chekchamp@gmail.com   
${subject}       Subject test
${message}       message test message test
${selectedfile}  ${CURDIR}/licking_cat.jpg
${uploadfilepath}    xpath=//input[@type="file"]


*** Keywords ***

Click Contact Us Element
    Click Element       //*[@id="header"]/div/div/div/div[2]/div/ul/li[8]/a

Input name
    [Arguments]    ${name}
    Input Text    //*[@name="name"]    ${name}

Input email
    [Arguments]    ${email}
    Input Text    //*[@name="email"]    ${email}

Input subject
    [Arguments]    ${subject}
    Input Text    //*[@name="subject"]    ${subject}

Input message
    [Arguments]    ${message}
    Input Text    //*[@name="message"]    ${message}

Click Submit Button
    Click Button    //*[@id="contact-us-form"]/div[6]/input

Click Home Element
    Click Element    //*[@id="form-section"]/a

*** Test Cases ***
Contact Us 
   [Documentation]    Test the login functionality with valid credentials

   Click Contact Us Element
   Page Should Contain    Get In Touch

   Input name                   ${name}
   Input email                  ${email}
   Input subject                ${subject}
   Input message                ${message}
   Choose File    ${uploadfilepath}    ${selectedfile}

   Click Submit Button
   Handle Alert     
   Page Should Contain    Success! Your details have been submitted successfully.

   Click Home Element
   Page Should Contain    Features Items




 