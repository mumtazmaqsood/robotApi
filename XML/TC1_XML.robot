*** Settings ***
Library  XML
Library  os
Library  collections


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

