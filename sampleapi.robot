*** Settings ***
Documentation     Prise en main de RobotFramework
Test Setup
Test Teardown
Test Timeout      5 minutes 10 seconds    # Maximum time test cases in this suite are allowed to execute beforre aborting
Library           REST    https://jsonplaceholder.typicode.com    # Url de l'API pour le Test avec le robotframework

*** Test Cases ***
JSONPath query from object
    GET    /users/1
    Integer    $.id    1
    Integer    $[id]    1
    Integer    $."id"    1
    String    $.name    Leanne Graham
    String    $.'name'    Leanne Graham
    String    $..lat    -37.3159
    String    $.company.name    Romaguera-Crona
    String    $.name|$.username    Bret
    Integer    $.name|$.id    13    # the previous 1 is kept in enum!
    Object    $.name|$.id|$.company
    Missing    response body notexisting
    Missing    $.notexisting
