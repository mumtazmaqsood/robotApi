*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_URL}=    http://restapi.demoqa.com/customer


*** Test Cases ***
putRequest
    create session  put_request     ${base_URL}
    ${body}=    create dictionary   FirstName=Mumtaz1    LastName=Maqsood1    UserName=m11     Password=1231    Email=m1@yahoo.com
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=    post request  put_request   /register   data=${body}    headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATION

    ${res_statusCode}=  convert to string   ${response.status_code}
    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     OPERATION_SUCCESS
    should contain  ${res_body}     Operation completed successfully
    should be equal  ${res_statusCode}      201




