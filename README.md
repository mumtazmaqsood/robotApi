-------------------------------------------------------------------
#Robot-framework
--------------------------------------
    `> Install robot framework 
    > Pip install robotframework
    > Pip upgrade robotframework
    > Pip install robotframework== 2.9.2
    > Pip uninstall robotframework
    > Pip list
    > Pip show robotframework
    > Pip check robotframework
`
#Install request
--------------------------------------
    > Pip install requests
    > Pip uninstall requests

#Install robotframework-request library
--------------------------------------
    > Pip install robotframework-requests
	````> Pip install robotframework-requests

#Install robotframework-jsonlibrary Library
-------------------------------------------------
	`> Pip install –U robotframework-jsonlibrary
	> Pip uninstall robotframework-jsonlibrary`
-------------------------------------------------------------------

#Video Game DB API Setup:
--------------------------------
    1) Pre-Requisite: Install Gradle on Windows
    2) Graddle Download link:  https://gradle.org/releases/
    3) VideoGameDB API Download Link: https://github.com/james-willett/Vide...
    4) How to run application using graddle?
     E:\VideoGameDB-master\gradlew bootRun
    5)  URL:  http://localhost:8080/swagger-ui/index.html

#TESTING
--------------------------------
    ${base_URL}=    http://localhost:8080
    TEST CASES
    ----------
    TC1:Returns all video games(GET)
    1- Create session 
    2- send Get Request to ${base_URL} /app/videogames
    3- print STATUS CODE on console
    4- print CONTENT on console
    5- validate STATUS CODE 200
    
    
    TC2:Add new video game(POST)
    1- Create session
    2- Create Data Dictionary 
    3- Create Header
    4- Send Post Request to  ${base_URL} /app/videogames     Data    Header
    5- Print STATUS CODE & CONTENT on console
    6- Validate STATUS CODE 200
    7- Validate CONTENT "Record Added Successfully"
    
    
    TC3:Return video game by ID(GET)
    1- Create session   
    2-Send Get Request ${base_URL} /app/videogames/800
    3- Print Content on console
    4- Validate STATUS CODE 200
    5- Validate CONTENT "video game name"
    
    
    TC4:Update video game(PUT)
    1- Create session
    2- Create Data Dictionary 
    3- Create Header
    4- Send Put Request to  ${base_URL} /app/videogames     Data    Header
    5- Print STATUS CODE & CONTENT on console
    6- Validate STATUS CODE 200
    7- Validate CONTENT "updated video game name"
    
    
    TC5:Delete video game by ID(DELETE)
    1- Create session
    2- Send Delete request  ${base_URL}   /app/videogames/800
    4- Print Deleted video content & STATUS CODE on console
    5- Validate STATUS CODE 200
    6- Validate CONTENT "Record Deleted Successfully"
