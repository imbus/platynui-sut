***settings***
Library    PlatynUI
Library    Process

*** Test Cases ***
Mouse Click Test
    [Documentation]    This test verifies mouse click functionality.
    Open Application
    # Click Element    id=submit-button
    # Element Should Contain    id=result    Success
    # Close Application


*** Keywords ***
Open Application
    #Start Process    pwd
    VAR    ${TEST}    uv run python -m platynui_sut.qml.main_qml
    #Start Process    ${TEST}