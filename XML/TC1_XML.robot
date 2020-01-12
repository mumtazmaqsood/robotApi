*** Settings ***
Library  XML
Library  os
Library  Collections
Library  RequestsLibrary
Library  OperatingSystem

*** Variables ***
${base_URL}=    http://thomas-bayer.com
${base_URL1}=   https://jsonplaceholder.typicode.com
${basic_Auth_URL}=  http://restapi.demoqa.com
${bearer_Auth_URL}=  https://certtransaction.elementexpress.com
${bearerToken}=  "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
#TC1:read XML Data-->File
#    ${xml_obj}=    parse xml  C:/Users/mumtaz/Desktop/python/JSON_DATA/xml_data.xml
#    ${xml_Data}=     get element text     ${xml_obj}
#
##    it will print whole xml file data
#    log to console  ${xml_Data}
##    Validation
#    ${book_author}=     get element text     ${xml_obj}      .//book[1]/author
#    #.//book[1]/author --> it take first book element and then get author name
#    should be equal  ${book_author}     Giada De Laurentiis
#
#
#TC2:read XML DATA ---> Api
#    create session  tc2     ${base_URL}
#    ${response}=    get request  tc2    /sqlrest/CUSTOMER/10
#    ${xml_string}=  convert to string     ${response.content}
#    ${xml_obj}=    parse xml    ${xml_string}
#
##    SIngle Validation
#    element text should be  ${xml_obj}      10  .//ID
#
##    Multiple Values Validation
#    ${child_elements}=    get child elements  ${xml_obj}
#    should not be empty  ${child_elements}
#    ${id}=  get element text    ${child_elements[0]}
#    ${f_name}=  get element text    ${child_elements[1]}
#    ${l_name}=  get element text    ${child_elements[2]}
#    ${s_name}=  get element text    ${child_elements[3]}
#    ${city}=  get element text    ${child_elements[4]}
#
#    should be equal     ${id}   10
#    should be equal     ${f_name}   Sue
#    should be equal     ${l_name}   Fuller
#    should be equal     ${s_name}   135 Upland Pl.
#    should be equal     ${city}     Dallas
#
#
#TC3:Validate Headers & Cookies
#    create session  h&c     https://jsonplaceholder.typicode.com
#    ${response}=    get request  h&c    /photos
#    log to console  ${response.headers}
#
#    ${content_Type}=    get from dictionary     ${response.headers}     Content-Type
#    should contain  ${content_Type}     application/json; charset=utf-8
#
#
#    ${Content-Encoding}=    get from dictionary     ${response.headers}     Content-Encoding
#    should contain  ${Content-Encoding}     gzip
#
#
#
#    #COOKIES VALIDATION
#    ${response_Cookies}=    get from dictionary  ${response.cookies}    __cfduid
#    should not be empty  ${response_Cookies}


TC4:Basic Authenication
    ${auth}=    create list  ToolsQA    TestPassword
    create session  basic_Auth  ${basic_Auth_URL}   auth=${auth}
    ${response_Auth}=    get request  basic_Auth    /authentication/CheckForAuthentication/
    log to console  ${response_Auth.content}
    should be equal as strings  ${response_Auth.status_code}       200

TC5:BEARER Authenication
    ${bearer_Auth}=     create session  bearer_auth     ${bearer_Auth_URL}
    ${header}=  create dictionary  Authorization=${bearerToken}     Content-Type=text/xml
    ${body}=    get file  C:/Users/mumtaz/Desktop/python/JSON_DATA/xml_data.xml
    ${response}=    put request  bearer_auth    /      data=${body}     headers=${header}
    log to console  ${response.content}
    log to console  ${response.status_code}