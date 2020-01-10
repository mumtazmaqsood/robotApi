*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${base_URL}=    http://localhost:8080


*** Test Cases ***
TC1:Returns all video games(GET)
    create session  getVideos       ${base_URL}
    ${response}=    get request  getVideos      /app/videogames
    log to console  ${response.status_code}
    log to console  ${response.content}

#    VALIDATION
     ${status_code}=    convert to string  ${response.status_code}
     should contain  ${status_code}     200

TC2:Add new video game(POST)
    create session  addVideo    ${base_URL}
    ${body}=    create dictionary   id=800   name=BRAVE-HEART   releaseDate=2000-01-01T11:37:35.943Z   reviewScore=7   category=Adventure   rating=Universe
    ${header}=  create dictionary   Content-Type=application/json
    ${response_POST}=    post request  addVideo  /app/videogames     data=${body}    headers=${header}
    log to console  ${response_POST.status_code}
    log to console  ${response_POST.content}

    #VALIDATION
    ${status_code_POST}=    convert to string  ${response_POST.status_code}
    should contain  ${status_code_POST}     200
    ${content_POST}=    convert to string   ${response_POST.content}
    should contain  ${content_POST}      Record Added Successfully


TC3:Return video game by ID(GET)
    create session  getVideo_ID     ${base_URL}
    ${response_getID}=  get request  getVideo_ID    /app/videogames/800
    log to console  ${response_getID.content}

    #VALIDATION
    ${getID_sCode}=     convert to string  ${response_getID.status_code}
    should contain  ${getID_sCode}  200
    ${getID_Content}=   convert to string  ${response_getID.content}
    should contain  ${getID_Content}    BRAVE-HEART

TC4:Update video game(PUT)
    create session  updateVideo    ${base_URL}
    ${body}=    create dictionary   id=800   name=Happy Life   releaseDate=2000-01-01T11:37:35.943Z   reviewScore=8   category=Adventure   rating=Universe
    ${header}=  create dictionary   Content-Type=application/json
    ${response_PUT}=    put request  updateVideo  /app/videogames/800     data=${body}    headers=${header}
    log to console  ${response_PUT.status_code}
    log to console  ${response_PUT.content}

    #VALIDATION
    ${status_code_PUT}=    convert to string  ${response_PUT.status_code}
    should contain  ${status_code_PUT}     200
    ${content_PUT}=    convert to string   ${response_PUT.content}
    should contain  ${content_PUT}      Happy Life
    should contain  ${content_PUT}      8

TC5:Delete video game by ID(DELETE)
    create session  delete_Video  ${base_URL}
    ${response_deleteVideo}=    delete request  delete_Video    /app/videogames/800
#    log to console  video deleted
    log to console  ${response_deleteVideo}
    log to console  ${response_deleteVideo.status_code}

    #VALIDATION
    ${deleteVideo_status_code}=     convert to string  ${response_deleteVideo.status_code}
    should contain  ${deleteVideo_status_code}  200
    ${deleteVideo_content}=     convert to string  ${response_deleteVideo.content}
    should contain  ${deleteVideo_content}  Record Deleted Successfully

