*** Settings ***
Documentation     Smoke Tests and Basic Interaction
Library    PlatynUI
Resource    ressources/app_keywords.resource

Suite Setup    Open Application
Suite Teardown    Close Application


*** Test Cases ***
Application Starts Successfully
    [Documentation]    Verify application launches and main window is accessible
    [Tags]    smoke
    Ensure Exists    ${WINDOW}
    ${is_active}=    Is Active    ${WINDOW}
    Should Be True    ${is_active}

Mouse Click Test
    [Documentation]    This test verifies mouse click functionality.

    #Open Application
    Activate      ${WINDOW}//Button[@Name="Regular Button"]

    # Click Element    id=submit-button
    # Element Should Contain    id=result    Success

Get Property - Element Name
    [Documentation]    Get Property retrieves Name attribute
    [Tags]    keyword    getproperty    name
    Navigate To Controls Page
    ${name}=    Get Property Value  ${REGULAR_BUTTON}    Name
    Should Be Equal    ${name}    Regular Button

Get Property - IsEnabled State
    [Documentation]    Get Property checks if element is enabled
    [Tags]    keyword    getproperty    enabled
    Navigate To Controls Page
    ${enabled}=    Get Property Value   ${REGULAR_BUTTON}    IsEnabled
    Should Be True    ${enabled}