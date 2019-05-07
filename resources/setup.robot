*** Settings ***
Library                                                 SeleniumLibrary                                  timeout=30s
Library                                                 Collections
Library                                                 String
Library                                                 FakerLibrary                                     locale=en_US
library                                                 ../libs/utils.py

*** Variables ***
${browser}                                              chrome
${SelenimURL}                                           http://localhost:4444/wd/hub
${Server}                                               http://signup.int.staging.insly.training

*** Keywords ***
Set Chrome Options
    [Documentation]
    ...   Set chrome options as a list
    ${_tmp}  Create List
        ...  test-type
        ...  --start-maximized
        ...  --disable-infobars
        ...  --disable-new-virtual-keyboard-behavior
        ...  --no-sandbox
        ...  --disable-setuid-sandbox
        ...  --disable-notifications
        ...  --no-first-run
        ...  --disable-notifications
        ...  --disable-translate
        ...  --disable-physical-keyboard-autocorrect
    ${args}                                               Create Dictionary                                 args=${_tmp}
    Set Suite Variable                                    ${chromeOptions}                                  ${args}

Set Desired Capabilities
    [Documentation]
    ...   Set Desired Capabilities as a dictionary for selenium grid
    &{desired_capabilities}    Create Dictionary
        ...  name=insly
        ...  browserName=${browser}
        ...  cssSelectorsEnabled=true
        ...  javascriptEnabled=true
        ...  locationContextEnabled=false
        # ...  platformName=LINUX
        # ...  platform=LINUX
        ...  marionette=true
    Set Suite Variable                                    ${desired_capabilities}

Set Enviroment
   ${ROOT}                                                Set Variable                                       ${CURDIR}
   ${ROOT}                                                Remove String                                      ${CURDIR}                   \\resources
   Set Global Variable                                    ${ROOT}
   ${Browser_kind}                                        Run Keyword And Return Status                      Should Contain               ${browser}           chrome
   ${isChrome}                                            Set Variable If                                    ${Browser_kind}              ${TRUE}              ${FALSE}
   Set Suite Variable                                     ${isChrome}
   Open Test browser

Wait Until Page Is Loaded
    Wait For Condition                                    return window.document.readyState === "complete"   5

Open Test browser
    Set Log Level                                         trace
    Set Desired Capabilities
    Run Keyword If                                        ${isChrome}    Open Chrome   ELSE   Open Firefox
    Maximize Browser Window

Open Chrome
    Set Chrome Options
    Set To Dictionary                                     ${desired_capabilities}                                chromeOptions=${chromeOptions}
    Open Browser                                          about:      browser=${browser}                         desired_capabilities=${desired_capabilities}    #remote_url=${SelenimURL}

Open Firefox
    Open Browser                                          about:home   browser=${browser}                        desired_capabilities=${desired_capabilities}    #remote_url=${SelenimURL}

Close Session
    close all browsers

Test CleanUp
    Run Keyword If Test Failed                            No Operation
