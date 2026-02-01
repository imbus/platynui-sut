*** Settings ***
Documentation       PlatynUI Keyword Validation Suite
...                 Focus: Systematic testing of all PlatynUI keywords
...                 Validates keyword functionality, parameters, and return values
...                 Each test demonstrates proper keyword usage and expected behavior

Library             PlatynUI
Resource            ../tests/ressources/app_keywords.resource
Suite Setup         Open Application
Suite Teardown      Close Application
Test Timeout        15 seconds


*** Variables ***
${WINDOW}               Window[@Name="${APP_NAME}"]
${REGULAR_BUTTON}       ${WINDOW}//Button[@Name="Regular Button"]
${CHECKED_CHECKBOX}     ${WINDOW}//CheckBox[@Name="Checked Checkbox"]
${SELECT_COMBOBOX}      ${WINDOW}//ComboBox[@Name="Select ComboBox"]
${FILTER_TEXTFIELD}     ${WINDOW}//Edit[@Name="Filter by Header 1"]
${PROGRESS_SLIDER}      ${WINDOW}//Slider[@Name="Progress Slider"]
${STATUS_LABEL}         ${WINDOW}//Text[@Name="Status Bar Label"]


*** Test Cases ***
# =============================================================================
# KEYWORD: Activate
# Purpose: Click/activate UI elements (buttons, menu items, checkboxes, etc.)
# Return: None
# =============================================================================

Activate - Button Click
    [Documentation]    Activate clicks a button and triggers its action
    [Tags]    keyword    activate    button
    Navigate To Controls Page
    Activate    ${REGULAR_BUTTON}
    ${status}=    Get Text    ${STATUS_LABEL}
    Should Contain    ${status}    Regular clicked

Activate - CheckBox Toggle
    [Documentation]    Activate toggles checkbox state
    [Tags]    keyword    activate    checkbox
    Navigate To Controls Page
    ${before}=    Get Property Value    ${CHECKED_CHECKBOX}    Toggle.ToggleState
    Activate    ${CHECKED_CHECKBOX}
    ${after}=    Get Property Value    ${CHECKED_CHECKBOX}    Toggle.ToggleState
    Should Not Be Equal    ${before}    ${after}

Activate - MenuItem Selection
    [Documentation]    Activate selects menu items
    [Tags]    keyword    activate    menu
    Activate    ${WINDOW}//MenuItem[@Name="New"]
    ${status}=    Get Text    ${STATUS_LABEL}
    Should Contain    ${status}    New file

Activate - Navigation ListItem
    [Documentation]    Activate can click navigation items
    [Tags]    keyword    activate    navigation
    Activate    ${WINDOW}//ListItem[@Name="About Page"]
    Ensure Exists    ${WINDOW}//Button[@Name="GitHub Link Button"]
    Activate    ${WINDOW}//ListItem[@Name="Controls Page"]

# =============================================================================
# KEYWORD: Mouse Click / Mouse Double Click / Mouse Right Click
# Purpose: Direct mouse interactions with coordinates and buttons
# Parameters: element, [x_offset], [y_offset], [button]
# Return: None
# =============================================================================

Mouse Click - Center Of Element
    [Documentation]    Mouse Click clicks center of element by default
    [Tags]    keyword    mouse    click
    Navigate To Controls Page
    Mouse Click    ${REGULAR_BUTTON}
    ${status}=    Get Text    ${STATUS_LABEL}
    Should Contain    ${status}    clicked

Mouse Click - With Offset
    [Documentation]    Mouse Click supports x/y offset from element center
    [Tags]    keyword    mouse    offset
    Navigate To Controls Page
    Mouse Click    ${REGULAR_BUTTON}    10    5
    ${status}=    Get Text    ${STATUS_LABEL}
    Should Contain    ${status}    clicked

Mouse Double Click - Element
    [Documentation]    Mouse Double Click performs double-click action
    [Tags]    keyword    mouse    doubleclick
    Navigate To TextEdit Page
    Activate    ${WINDOW}//PageTab[@Name="With Word Wrap Tab"]
    Mouse Double Click    ${WINDOW}//EditableText[@Name="Text Editor with Word Wrap"]
    # Double-click in text field selects word

Mouse Right Click - Context Menu
    [Documentation]    Mouse Right Click opens context menus
    [Tags]    keyword    mouse    rightclick
    Navigate To TextEdit Page
    Activate    ${WINDOW}//PageTab[@Name="With Word Wrap Tab"]
    Mouse Click   ${WINDOW}//EditableText[@Name="Text Editor with Word Wrap"]    button=right
    # Right-click should open context menu (if implemented)

# =============================================================================
# KEYWORD: Get Text
# Purpose: Retrieve text content from UI elements
# Parameters: element
# Return: String (text content)
# =============================================================================

Get Text - From Label
    [Documentation]    Get Text retrieves visible text from labels
    [Tags]    keyword    gettext    label
    Navigate To Controls Page
    ${text}=    Get Text    ${WINDOW}//StaticText[@Name="Instruction: Click a control to see action"]
    Should Contain    ${text}    Click a control

Get Text - From Button
    [Documentation]    Get Text works with button labels
    [Tags]    keyword    gettext    button
    Navigate To Controls Page
    ${text}=    Get Text    ${REGULAR_BUTTON}
    Should Be Equal    ${text}    Regular Button

Get Text - From TextField
    [Documentation]    Get Text retrieves current text from input fields
    [Tags]    keyword    gettext    textfield
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    TestValue
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    TestValue

Get Text - Empty Field
    [Documentation]    Get Text returns empty string for empty fields
    [Tags]    keyword    gettext    empty
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    ${EMPTY}
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    ${EMPTY}

# =============================================================================
# KEYWORD: Set Text
# Purpose: Set text content in editable fields (overwrite existing text)
# Parameters: element, text
# Return: None
# =============================================================================

Set Text - Replace Content
    [Documentation]    Set Text overwrites existing content completely
    [Tags]    keyword    settext    replace
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    Original
    Set Text    ${FILTER_TEXTFIELD}    Replaced
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    Replaced

Set Text - Clear Field
    [Documentation]    Set Text with empty string clears the field
    [Tags]    keyword    settext    clear
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    SomeText
    Set Text    ${FILTER_TEXTFIELD}    ${EMPTY}
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    ${EMPTY}

Set Text - Special Characters
    [Documentation]    Set Text handles special characters
    [Tags]    keyword    settext    special
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    Test@123!#$%
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    Test@123!#$%

Set Text - Multiline Text
    [Documentation]    Set Text in multiline text editor
    [Tags]    keyword    settext    multiline
    Navigate To TextEdit Page
    Activate    ${WINDOW}//PageTab[@Name="With Word Wrap Tab"]
    ${multiline}=    Catenate    SEPARATOR=\n    Line 1    Line 2    Line 3
    Set Text    ${WINDOW}//EditableText[@Name="Text Editor with Word Wrap"]    ${multiline}
    ${text}=    Get Text    ${WINDOW}//EditableText[@Name="Text Editor with Word Wrap"]
    Should Contain    ${text}    Line 1

# =============================================================================
# KEYWORD: Type Text
# Purpose: Simulate keyboard typing (appends to existing text)
# Parameters: element, text
# Return: None
# =============================================================================

Type Text - Append To Existing
    [Documentation]    Type Text appends text to existing content
    [Tags]    keyword    typetext    append
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    Hello
    Type Keys    ${FILTER_TEXTFIELD}    World
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    HelloWorld

Type Text - Simulate Typing Speed
    [Documentation]    Type Text simulates natural keyboard input
    [Tags]    keyword    typetext    simulate
    Navigate To TableView Page
    Set Text    ${FILTER_TEXTFIELD}    ${EMPTY}
    Type Keys    ${FILTER_TEXTFIELD}    TypedText
    ${text}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${text}    TypedText

# =============================================================================
# KEYWORD: Press Keys
# Purpose: Send special keys and key combinations
# Parameters: element, keys (e.g., "ctrl+a", "enter", "tab")
# Return: None
# =============================================================================

Press Keys - Enter Key
    [Documentation]    Press Keys sends Enter key
    [Tags]    keyword    presskeys    enter
    Navigate To TableView Page
    Mouse Click    ${FILTER_TEXTFIELD}
    Type Keys    ${FILTER_TEXTFIELD}    Test
    Press Keys    ${FILTER_TEXTFIELD}    enter
    # Enter key press registered

Press Keys - Tab Navigation
    [Documentation]    Press Keys sends Tab for navigation
    [Tags]    keyword    presskeys    tab
    Navigate To TableView Page
    Mouse Click    ${FILTER_TEXTFIELD}
    Press Keys    ${FILTER_TEXTFIELD}    tab
    # Tab moves focus to next element

# =============================================================================
# KEYWORD: Get Property
# Purpose: Retrieve element properties (state, value, attributes)
# Parameters: element, property_name
# Return: String/Boolean/Number (property value)
# =============================================================================

Get Property - Toggle State
    [Documentation]    Get Property retrieves checkbox/toggle state
    [Tags]    keyword    getproperty    toggle
    Navigate To Controls Page
    ${state}=    Get Property Value  ${CHECKED_CHECKBOX}    Toggle.ToggleState
    Should Be True    '${state}' == 'On' or '${state}' == 'Off'

Get Property - Value From Slider
    [Documentation]    Get Property gets numeric values from sliders
    [Tags]    keyword    getproperty    value
    Navigate To Controls Page
    ${value}=    Get Property Value   ${PROGRESS_SLIDER}    RangeValue.Value
    Should Not Be Equal    ${value}    ${NONE}

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

# =============================================================================
# KEYWORD: Ensure Exists
# Purpose: Verify element exists and is available (with timeout)
# Parameters: element, [timeout], [interval]
# Return: None (raises exception if not found)
# =============================================================================

Ensure Exists - Element Present
    [Documentation]    Ensure Exists verifies element is in UI tree
    [Tags]    keyword    ensureexists    present
    Navigate To Controls Page
    Ensure Exists    ${REGULAR_BUTTON}

Ensure Exists - With Timeout
    [Documentation]    Ensure Exists waits up to timeout for element
    [Tags]    keyword    ensureexists    timeout
    Navigate To About Page
    Ensure Exists    ${WINDOW}//Button[@Name="GitHub Link Button"]    timeout=5s

Ensure Exists - Navigation Item
    [Documentation]    Ensure Exists validates navigation elements
    [Tags]    keyword    ensureexists    navigation
    Ensure Exists    ${WINDOW}//ListItem[@Name="Controls Page"]
    Ensure Exists    ${WINDOW}//ListItem[@Name="About Page"]

# =============================================================================
# KEYWORD: Is Active
# Purpose: Check if window/element has focus/is active
# Parameters: element
# Return: Boolean (True if active)
# =============================================================================

Is Active - Main Window
    [Documentation]    Is Active checks if window is active/focused
    [Tags]    keyword    isactive    window
    ${active}=    Is Active    ${WINDOW}
    Should Be True    ${active}

Is Active - After Activation
    [Documentation]    Is Active returns True after activating window
    [Tags]    keyword    isactive    activate
    Activate    ${WINDOW}
    ${active}=    Is Active    ${WINDOW}
    Should Be True    ${active}

# =============================================================================
# KEYWORD COMBINATION TESTS
# Validate keywords work together in realistic scenarios
# =============================================================================

Keyword Flow - Complete Form Interaction
    [Documentation]    Combine multiple keywords in realistic workflow
    [Tags]    keyword    flow    integration
    Navigate To TableView Page

    # Clear and set text
    Set Text    ${FILTER_TEXTFIELD}    ${EMPTY}
    ${empty}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${empty}    ${EMPTY}

    # Type text incrementally
    Type Keys    ${FILTER_TEXTFIELD}    Row
    ${partial}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${partial}    Row

    # Add more text
    Type Keys    ${FILTER_TEXTFIELD}    ${SPACE}1
    ${full}=    Get Text    ${FILTER_TEXTFIELD}
    Should Be Equal    ${full}    Row 1

    # Verify element state
    ${enabled}=    Get Property Value   ${FILTER_TEXTFIELD}    IsEnabled
    Should Be True    ${enabled}

Keyword Flow - Navigation And Verification
    [Documentation]    Navigate between pages and verify elements exist
    [Tags]    keyword    flow    navigation

    Navigate To Controls Page
    Ensure Exists    ${REGULAR_BUTTON}

    Navigate To ListView Page
    Ensure Exists    ${WINDOW}//ComboBox[@Name="Vertical Scroll Policy"]

    Navigate To TextEdit Page
    Ensure Exists    ${WINDOW}//PageTab[@Name="With Word Wrap Tab"]

    Navigate To About Page
    Ensure Exists    ${WINDOW}//Button[@Name="GitHub Link Button"]

    Navigate To Controls Page
    ${active}=    Is Active    ${WINDOW}
    Should Be True    ${active}


