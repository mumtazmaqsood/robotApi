
//This Program create REQUEST to a website and get weather information

*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base-URL}     http://restapi.demoqa.com
${city}     Copenhagen


*** Test Cases ***

get_Requestinfo
    create session      tc1     ${base-url}
    ${getRequest_response}=     get request     tc1     /utilities/weather/city/${city}
    log to console  ${getRequest_response.status_code}
    log to console  ${getRequest_response.content}
    log to console  ${getRequest_response.headers}

#    validation
    ${status_code}=     convert to string     ${getRequest_response.status_code}
    should be equal     ${status_code}      200

    ${body}=     convert to string  ${getRequest_response.content}
    should contain  ${body}     Copenhagen

    ${content_headerType}=    get from dictionary   ${getRequest_response.headers}      Content-Type
    should contain  ${content_headerType}       application/json
