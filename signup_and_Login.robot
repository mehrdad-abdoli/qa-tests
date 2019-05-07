*** Settings ***
Documentation                                                   Test Sign up of staging.insly
Resource                                                        resources/setup.robot
Suite Setup                                                     Set Enviroment
Test Teardown                                                   Test CleanUp
Suite Teardown                                                  Close Session

*** Variables ***
${Header_subtitle_txt}                                          No credit card required at this point. Cancel anytime.
${Header_subtitle_locator}                                      //div[@class="row"]/div/p
${Body_color}                                                   \#777777
${Header_Font_Family}                                           MuseoSansCyrl-700
${Body_Font_Family}                                             MuseoSansCyrl-500
${Header_Locator}                                               //div[@class="row"]/div/h1
${Header_color}                                                 \#FF7A00
${Header_txt}                                                   Sign up and start using
${Subtitle_locator}                                             //td[normalize-space(@class)='subtitle']
${Subtitle_color}                                               \#444444
${Subtitle_Font_Family_ff}                                      "MuseoSansCyrl-700", sans-serif
${Subtitle_Font_Family_ch}                                      MuseoSansCyrl-700, sans-serif
${Panel_class}                                                  class:panel
${span_title_locator}                                           //span[@class='title']
${span_title_color}                                             \#B8B8B8
${span_title_fontsize}                                          8px
${password_locator}                                             //*[@id="field_broker_person_password"]//div[@class='label']
${password_color}                                               \#777777
${password_fontsize}                                            10px
${div_element_label}                                            css:div.element, div.label, div.displayelement
${input_textarea}                                               div.element input[type="text"], div.element textarea
${alert_warning_locator}                                        class:alert-warning

*** Test Cases ***
Step 1: Validation of Form looks like in the attached image
    Go To Signup On Staging Insly And Verify header
    Cheak Header h1
    Check Header P
    Check Panel
    check input select textarea
    Check Subtitles in Panel
    Check Span Titles in Panel
    Check Passwords in Panel
    Check div.element div.label div.displayelement
    check Links
    Check Alert Warning
    Check checklists
    Check Buttons
#
step 2: Company Details
    Fill Some Random Unique Company Name And Verify Insly Addres
    Chose any country
    Select any Company profile
    Select any Number of Employees
    Select any HOW WOULD YOU DESCRIBE YOURSELF?

step 3: Administrator account details
    Go to Administrator account details block
    Fill in Work e-mail
    Fill in Account manager name
    Press suggest a secure password and remember it
    Enter your phone number

step 4: Terms and conditions
    Tick All CheckBoxes
    Click on terms and conditions link and agree
    Click on privacy policy link and agree
    Sign up button become active

step 5: Sign up And Login To Dashboard
    Press Sign up button
    Wait for instance creation finish
    Insly demo instance start to work
    You are logged in as user
    Url is the same as was entered in the step 2
    dashboard page opened

*** Keywords ***
Check Header P
    Check Element Attributes                                    ${Header_subtitle_locator}                 ${Header_subtitle_txt}           ${Body_color}         12px     ${Body_Font_Family}

Cheak Header h1
    Check Element Attributes                                    ${Header_Locator}                          ${Header_txt}                    ${Header_color}       38px     ${Header_Font_Family}

Sign up and start using title is shown
    Page Should Contain Element                                 ${Header_Locator}                          timeout=5s

Check Element Attributes
    [Arguments]                                                 ${locator}  ${Text}                        ${color}                          ${font_size}         ${Font_Family}
    Element Text Should Be                                      ${locator}                                 ${Text}
    Check Element color By Rgb                                  ${locator}                                 color                             ${color}
    element css attribute should be                             ${locator}                                 font-size                         ${font_size}
    element css attribute should be                             ${locator}                                 font-family                       ${Font_Family}

check input select textarea
    ${RGB}                                                      Run Keyword If    ${isChrome}              hex to rgba    \#BEBEBE
    ...  ELSE                                                   hex to rgb        \#BEBEBE
    element css attribute should be                             css:input, select, textarea                border-top-color                   ${RGB}
    element css attribute should be                             css:input, select, textarea                border-top-style                   solid
    element css attribute should be                             css:input, select, textarea                border-top-width                   2px
    element css attribute should be                             css:input, select, textarea                border-right-color                 ${RGB}
    element css attribute should be                             css:input, select, textarea                border-right-style                 solid
    element css attribute should be                             css:input, select, textarea                border-right-width                 2px
    element css attribute should be                             css:input, select, textarea                border-bottom-color                ${RGB}
    element css attribute should be                             css:input, select, textarea                border-bottom-style                solid
    element css attribute should be                             css:input, select, textarea                border-bottom-width                2px
    ${width}                                                    Execute Javascript                         return ( 100 * parseFloat($('${input_textarea}').css('width')) / parseFloat($('${input_textarea}').parent().css('width')) ) + '%';
    Should Be Equal                                             ${width}                                   100%
    element css attribute should be                             css:div.element input                      height                               32px
    element css attribute should be                             broker_tag                                 width                                283px
    ${maxlength}                                                Get Element Attribute                      broker_tag                           maxlength
    Should Be Equal                                             ${maxlength}                               32

check Links
    Check Element color By Rgb                                  //a                                        color                               \FF7B00
    Element Text Should Be                                      //*[@id="field_broker_person_password"]//a                                    suggest a secure password
    Element Text Should Be                                      //*[@id="field_terms"]/td[2]//label[1]/a                                      terms and conditions
    Element Text Should Be                                      //*[@id="field_terms"]/td[2]//label[2]/a                                      privacy policy

check icon error
    Check Element color By Rgb                                  class:icon-error                            color                               \#FF484F

Go To Signup On Staging Insly And Verify header
    Go To                                                       ${Server}
    Wait Until Page Contains                                    Sign up and start using

Check Element color By Rgb
    [Arguments]                                                 ${locator}                                  ${prop}                           ${color}
    ${RGBA}                                                     hex to rgba                                 ${color}
    ${RGB}                                                      hex to rgb                                  ${color}
    ${ststus}                                                   Run Keyword And Return Status               element css attribute should be   ${locator}    ${prop}   ${RGBA}
    Run Keyword If                                              not ${ststus}                               element css attribute should be   ${locator}    ${prop}   ${RGB}

Check Panel
    Check Element color By Rgb                                  ${Panel_class}                              background-color                    \#fff
    element css attribute should be                             ${Panel_class}                              border-top-width                    1px
    element css attribute should be                             ${Panel_class}                              border-bottom-width                 1px
    element css attribute should be                             ${Panel_class}                              border-right-width                  1px
    element css attribute should be                             ${Panel_class}                              border-left-width                   1px
    element css attribute should be                             ${Panel_class}                              border-bottom-left-radius           6px
    element css attribute should be                             ${Panel_class}                              border-bottom-right-radius          6px
    element css attribute should be                             ${Panel_class}                              border-top-left-radius              6px
    element css attribute should be                             ${Panel_class}                              border-top-right-radius             6px
    element css attribute should be                             ${Panel_class}                              border-top-left-radius              6px
    element css attribute should be                             ${Panel_class}                              border-top-right-radius             6px
    element css attribute should be                             ${Panel_class}                              border-top-style                    solid
    element css attribute should be                             ${Panel_class}                              border-left-style                   solid
    element css attribute should be                             ${Panel_class}                              border-bottom-style                 solid
    element css attribute should be                             ${Panel_class}                              border-right-style                  solid

Check Subtitles in Panel
    @{subtitles_txt}                                            create list                                 Company      Add user    ${EMPTY}    Administrator account details    Terms and conditions
    @{elements}                                                 Get WebElements                             ${Subtitle_locator}
    ${count}                                                    Get Length                                  ${elements}
    ${FontName}                                                 Set Variable If                             ${isChrome}                          ${Subtitle_Font_Family_ch}       ${Subtitle_Font_Family_ff}
    Should Be Equal                                             ${count}                                    ${5}
    :FOR     ${i}  ${subtitle}    IN ENUMERATE                  @{elements}
    \  Continue For Loop If                                     ${i} == ${2}
    \  Check Element Attributes                                 ${subtitle}                                 @{subtitles_txt}[${i}]                ${Subtitle_color}       20px     ${FontName}
    \  element css attribute should be                          ${subtitle}                                 padding-bottom                        10px
    \  ${hasStyle}                                              Run Keyword And Return Status               Element Attribute Value Should Be     ${subtitle}                           style                   padding-top: 0px;
    \  ${paddingTop}                                            Set Variable If                             ${hasStyle}                           0px                     13px
    \  element css attribute should be                          ${subtitle}                                 padding-left                          0px
    \  element css attribute should be                          ${subtitle}                                 padding-right                         0px
    \  element css attribute should be                          ${subtitle}                                 padding-top                           ${paddingTop}

Check Span Titles in Panel
    @{subtitles_txt}                                            CREATE LIST                                 COMPANY NAME           COUNTRY     YOUR INSLY ADDRESS       COMPANY PROFILE     NUMBER OF EMPLOYEES
    ...  HOW WOULD YOU DESCRIBE YOURSELF?                       WORK E-MAIL                                 ACCOUNT MANAGER NAME   PHONE       TERMS AND CONDITIONS
    @{elements}                                                 Get WebElements                             ${span_title_locator}
    ${count}                                                    Get Length                                  ${elements}
    Should Be Equal                                             ${count}                                    ${10}
    :FOR     ${i}  ${span_title}    IN ENUMERATE                @{elements}
    \  element css attribute should be                          ${span_title}                               text-transform                        uppercase
    \  Check Element Attributes                                 ${span_title}                               @{subtitles_txt}[${i}]                ${span_title_color}       ${span_title_fontsize}     ${Body_Font_Family}
    \  element css attribute should be                          ${span_title}                               padding-bottom                        0px
    \  element css attribute should be                          ${span_title}                               padding-left                          0px
    \  element css attribute should be                          ${span_title}                               padding-right                         0px
    \  element css attribute should be                          ${span_title}                               padding-top                           0px
    \  element css attribute should be                          ${span_title}                               text-align                            right
    \  element css attribute should be                          ${span_title}                               line-height                           30px
    \  element css attribute should be                          ${span_title}                               cursor                                pointer

Check Passwords in Panel
    @{password_txt}                                             CREATE LIST                               PASSWORD                              PASSWORD (REPEAT)
    @{elements}                                                 Get WebElements                           ${password_locator}
    ${count}                                                    Get Length                                ${elements}
    Should Be Equal                                             ${count}                                  ${2}
    :FOR     ${i}  ${passwords}    IN ENUMERATE                 @{elements}
    \  element css attribute should be                          ${passwords}                              text-transform                        uppercase
    \  Check Element Attributes                                 ${passwords}                              @{password_txt}[${i}]                 ${password_color}       ${password_fontsize}     ${Body_Font_Family}
    \  element css attribute should be                          ${passwords}                              padding-bottom                        4px
    \  element css attribute should be                          ${passwords}                              padding-left                          6px
    \  element css attribute should be                          ${passwords}                              padding-right                         10px
    \  element css attribute should be                          ${passwords}                              padding-top                           0px
    \  element css attribute should be                          ${passwords}                              margin-bottom                         5px
    \  element css attribute should be                          ${passwords}                              margin-left                           0px
    \  element css attribute should be                          ${passwords}                              margin-right                          0px
    \  element css attribute should be                          ${passwords}                              margin-top                            4px
    \  element css attribute should be                          ${passwords}                              text-align                            right
    \  element css attribute should be                          ${passwords}                              line-height                           30px
    \  element css attribute should be                          ${passwords}                              cursor                                pointer

Check Alert Warning
    @{warning_txt}                                              CREATE LIST                               You can invite your colleagues from here and they will get their own user access to your Company account
    ...                                                         You must read Privacy Policy before proceeding.
    @{elements}                                                 Get WebElements                           ${alert_warning_locator}
    ${count}                                                    Get Length                                ${elements}
    Should Be Equal                                             ${count}                                  ${2}
    ${RGB}                                                      hex to rgb                                \#FAEBCC
    :FOR     ${i}  ${warning}    IN ENUMERATE                   @{elements}
    \  Element Text Should Be                                   ${warning}                                @{warning_txt}[${i}]
    \  element css attribute should be                          ${warning}                                border-image-width                    1
    \  element css attribute should be                          ${warning}                                border-top-width                      1px
    \  element css attribute should be                          ${warning}                                border-bottom-width                   1px
    \  element css attribute should be                          ${warning}                                border-right-width                    1px
    \  element css attribute should be                          ${warning}                                border-left-width                     1px
    \  element css attribute should be                          ${warning}                                border-bottom-left-radius             6px
    \  element css attribute should be                          ${warning}                                border-bottom-right-radius            6px
    \  element css attribute should be                          ${warning}                                border-top-left-radius                6px
    \  element css attribute should be                          ${warning}                                border-top-right-radius               6px
    \  element css attribute should be                          ${warning}                                border-top-left-radius                6px
    \  element css attribute should be                          ${warning}                                border-top-right-radius               6px
    \  element css attribute should be                          ${warning}                                border-top-style                      solid
    \  element css attribute should be                          ${warning}                                border-left-style                     solid
    \  element css attribute should be                          ${warning}                                border-bottom-style                   solid
    \  element css attribute should be                          ${warning}                                border-right-style                    solid
    \  Check Element color By Rgb                               ${warning}                                border-top-color                      \#FAEBCC
    \  Check Element color By Rgb                               ${warning}                                border-bottom-color                   \#FAEBCC
    \  Check Element color By Rgb                               ${warning}                                border-left-color                     \#FAEBCC
    \  Check Element color By Rgb                               ${warning}                                border-right-color                    \#FAEBCC
    \  Check Element color By Rgb                               ${warning}                                background-color                      \#fcf8e3
    \  Check Element color By Rgb                               ${warning}                                color                                 \#8a6d3b

Check div.element div.label div.displayelement
    element css attribute should be                             ${div_element_label}                      margin-bottom                        5px
    element css attribute should be                             ${div_element_label}                      margin-top                           4px
    element css attribute should be                             ${div_element_label}                      margin-left                          0px
    element css attribute should be                             ${div_element_label}                      margin-right                         0px

Check checklists
    @{checklists_txt}                                           CREATE LIST                               I agree to the terms and conditions
    ...                                                         I agree to the privacy policy             I agree to the processing and storage of my personal data
    @{elements}                                                 Get WebElements                           //div[@class="checklist"]//label
    ${count}                                                    Get Length                                ${elements}
    Should Be Equal                                             ${count}                                  ${3}
    :FOR     ${i}  ${checklist}    IN ENUMERATE                 @{elements}
    \  Element Text Should Be                                   ${checklist}                              @{checklists_txt}[${i}]
    \  Check Element Attributes                                 ${checklist}                              @{checklists_txt}[${i}]               \#777777       14px     ${Body_Font_Family}
    \  ${Style}                                                 get element attribute                     ${checklist}                          style
    \  Should Be Equal                                          ${Style}                                  width: 90%; cursor: pointer; color: rgb(87, 87, 87);
    \  Page Should Contain Element                              //div[@class="checklist"]//label[${i + 1}]/span[@class='icon-check-empty']

Check Buttons
    Element Should Be Disabled                                  submit_save
    ${RGB}                                                      Run Keyword If    ${isChrome}              hex to rgba    \#BBB
    ...  ELSE                                                   hex to rgb        \#BBB
    element css attribute should be                             css:.signup-btn.disabled                   background-color                      ${RGB}
    element css attribute should be                             css:.signup-btn.disabled                   border-bottom-left-radius             12px
    element css attribute should be                             css:.signup-btn.disabled                   border-bottom-right-radius            12px
    Page Should Contain Element                                 add_newbroker_button

Input Random By Kind
    [Arguments]                                                 ${Kind}                                    ${Test_Variable}                ${locator}
    Random By Kind                                              ${Kind}                                    ${Test_Variable}
    Input Text                                                  ${locator}                                 ${${Test_Variable}}

Random By Kind
    [Arguments]                                                 ${Kind}                                    ${Test_Variable}
    ${Random}                                                   Run Keyword                                FakerLibrary.${Kind}
    Set Suite Variable                                           ${${Test_Variable}}                        ${Random}

Fill Some Random Unique Company Name And Verify Insly Addres
    :FOR    ${index}       IN RANGE       3
    \  Input Company Name
    \  Check Your Insly Address
    \  Set Test Message                                         https://${broker_tag_txt}.int.staging.insly.training${\n}     append=True
    Set Suite Variable                                          ${address}                                  https://${broker_tag_txt}.int.staging.insly.training

Input Company Name
    Input Random By Kind                                        Company                                     Company_Name                    id:broker_name
    Wait Until Keyword Succeeds                                 5x   1s                                     Get Elemnt Value By jQ          broker_name                   ${Company_Name}

Chose any country
    Select From List By Label                                   broker_address_country                      Iran
    Page Should Contain Element                                 //*[@id="status_broker_address_country"]/span[@class="icon-ok"]

Select any Company profile
    Choice Randomly From Drop Down List                          prop_company_profile

Select any Number of Employees
    Choice Randomly From Drop Down List                          prop_company_no_employees

Select any HOW WOULD YOU DESCRIBE YOURSELF?
    Choice Randomly From Drop Down List                          prop_company_person_description

Go to Administrator account details block
    Execute JavaScript    $('html, body').animate({scrollTop:$("#field_add_newbroker_note").offset().top}, 1000)

Fill in Work e-mail
    Input Random By Kind                                        Email                                        Work_Email                    id:broker_admin_email
    Wait Until Keyword Succeeds                                 5x   1s                                      Get Elemnt Value By jQ        broker_admin_email                   ${Work_Email}

Fill in Account manager name
    Input Random By Kind                                        Name                                         Admin_Name                    id:broker_admin_name
    Wait Until Keyword Succeeds                                 5x   1s                                      Get Elemnt Value By jQ        broker_admin_name                   ${Admin_Name}

Press suggest a secure password and remember it
    ${element}                                                  Assign Id To Element                         //*[@id="field_broker_person_password"]//a                         pwd
    Execute Javascript                                          $('#pwd').click()
    Wait Until Page Contains Element                            //*[@id="insly_alert"]/b
    ${Password}                                                 get text                                     //*[@id="insly_alert"]/b
    Set Suite Variable                                          ${Password}
    click button                                                OK
    ${P1}                                                       Execute Javascript                           return document.getElementById("broker_person_password").value
    Should Be Equal                                             ${Password}                                  ${P1}
    ${P2}                                                       Execute Javascript                           return document.getElementById("broker_person_password_repeat").value
    Should Be Equal                                             ${Password}                                  ${P2}

Enter your phone number
    ${phone}                                                    Generate Random String                       length=10                       chars=[NUMBERS]
    Set Suite Variable                                           ${Admin_Phone}                              +98${phone}
    Input Text                                                  broker_admin_phone                           ${Admin_Phone}
    Wait Until Keyword Succeeds                                 5x   1s                                      Get Elemnt Value By jQ           broker_admin_phone          ${Admin_Phone}

Tick CheckBoxes
    [Arguments]                                                 ${Index}
    @{checkboxes}                                               Get WebElements                              class:icon-check-empty
    Click Element                                               @{checkboxes}[${Index}]

Tick All CheckBoxes
    ${seleniumSpeed}                                            set selenium speed                           500ms
    @{checkboxes}                                               Get WebElements                              class:icon-check-empty
    :FOR  ${checkbox}    IN   @{checkboxes}
    \  Click Element                                            ${checkbox}

Click on terms and conditions link and agree
    Click Link                                                  terms and conditions
    Wait Until Page Contains                                    Close dialog
    Click Button                                                I agree
    Wait Until Page Is Loaded

Click on privacy policy link and agree
    Click Link                                                  privacy policy
    Wait Until Page Contains element                            //*[@id="document-content"]/h3[11]
    Execute Javascript                                          document.querySelector('html > body > div > div > div > div:nth-child(2)').scrollIntoView()
    Click Element                                               //div[3]//span[@class='icon-close']

Sign up button become active
    Wait Until Element Is Enabled                               submit_save
    set selenium speed                                          10ms

Press Sign up button
    Click Button                                                Sign Up

Wait for instance creation finish
    Wait Until Page Contains                                    Wait a little bit while we are building your system and testing your patience.

Insly demo instance start to work
     Wait Until Page Contains Element                           login_username                           timeout=60s
     input text                                                 login_username                           ${Work_Email}
     input text                                                 login_password                           ${Password}
     click button                                               Log in

You are logged in as user
    Wait Until Page Contains                                    Active quotes
    Page Should Contain                                         ${Admin_Name}
    Page Should Contain                                         ${Company_Name}

Url is the same as was entered in the step 2
    ${URL}                                                      Get Location
    Should Contain                                              ${URL}                                    ${address}

dashboard page opened
    Page Should Contain                                         Incomplete policies

Choice Randomly From Drop Down List
    [Arguments]                                                 ${locator}
    ${list}                                                     Get List Items                             ${locator}
    ${Count}                                                    Get Length                                 ${list}
    ${random}                                                   Evaluate                                   random.randint(1, ${Count - 1})    random
    Select From List By Label                                   ${locator}                                 @{list}[${random}]

Clean Company Name as Addres field
    [Arguments]                                                 ${Company_Name}
    ${ComName}                                                  remove String                              ${Company_Name}                  ${space}
    ${ComName}                                                  Convert To Lowercase                       ${ComName}
    ${ComName}                                                  Fetch From Left                            ${ComName}                        inc
    ${ComName}                                                  Fetch From Left                            ${ComName}                        llc
    ${ComName}                                                  Fetch From Left                            ${ComName}                        plc
    ${ComName}                                                  Fetch From Left                            ${ComName}                        ltd
    ${ComName}                                                  remove String                              ${ComName}                         -   ,   .   '   "   _  !
    [return]                                                    ${ComName}

Get Elemnt Value By jQ
   [Arguments]                                                  ${locID}                                   ${val}
   click element                                                css:div.alert.alert-warning
   ${value}                                                     Execute Javascript                         return document.getElementById("${locID}").value
   Should Be Equal                                              ${value}                                   ${val}
   Set Suite Variable                                            ${${locID}_txt}                           ${value}
   Page Should Contain Element                                  //*[@id="status_${locID}"]/span[@class="icon-ok"]

Check Your Insly Address
    ${address}                                                  Clean Company Name as Addres field         ${Company_Name}
    Wait Until Keyword Succeeds                                 5x   1s      Get Elemnt Value By jQ        broker_tag                       ${address}
    Should Be Equal                                             ${address}                                 ${broker_tag_txt}
