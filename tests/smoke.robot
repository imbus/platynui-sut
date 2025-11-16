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
    Ensure Exists    ${WINDOW_LOCATOR}
    ${is_active}=    Is Active    ${WINDOW_LOCATOR}
    Should Be True    ${is_active}

Mouse Click Test
    [Documentation]    This test verifies mouse click functionality.

    #Open Application
    Activate      ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]

    # Click Element    id=submit-button
    # Element Should Contain    id=result    Success

