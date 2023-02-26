*** Variables ***
${zmienna}    pies
@{my_list}    Mama    Tata    Pies    Kot    Ptak    I jeszcze cos


*** Test Cases ***
FOR LOOP 1
    FOR    ${name}    IN    @{my_list}
        log    ${name}
        log to console    ${name}
    END


FOR LOOP 2
    FOR    ${name}    IN    @{my_list}
        IF    $name == 'Pies'    log to console    ${name}
    END

FOR LOOP 3
    @{my_list}    create list    Mama    Tata    Pies    Kot    Ptak    I jeszcze cos
    FOR    ${name}    IN    @{my_list}
        IF    $name == 'Pies'    BREAK
        log    ${name}
    END

FOR LOOP 4
    @{my_list}    create list    Mama    Tata    Pies    Kot    Ptak    I jeszcze cos
    FOR    ${name}    IN    @{my_list}
        IF    $name == 'Pies'    CONTINUE
        log    ${name}
    END

WHILE LOOP
    ${index}    set variable    10
    WHILE    ${index} > 0
        log    ${index}
        ${index}    evaluate     ${index} - 1
    END

Loop a list
    Log     ${my_list}
