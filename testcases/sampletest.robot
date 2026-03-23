*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../resources/resource.robot

*** Test Cases ***
Flipkart End To End Test
    [Documentation]    Search for Watch in Flipkart, select 3rd product, verify prices match
    
    Open a Browser
    Close Pop Up Dialog Box
    Search Watch and Press Enter
    Select 3rd Product from First Row
    Switch to New Window
    ${pdpPrice}=    Get PDP Product Price
    Should Be Equal    ${actualProductPrice}    ${pdpPrice}
    Add To Cart and Navigate
    ${cartPrice}=    Get Cart Product Price
    Should Be Equal    ${cartPrice}    ${pdpPrice}
    Sleep    2
    Close Browser Session
