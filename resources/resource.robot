*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../pageobject/flipkartPage.robot

*** Variables ***
${url}  https://www.flipkart.com/
${browserName}  chrome

*** Keywords ***
Open a Browser
    Open Browser    ${url}    ${browserName}
    Maximize Browser Window

Close Pop Up Dialog Box
    Wait Until Element Is Visible    ${btn_popBtn}    10s
    Click Element    ${btn_popBtn}

Search Watch and Press Enter
    Input Text    ${txt_searchBox}    Watch
    Press Keys    ${txt_searchBox}    ENTER
    Sleep    5

Select 3rd Product from First Row
    ${count}=    Get Element Count    ${txt_productCount}
    FOR    ${i}    IN RANGE    1    ${count}+1
        IF    ${i} == 3
            ${productPrice}=    Get Text    (//div[@class='p0C73x']//div[contains(@class,'hZ3P6w')])[${i}]
            ${actualProductPrice}=    Evaluate    int("${productPrice}".replace("₹","").strip())
            Log To Console    Price: ${actualProductPrice}
            Click Element    (//div[@class='p0C73x']/a[@class='atJtCj'])[${i}]
            Set Test Variable    ${actualProductPrice}
            Exit For Loop
        END
    END
    Sleep    5

Switch to New Window
    Switch Window    NEW
    Wait Until Element Is Visible    ${txt_getProductTitle}    10s

Get PDP Product Price
    ${price1}=    Get Text    ${txt_getProductPrice}
    Log To Console    PDP Price: ${price1}
    ${productPrice}=    Evaluate    int("${price1}".replace("₹","").strip())
    Set Test Variable    ${productPrice}
    RETURN    ${productPrice}

Add To Cart and Navigate
    Wait Until Element Is Visible    ${btn_addtoCart}    10s
    Click Element    ${btn_addtoCart}
    Click Element    ${btn_cartIcon}

Get Cart Product Price
    Wait Until Element Is Visible    ${txt_cartPageProductPrice}    10s
    ${cartPageProductPrice}=    Get Text    ${txt_cartPageProductPrice}
    Log To Console    Cart Price: ${cartPageProductPrice}
    ${cartProductPrice}=    Evaluate    int("${cartPageProductPrice}".replace("₹","").strip())
    RETURN    ${cartProductPrice}

Close Browser Session
    Close Browser
