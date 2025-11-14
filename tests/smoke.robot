***settings***
Library    PlatynUI
Library    Process


*** Variables ***
${APP_HANDLE}    value



*** Test Cases ***
Mouse Click Test
    [Documentation]    This test verifies mouse click functionality.
    [Teardown]    Close Application
    #Open Application
    Activate      Window[@Name="Widgets Gallery (QML)"]//Button[@Name="Regular Button"]
    Sleep    3s    
    # Click Element    id=submit-button
    # Element Should Contain    id=result    Success


*** Keywords ***
Open Application
    ${handle}=    Start Process    uv    run    python    -m    platynui_sut.main_qml
    ...    cwd=${EXECDIR}/..
    ...    shell=True
    Sleep    2s    # Warte bis App gestartet ist
    Set Suite Variable    ${APP_HANDLE}    ${handle}

Close Application
    Terminate Process    ${APP_HANDLE}
    Wait For Process    ${APP_HANDLE}    timeout=5s