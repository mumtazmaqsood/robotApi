*** Settings ***
Library  XML
Library  os
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_URL}=    http://thomas-bayer.com
${base_URL1}=   https://jsonplaceholder.typicode.com

*** Test Cases ***
TC1:read XML Data-->File
    ${xml_obj}=    parse xml  C:/Users/mumtaz/Desktop/python/JSON_DATA/xml_data.xml
    ${xml_Data}=     get element text     ${xml_obj}

#    it will print whole xml file data
    log to console  ${xml_Data}
#    Validation
    ${book_author}=     get element text     ${xml_obj}      .//book[1]/author
    #.//book[1]/author --> it take first book element and then get author name
    should be equal  ${book_author}     Giada De Laurentiis


TC2:read XML DATA ---> Api
    create session  tc2     ${base_URL}
    ${response}=    get request  tc2    /sqlrest/CUSTOMER/10
    ${xml_string}=  convert to string     ${response.content}
    ${xml_obj}=    parse xml    ${xml_string}

#    SIngle Validation
    element text should be  ${xml_obj}      10  .//ID

#    Multiple Values Validation
    ${child_elements}=    get child elements  ${xml_obj}
    should not be empty  ${child_elements}
    ${id}=  get element text    ${child_elements[0]}
    ${f_name}=  get element text    ${child_elements[1]}
    ${l_name}=  get element text    ${child_elements[2]}
    ${s_name}=  get element text    ${child_elements[3]}
    ${city}=  get element text    ${child_elements[4]}

    should be equal     ${id}   10
    should be equal     ${f_name}   Sue
    should be equal     ${l_name}   Fuller
    should be equal     ${s_name}   135 Upland Pl.
    should be equal     ${city}     Dallas


TC3:Validate Headers & Cookies
    create session  h&c     https://jsonplaceholder.typicode.com
    ${response}=    get request  h&c    /photos
    log to console  ${response.headers}

    ${content_Type}=    get from dictionary     ${response.headers}     Content-Type
    should contain  ${content_Type}     application/json; charset=utf-8


    ${Content-Encoding}=    get from dictionary     ${response.headers}     Content-Encoding
    should contain  ${Content-Encoding}     gzip



    #COOKIES VALIDATION
    ${response_Cookies}=    get from dictionary  ${response.cookies}    __cfduid
    should not be empty  ${response_Cookies}
