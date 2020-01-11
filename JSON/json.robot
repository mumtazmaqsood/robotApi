*** Settings ***
Library  JSONLibrary
Library  os
Library  Collection


*** Test Cases ***
TC1:read JSON data
    ${json_obj}=    load json from file  C:/Users/mumtaz/Desktop/python/JSON_DATA/jsondata.json
    ${name_value}=    get value from json   ${json_obj}     $.firstName
    log to console  ${name_value[0]}
    should be equal  ${name_value[0]}   John

    ${address}=     get value from json     ${json_obj}     $.address.streetAddress
    should be equal  ${address[0]}     naist street

    ${city}=    get value from json   ${json_obj}     $.address.city
    should be equal  ${city[0]}     Nara


