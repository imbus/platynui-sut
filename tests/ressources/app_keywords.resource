*** Settings ***
Documentation       Keywords to manage the application lifecycle and navigation

Library             Process
Library             PlatynUI


*** Variables ***
${APP_HANDLE}               value
${APP_NAME}                 Widgets Gallery (QML)
${WINDOW}                   Window[@Name="${APP_NAME}"]
${REGULAR_BUTTON}           ${WINDOW}//Button[@Name="Regular Button"]
${CHECKED_CHECKBOX}         ${WINDOW}//CheckBox[@Name="Checked Checkbox"]
${SELECT_COMBOBOX}          ${WINDOW}//ComboBox[@Name="Select ComboBox"]
${FILTER_TEXTFIELD}         ${WINDOW}//Edit[@Name="Filter by Header 1"]
${PROGRESS_SLIDER}          ${WINDOW}//Slider[@Name="Progress Slider"]
${STATUS_LABEL}             ${WINDOW}//Text[contains(@Name, "Status")]
${READ_ONLY_CHECKBOX}       ${WINDOW}//CheckBox[@Name="Widgets read-only"]
${SMALL_RADIO_BTN}          ${WINDOW}//RadioButton[@Name="Small"]


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

Set Slider Value
    [Documentation]    Set the progress slider to a specific value (0-100)
    [Arguments]    ${target_value}

    # Validate input value
    Should Be True    ${target_value} >= 0 and ${target_value} <= 100    Value must be between 0 and 100

    # Get slider dimensions to calculate correct position
    ${rect}=    Get Property Value    ${PROGRESS_SLIDER}    BoundingRectangle

    # Calculate position within slider (0-100% maps to slider width)
    ${relative_percent}=    Evaluate    ${target_value} / 100.0
    ${click_x}=    Evaluate    ${rect.Width} * ${relative_percent}
    ${click_y}=    Evaluate    ${rect.Height} / 2.0    # Click in vertical center

    # Click at the calculated position
    Mouse Click    ${PROGRESS_SLIDER}    ${click_x}    ${click_y}

    # Small delay to allow UI to update
    Sleep    0.2s

Get Slider Value    # this keyword doesn't work properly yet
    [Documentation]    Get the current value of the progress slider
    Navigate To Controls Page
    ${value}=    Get Property Value    ${PROGRESS_SLIDER}    value
    RETURN    ${value}

Navigate To About Page
    [Documentation]    Navigate to About page
    Mouse Click    ${WINDOW}//ListItem[@Name="About Page"]
