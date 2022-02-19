*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
Payment Method Should Be SWIFT@US
    [Tags]  positive_cases
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${SWIFT}
    Assert response passed      ${RESP_MSG}

Payment Method Should Be SWIFT@AU
    [Tags]  positive_cases
    ${payload}=     load test data    payload_AU
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${SWIFT}
    Assert response passed      ${RESP_MSG}

Payment Method Should Be SWIFT@CN
    [Tags]  positive_cases
    ${payload}=     load test data    payload_CN
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${SWIFT}
    Assert response passed      ${RESP_MSG}

Payment Method Field Is Mandatory
    [Tags]  negative_cases
    ${BANK_DETAILS}=        Load Test Data    payload_CN
    ${PAYLOAD}=             Update Bank Details In Json       ${BANK_DETAILS}
    ${PAYLOAD}=             Update Value To Json  ${PAYLOAD}   $..payment_methods     []
    ${RESP_MSG}=            Create a New Beneficiary Request   ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${PAYMENT_METHOD_IS_MANDATORY}

Payment Method Should Not be SWIF
    [Tags]  negative_cases
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${SWIF}
    Assert Response Failed   ${RESP_MSG}    ${FAILED_SWIFT_PAYMENT_METHOD_WRONG}

Payment Method Should Not be Null
    [Tags]  negative_cases
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${EMPTY}
    Assert Response Failed   ${RESP_MSG}    ${FAILED_PAYMENT_METHOD_NULL}

Payment Method SWIFT Code Should Be 8 or 11 characters
    [Tags]  negative_cases
    ${BANK_DETAILS}=            Load Test Data    payload_CN
    ${PAYLOAD}=                 Update Bank Details In Json       ${BANK_DETAILS}
    ${PAYLOAD}=                 Update Value To Json  ${PAYLOAD}   $..payment_methods     ICBKCN
    ${RESP_MSG}=                Create a New Beneficiary Request   ${PAYLOAD}
    Assert Response Failed      ${RESP_MSG}   ${FAILED_SWIFT_CODE_NOT_VALID}
