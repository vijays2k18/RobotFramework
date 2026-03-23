*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Home Page Locators
${btn_popBtn}                   xpath=//*[contains(@class,'b3wTlE')]
${txt_searchBox}                xpath=//input[@name='q']

# Product List Page Locators
${txt_productCount}             xpath=//div[@class='p0C73x']/a[@class='atJtCj']
${txt_productTitle}             xpath=//div[@class='p0C73x']/a[@class='atJtCj']
${txt_productPrice}             xpath=//div[@class='p0C73x']//div[contains(@class,'hZ3P6w')]

# Product Details Page Locators
${txt_getProductTitle}          xpath=//h1
${txt_getProductPrice}          xpath=//div[@class='v1zwn21k v1zwn20 _1psv1zeb9 _1psv1ze0']
${btn_addtoCart}                xpath=//div[text()='Add to cart']
${btn_cartIcon}                 xpath=//span[normalize-space()='Cart']

# Cart Page Locators
${txt_cartPageProductPrice}     xpath=//div[@class='css-146c3p1 r-op4f77 r-1rsjblm r-9iso6']
