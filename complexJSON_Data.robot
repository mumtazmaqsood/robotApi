*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary

*** Variables ***
${base_URL}=    https://restcountries.eu
${city}=    PAK

*** Test Cases ***
TC1:Read JSON Data-->API
   create session   tc1     ${base_URL}
    ${response}=   get request  tc1    /rest/v2/alpha/${city}
    ${json_obj}=    to json     ${response.content}
    ${country_name}=    get value from json     ${json_obj}     $.name
    should be equal     ${country_name[0]}     Pakistan


    #get multiple values and validate
    ${borders}=     get value from json     ${json_obj}     $.borders
    log to console  ${borders}
    should contain  ${borders[0]}      AFG     IND


#    2
    ${t_data}=      get value from json       ${json_obj}       $.translations
    should contain  ${t_data}.0     パキスタン