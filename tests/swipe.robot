*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***

Deve remover o Mandaloriano

    Start session
    Get started
    Navigate to      Star Wars
    Go to item       Lista        Mandaloriano

    Swipe and remove element    @mando    Mandaloriano

    Close session

Deve remover o Darth Vader

    Start session
    Get started
    Navigate to      Star Wars
    Go to item       Lista        Darth Vader

    Swipe and remove element    @darthvader    Darth Vader

    Close session

Deve remover a Princesa Leia

    Start session
    Get started
    Navigate to      Star Wars
    Go to item       Lista        Princesa Leia

    Swipe and remove element    @leia    Princesa Leia

    Close session

Deve remover o Luke Skywalker

    Start session
    Get started
    Navigate to      Star Wars
    Go to item       Lista        Luke Skywalker

    Swipe and remove element    @skywalker    Luke Skywalker

    Close session

Deve remover o Chewbacca

    Start session
    Get started
    Navigate to      Star Wars
    Go to item       Lista        Chewbacca

    Swipe and remove element    @chewie    Chewbacca

    Close session

*** Keywords ***
Swipe and remove element
    [Arguments]    ${name}    ${nickname}

    ${positions}    Get Element Location    xpath=//android.widget.TextView[@text="${nickname}"]/../../..//*[contains(@resource-id, "indicator")]
    ${start_x}      Set Variable            ${positions}[x]
    ${start_y}      Set Variable            ${positions}[y]
    ${offset_x}     Evaluate                ${positions}[x] - 650
    ${offset_y}     Set Variable            ${positions}[y]
    Swipe           ${start_x}              ${start_y}                                                                                               ${offset_x}    ${offset_y}    1000

    Click Element    id=com.qaxperience.yodapp:id/btnRemove

    Wait Until Page Does Not Contain    ${name}