*** Settings ***
Documentation       Smoke Tests and Basic Interaction

Library             PlatynUI
Resource            ressources/app_keywords.resource

Suite Setup         Open Application
Suite Teardown      Close Application


*** Test Cases ***
### Keyword 'Mouse Click' Tests ###
Check if Mouse Click Works
    [Documentation]    Verify that clicking works
    [Tags]    keyword    mouseclick
    Navigate To Controls Page
    Mouse Click    ${REGULAR_BUTTON}
    Get Property Value    ${STATUS_LABEL}    Name    should be    Status: Regular clicked

### Keyword 'Get Property Value' Tests ###

check if Get Property Value works
    [Documentation]    Verify Get Property Value retrieves correct Value
    [Tags]    keyword    getpropertyvalue
    Navigate To Controls Page
    Mouse Click    ${READ_ONLY_CHECKBOX}

    Get Property Value    ${SMALL_RADIO_BTN}    IsEnabled    should be    ${False}

### Keyword 'Ensure Exists' Tests ###

### Keyword 'Is Active' Tests ###

Application Starts Successfully
    [Documentation]    Verify application launches and main window is accessible
    [Tags]    smoke
    Ensure Exists    ${WINDOW}
    ${is_active}=    Is Active    ${WINDOW}
    Should Be True    ${is_active}

Mouse Click Test
    [Documentation]    This test verifies mouse click functionality.

    # Open Application
    Activate    ${WINDOW}//Button[@Name="Regular Button"]

    # Click Element    id=submit-button
    # Element Should Contain    id=result    Success

Get Property - Element Name
    [Documentation]    Get Property retrieves Name attribute
    [Tags]    keyword    getproperty    name
    Navigate To Controls Page
    ${name}=    Get Property Value    ${REGULAR_BUTTON}    Name
    Should Be Equal    ${name}    Regular Button

Get Property - IsEnabled State
    [Documentation]    Get Property checks if element is enabled
    [Tags]    keyword    getproperty    enabled
    Navigate To Controls Page
    ${enabled}=    Get Property Value    ${REGULAR_BUTTON}    IsEnabled
    Should Be True    ${enabled}

Test Slider Position
    [Documentation]    Automatically tests different slider positions and verifies they are set correctly
    [Tags]    slider
    # Test different slider values
    Set Slider Value    0.1
    Log    Successfully set slider to 1%

    Set Slider Value    25
    Log    Successfully set slider to 25%

    Set Slider Value    50
    Log    Successfully set slider to 50%

    Set Slider Value    75
    Log    Successfully set slider to 75%

    Set Slider Value    100
    Log    Successfully set slider to 100%
