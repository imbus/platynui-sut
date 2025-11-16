*** Settings ***
Documentation       Quick Navigation Test

Library             PlatynUI
Resource            ressources/app_keywords.resource

Suite Setup         Open Application
Suite Teardown      Close Application


*** Variables ***
${WINDOW}       Window[@Name="Widgets Gallery (QML)"]


*** Test Cases ***
All Navigation Buttons Exist
    [Documentation]    Verify all navigation buttons are accessible
    [Tags]    navigation
    Ensure Exists    ${WINDOW}
    Ensure Exists    ${WINDOW}//ListItem[@Name="Controls Page"]
    Ensure Exists    ${WINDOW}//ListItem[@Name="ListView Page"]
    Ensure Exists    ${WINDOW}//ListItem[@Name="TableView Page"]
    Ensure Exists    ${WINDOW}//ListItem[@Name="TextEdit Page"]
    Ensure Exists    ${WINDOW}//ListItem[@Name="About Page"]

Navigate To Controls
    [Documentation]    Click on Controls and verify page loads
    [Tags]    navigation
    Navigate To Controls Page
    Ensure Exists    ${WINDOW}//Button[@Name="Regular Button"]
    Ensure Exists    ${WINDOW}//Button[@Name="Primary Button with Icon"]
    Ensure Exists    ${WINDOW}//Group[@Name="Buttons Group"]

Navigate To ListView
    [Documentation]        Click on ListView and verify page loads
    [Tags]    navigation
    Navigate To ListView Page
    Ensure Exists    ${WINDOW}//ComboBox[@Name="Vertical Scroll Policy"]
    Ensure Exists    ${WINDOW}//List[@Name="Left ListView"]

Navigate To TableView
    [Documentation]    Click on TableView and verify page loads
    [Tags]    navigation
    Navigate To TableView Page
    Ensure Exists    ${WINDOW}//Edit[@Name="Filter by Header 1"]

Navigate To TextEdit
    [Documentation]    Click on TextEdit and verify page loads
    [Tags]    navigation
    Navigate To TextEdit Page
    Ensure Exists    ${WINDOW}//TabItem[@Name="With Word Wrap Tab"]
    Ensure Exists    ${WINDOW}//TabItem[@Name="No Word Wrap Tab"]

Navigate To About
    [Documentation]    Click on About and verify page loads
    [Tags]    navigation
    Navigate To About Page
    Ensure Exists    ${WINDOW}//Button[@Name="GitHub Link Button"]
    Ensure Exists    ${WINDOW}//Button[@Name="Documentation Button"]
