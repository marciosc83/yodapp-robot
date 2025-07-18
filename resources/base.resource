*** Settings ***
Library    AppiumLibrary

*** Variables ***
${URL}                       http://localhost:4723
${PLATOFORM_NAME}            Android
${DEVICE_NAME}               Android Emulator
${AUTOMATION_NAME}           UIAutomator2
${APP}                       ${EXECDIR}/app/yodapp-beta.apk
${UD_ID}                     emulator-5554
${AUTO_GRANT_PERMISSIONS}    true

${START}    QAX

*** Keywords ***
Open Android Test App
    Open Application    ${URL}
    ...                 platformName=${PLATOFORM_NAME}
    ...                 deviceName=${DEVICE_NAME}
    ...                 automationName=${AUTOMATION_NAME}
    ...                 app=${APP}
    ...                 udid=${UD_ID}
    ...                 autoGrantPermissions=${AUTO_GRANT_PERMISSIONS}

Start session
    Open Android Test App

Get started
    Wait Until Page Contains    ${START}    10
    Click Text                  ${START}

Navigate to
    [Arguments]                      ${item_text}
    ${menu}                          Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element Is Visible    ${menu}         5
    Click Element                    ${menu}

    ${menu_item}                     Set Variable    xpath=//*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="${item_text}"]
    Wait Until Element Is Visible    ${menu_item}    5
    Click Element                    ${menu_item}

Go to item
    [Arguments]                 ${item}          ${checkpoint}
    Wait Until Page Contains    ${item}          5
    Click Text                  ${item}
    Wait Until Page Contains    ${checkpoint}    5

Close session
    Close Application