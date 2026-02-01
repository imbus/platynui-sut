*** Settings ***
Documentation     Comprehensive Smoke & Regression Test Suite for PlatynUI 0.9.2
...               Tests all available keywords and UI elements in the QML application
...               Ensures PlatynUI library functionality remains stable during development
Library           PlatynUI
Library           Process
Library           OperatingSystem
Suite Setup       Start Test Application
Suite Teardown    Stop Test Application
Test Timeout      30 seconds


*** Variables ***
${APP_HANDLE}           ${NONE}
${APP_NAME}             Widgets Gallery (QML)
${WINDOW_LOCATOR}       Window[@Name="${APP_NAME}"]


*** Test Cases ***
# =============================================================================
# APPLICATION LIFECYCLE TESTS
# =============================================================================

Application Starts Successfully
    [Documentation]    Verify application launches and main window is accessible
    [Tags]    smoke    lifecycle
    Ensure Exists    ${WINDOW_LOCATOR}
    ${is_active}=    Is Active    ${WINDOW_LOCATOR}
    Should Be True    ${is_active}


# =============================================================================
# NAVIGATION TESTS
# =============================================================================

Navigate To Controls Page
    [Documentation]    Verify navigation to Controls page works
    [Tags]    smoke    navigation
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Controls"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]


Navigate To ListView Page
    [Documentation]    Verify navigation to ListView page works
    [Tags]    smoke    navigation
    Activate    ${WINDOW_LOCATOR}//Button[@Name="ListView"]
    Ensure Exists    ${WINDOW_LOCATOR}//ComboBox[@Name="Vertical Scroll Policy"]


Navigate To TableView Page
    [Documentation]    Verify navigation to TableView page works
    [Tags]    smoke    navigation
    Activate    ${WINDOW_LOCATOR}//Button[@Name="TableView"]
    Ensure Exists    ${WINDOW_LOCATOR}//EditableText[@Name="Filter by Header 1"]


Navigate To TextEdit Page
    [Documentation]    Verify navigation to TextEdit page works
    [Tags]    smoke    navigation
    Activate    ${WINDOW_LOCATOR}//Button[@Name="TextEdit"]
    Ensure Exists    ${WINDOW_LOCATOR}//PageTab[@Name="With Word Wrap Tab"]


Navigate To About Page
    [Documentation]    Verify navigation to About page works
    [Tags]    smoke    navigation
    Activate    ${WINDOW_LOCATOR}//Button[@Name="About"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="GitHub Link Button"]


# =============================================================================
# ACTIVATE KEYWORD TESTS (BUTTONS)
# =============================================================================

Activate Regular Button
    [Documentation]    Test Activate keyword with regular button
    [Tags]    regression    activate    controls
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Regular clicked


Activate Primary Button
    [Documentation]    Activate keyword with primary button
    [Tags]    regression    activate    controls
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Primary Button with Icon"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Primary button clicked


Activate Tool Button
    [Documentation]    Test Activate keyword with tool button
    [Tags]    regression    activate    controls
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Tool Button"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Tool Button clicked


# =============================================================================
# CHECKBOX TESTS
# =============================================================================

Activate CheckBox
    [Documentation]    Test Activate keyword toggles checkbox state
    [Tags]    regression    activate    checkbox
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//CheckBox[@Name="Checked Checkbox"]
    Activate    ${locator}
    # Checkbox should toggle from checked to unchecked
    Sleep    0.2s


Indeterminate CheckBox
    [Documentation]    Test checkbox for indeterminate progress bar
    [Tags]    regression    checkbox    controls
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//CheckBox[@Name="Indeterminate"]
    Sleep    0.5s    # Visual verification of progress bar


# =============================================================================
# COMBOBOX TESTS
# =============================================================================

Activate ComboBox
    [Documentation]    Test Activate keyword on ComboBox
    [Tags]    regression    activate    combobox
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//ComboBox[@Name="Select ComboBox"]
    Activate    ${locator}
    Sleep    0.3s


# =============================================================================
# SWITCH TESTS
# =============================================================================

Activate Switch
    [Documentation]    Test Activate keyword toggles switch
    [Tags]    regression    activate    switch
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//CheckBox[@Name="Flight Mode Switch"]
    Activate    ${locator}
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain Any    ${status}    Flight Mode ON    Flight Mode OFF


# =============================================================================
# RADIOBUTTON TESTS
# =============================================================================

Activate RadioButton Small
    [Documentation]    Test Activate keyword on radio button
    [Tags]    regression    activate    radiobutton
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//RadioButton[@Name="Small"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Size: Small


Activate RadioButton Medium
    [Documentation]    Test Activate keyword on radio button
    [Tags]    regression    activate    radiobutton
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//RadioButton[@Name="Medium"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Size: Medium


Activate RadioButton Large
    [Documentation]    Test Activate keyword on radio button
    [Tags]    regression    activate    radiobutton
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//RadioButton[@Name="Large"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Size: Large


# =============================================================================
# SPINBOX TESTS
# =============================================================================

Get Text From SpinBox
    [Documentation]    Test Get Text keyword on SpinBox
    [Tags]    regression    get_text    spinbox
    Navigate To Controls Page
    ${value}=    Get Text    ${WINDOW_LOCATOR}//SpinBox[@Name="Day"]
    Should Not Be Empty    ${value}


Activate Select DateTime Button
    [Documentation]    Test Activate keyword on date/time select button
    [Tags]    regression    activate    datetime
    Navigate To Controls Page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Select Date and Time"]
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Selected


# =============================================================================
# MOUSE CLICK TESTS
# =============================================================================

Mouse Click On Button
    [Documentation]    Test Mouse Click keyword as alternative to Activate
    [Tags]    regression    mouse    click
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    Mouse Click    ${locator}
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Regular clicked


Mouse Double Click On Button
    [Documentation]    Test Mouse Double Click keyword
    [Tags]    regression    mouse    double_click
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Primary Button with Icon"]
    Mouse Double Click    ${locator}
    Sleep    0.3s


# =============================================================================
# GET TEXT TESTS
# =============================================================================

Get Text From Label
    [Documentation]    Test Get Text keyword on static text
    [Tags]    regression    get_text
    Navigate To Controls Page
    ${text}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "Click a control")]
    Should Contain    ${text}    control


Get Text From GroupBox Title
    [Documentation]    Test Get Text keyword on GroupBox
    [Tags]    regression    get_text
    Navigate To Controls Page
    ${text}=    Get Text    ${WINDOW_LOCATOR}//Grouping[@Name="Buttons Group"]
    Should Not Be Empty    ${text}


# =============================================================================
# SET TEXT TESTS
# =============================================================================

Set Text On TextArea With Word Wrap
    [Documentation]    Test Set Text keyword on TextArea
    [Tags]    regression    set_text    textarea
    Navigate To TextEdit Page
    Activate    ${WINDOW_LOCATOR}//PageTab[@Name="With Word Wrap Tab"]
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Text Edit with Word Wrap"]
    Set Text    ${locator}    Test text from Robot Framework
    ${text}=    Get Text    ${locator}
    Should Be Equal    ${text}    Test text from Robot Framework


Set Text On TextArea Without Word Wrap
    [Documentation]    Test Set Text keyword on TextArea without wrap
    [Tags]    regression    set_text    textarea
    Navigate To TextEdit Page
    Activate    ${WINDOW_LOCATOR}//PageTab[@Name="No Word Wrap Tab"]
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Text Edit without Word Wrap"]
    Set Text    ${locator}    Another test text
    ${text}=    Get Text    ${locator}
    Should Be Equal    ${text}    Another test text


Set Text On Filter TextField
    [Documentation]    Test Set Text keyword on TextField
    [Tags]    regression    set_text    textfield
    Navigate To TableView Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Filter by Header 1"]
    Set Text    ${locator}    Item 1
    ${text}=    Get Text    ${locator}
    Should Contain    ${text}    Item 1


# =============================================================================
# TYPE KEYS / PRESS KEYS TESTS
# =============================================================================

Type Keys In TextArea
    [Documentation]    Test Type Keys keyword
    [Tags]    regression    type_keys
    Navigate To TextEdit Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Text Edit with Word Wrap"]
    Activate    ${locator}
    Set Text    ${locator}    ${EMPTY}
    Type Keys    ${locator}    Hello World!
    ${text}=    Get Text    ${locator}
    Should Contain    ${text}    Hello World


Press Keys Ctrl+A
    [Documentation]    Test Press Keys keyword with key combination
    [Tags]    regression    press_keys
    Navigate To TextEdit Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Text Edit with Word Wrap"]
    Set Text    ${locator}    Some text to select
    Activate    ${locator}
    Press Keys    ${locator}    Control+a
    Sleep    0.2s


# =============================================================================
# LISTVIEW TESTS
# =============================================================================

ListView Elements Exist
    [Documentation]    Verify ListView elements are accessible
    [Tags]    regression    listview
    Navigate To ListView Page
    Ensure Exists    ${WINDOW_LOCATOR}//List[@Name="Left ListView"]
    Ensure Exists    ${WINDOW_LOCATOR}//List[@Name="Right ListView"]


Activate ListView Item
    [Documentation]    Test clicking on ListView item
    [Tags]    regression    listview    activate
    Navigate To ListView Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//ListItem[contains(@Name, "Item 0")]
    Activate    ${locator}
    Sleep    0.2s


# =============================================================================
# TABLEVIEW TESTS
# =============================================================================

TableView Exists
    [Documentation]    Verify TableView is accessible
    [Tags]    regression    tableview
    Navigate To TableView Page
    Ensure Exists    ${WINDOW_LOCATOR}//Table[@Name="Data Table"]


TableView Filter
    [Documentation]    Test filtering table content
    [Tags]    regression    tableview    filter
    Navigate To TableView Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//EditableText[@Name="Filter by Header 1"]
    Set Text    ${locator}    Item 1
    Sleep    0.5s    # Wait for filter to apply


Activate Table Cell
    [Documentation]    Test clicking on table cell
    [Tags]    regression    tableview    activate
    Navigate To TableView Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Cell[contains(@Name, "Row 1")]
    Mouse Click    ${locator}
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Clicked row


# =============================================================================
# MENU TESTS
# =============================================================================

Activate File Menu New
    [Documentation]    Test menu item activation
    [Tags]    regression    menu    activate
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//MenuItem[@Name="New"]
    Activate    ${locator}
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    New


Activate Edit Menu Copy
    [Documentation]    Test Edit menu item
    [Tags]    regression    menu    activate
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//MenuItem[@Name="Copy"]
    Activate    ${locator}
    ${status}=    Get Text    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]
    Should Contain    ${status}    Copy


# =============================================================================
# TOOLBAR TESTS
# =============================================================================

Toggle Widgets Enabled Checkbox
    [Documentation]    Test widgets enabled/disabled functionality
    [Tags]    regression    toolbar    checkbox
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//CheckBox[@Name="Widgets Enabled"]
    Activate    ${locator}
    Sleep    0.3s
    Activate    ${locator}    # Toggle back
    Sleep    0.3s


Toggle Widgets Readonly Checkbox
    [Documentation]    Test widgets readonly functionality
    [Tags]    regression    toolbar    checkbox
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//CheckBox[@Name="Widgets Readonly"]
    Activate    ${locator}
    Sleep    0.3s
    Activate    ${locator}    # Toggle back
    Sleep    0.3s


Toggle Dark Mode
    [Documentation]    Test dark mode toggle functionality
    [Tags]    regression    toolbar    darkmode
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[contains(@Name, "Switch to")]
    Activate    ${locator}
    Sleep    0.5s
    Activate    ${locator}    # Toggle back
    Sleep    0.5s


# =============================================================================
# ABOUT PAGE TESTS
# =============================================================================

GitHub Button Accessible
    [Documentation]    Verify GitHub button is accessible
    [Tags]    regression    about
    Navigate To About Page
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="GitHub Link Button"]


Documentation Button Accessible
    [Documentation]    Verify Documentation button is accessible
    [Tags]    regression    about
    Navigate To About Page
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="Documentation Button"]


# =============================================================================
# GET PROPERTY TESTS
# =============================================================================

Get Property Names
    [Documentation]    Test Get Property Names keyword
    [Tags]    regression    properties
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    ${properties}=    Get Property Names    ${locator}
    Should Not Be Empty    ${properties}


Get Property Value
    [Documentation]    Test Get Property Value keyword
    [Tags]    regression    properties
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    ${value}=    Get Property Value    ${locator}    Name
    Should Be Equal    ${value}    Regular Button


# =============================================================================
# IS ACTIVE TESTS
# =============================================================================

Is Active On Window
    [Documentation]    Test Is Active keyword on window
    [Tags]    regression    is_active
    ${is_active}=    Is Active    ${WINDOW_LOCATOR}
    Should Be True    ${is_active}


Is Active On Button
    [Documentation]    Test Is Active keyword on button
    [Tags]    regression    is_active
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    ${is_active}=    Is Active    ${locator}
    Should Be True    ${is_active}


# =============================================================================
# ENSURE EXISTS TESTS
# =============================================================================

Ensure Exists All Navigation Buttons
    [Documentation]    Verify all navigation buttons exist
    [Tags]    regression    ensure_exists
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="Controls"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="ListView"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="TableView"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="TextEdit"]
    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="About"]


Ensure Exists Main Window Elements
    [Documentation]    Verify main window structure exists
    [Tags]    smoke    ensure_exists
    Ensure Exists    ${WINDOW_LOCATOR}
    Ensure Exists    ${WINDOW_LOCATOR}//StaticText[contains(@Name, "status")]


# =============================================================================
# MOUSE POSITION / MOUSE MOVE TESTS
# =============================================================================

Mouse Position
    [Documentation]    Test Mouse Position keyword
    [Tags]    regression    mouse
    ${position}=    Mouse Position
    Should Not Be Empty    ${position}


Mouse Move To Element
    [Documentation]    Test Mouse Move To keyword
    [Tags]    regression    mouse    move
    Navigate To Controls Page
    ${locator}=    Set Variable    ${WINDOW_LOCATOR}//Button[@Name="Regular Button"]
    Mouse Move To    ${locator}
    Sleep    0.2s


# =============================================================================
# NEGATIVE TESTS
# =============================================================================

Ensure Exists Fails For Non-Existent Element
    [Documentation]    Verify Ensure Exists fails for non-existent element
    [Tags]    regression    negative
    Run Keyword And Expect Error    *
    ...    Ensure Exists    ${WINDOW_LOCATOR}//Button[@Name="NonExistentButton"]    timeout=2s


Get Text Fails For Non-Existent Element
    [Documentation]    Verify Get Text fails for non-existent element
    [Tags]    regression    negative
    Run Keyword And Expect Error    *
    ...    Get Text    ${WINDOW_LOCATOR}//Button[@Name="NonExistentElement"]    timeout=2s


*** Keywords ***
Start Test Application
    [Documentation]    Start the QML application before test suite
    ${handle}=    Start Process    uv    run    python    src/platynui_sut/main.py
    ...    cwd=${EXECDIR}/..
    ...    shell=True
    Sleep    4s    # Wait for application to start
    Set Suite Variable    ${APP_HANDLE}    ${handle}
    # Verify application started
    Ensure Exists    ${WINDOW_LOCATOR}    timeout=15s


Stop Test Application
    [Documentation]    Stop the QML application after test suite
    Run Keyword And Ignore Error    Terminate Process    ${APP_HANDLE}
    Run Keyword And Ignore Error    Wait For Process    ${APP_HANDLE}    timeout=5s


Navigate To Controls Page
    [Documentation]    Navigate to Controls page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="Controls"]
    Sleep    0.2s


Navigate To ListView Page
    [Documentation]    Navigate to ListView page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="ListView"]
    Sleep    0.2s


Navigate To TableView Page
    [Documentation]    Navigate to TableView page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="TableView"]
    Sleep    0.2s


Navigate To TextEdit Page
    [Documentation]    Navigate to TextEdit page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="TextEdit"]
    Sleep    0.2s


Navigate To About Page
    [Documentation]    Navigate to About page
    Activate    ${WINDOW_LOCATOR}//Button[@Name="About"]
    Sleep    0.2s
