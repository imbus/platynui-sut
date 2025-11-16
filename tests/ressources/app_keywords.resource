*** Settings ***
Documentation       Keywords to manage the application lifecycle and navigation

Library             Process
Library             PlatynUI


*** Variables ***
${APP_HANDLE}           value
${APP_NAME}             Widgets Gallery (QML)
${WINDOW}               Window[@Name="${APP_NAME}"]
${REGULAR_BUTTON}       ${WINDOW}//Button[@Name="Regular Button"]
${CHECKED_CHECKBOX}     ${WINDOW}//CheckBox[@Name="Checked Checkbox"]
${SELECT_COMBOBOX}      ${WINDOW}//ComboBox[@Name="Select ComboBox"]
${FILTER_TEXTFIELD}     ${WINDOW}//Edit[@Name="Filter by Header 1"]
${PROGRESS_SLIDER}      ${WINDOW}//Slider[@Name="Progress Slider"]
${STATUS_LABEL}         ${WINDOW}//Text[@Name="Status Bar Label"]


*** Keywords ***
Open Application
    [Documentation]    Start the application and store the process handle
    ${handle}=    Start Process    uv    run    python    -m    platynui_sut.main
    ...    cwd=${EXECDIR}/..
    ...    shell=True
    Sleep    2s    # Warte bis App gestartet ist
    Set Suite Variable    ${APP_HANDLE}    ${handle}

Close Application
    [Documentation]    Close the application using the stored process handle
    Terminate Process    ${APP_HANDLE}
    Wait For Process    ${APP_HANDLE}

Navigate To Controls Page
    [Documentation]    Navigate to Controls page
    Mouse Click    ${WINDOW}//ListItem[@Name="Controls Page"]

Navigate To ListView Page
    [Documentation]    Navigate to ListView page
    Mouse Click    ${WINDOW}//ListItem[@Name="ListView Page"]

Navigate To TableView Page
    [Documentation]    Navigate to TableView page
    Mouse Click    ${WINDOW}//ListItem[@Name="TableView Page"]

Navigate To TextEdit Page
    [Documentation]    Navigate to TextEdit page
    Mouse Click    ${WINDOW}//ListItem[@Name="TextEdit Page"]

Navigate To About Page
    [Documentation]    Navigate to About page
    Mouse Click    ${WINDOW}//ListItem[@Name="About Page"]
