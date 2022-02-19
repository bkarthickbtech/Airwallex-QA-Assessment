*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
Payment Method Should Be LOCAL@US
    [Tags]  positive_cases
    ${BANK_DETAILS}=  Load Test Data    payload_US
    ${PAYLOAD}=       Update Bank Details In Json       ${BANK_DETAILS}
    ${OBJ_TO_ADD}=    Create Dictionary      account_routing_value1=021000021
    ${PAY_LOAD}=      Add Object To Json  ${PAYLOAD}    $..bank_details        ${OBJ_TO_ADD}
    @{PAY_MET_TYPE}=  Create list           ${LOCAL}
    ${PAYLOAD1}=      Update Value To Json  ${PAY_LOAD}   $..payment_methods     ${PAY_MET_TYPE}
    ${RESP_MSG}=      Create a New Beneficiary Request   ${PAYLOAD1}
    Assert Response Passed      ${RESP_MSG}

Payment Method Should Be LOCAL@AU
    [Tags]  negative_cases
    ${BANK_DETAILS}=  Load Test Data    payload_AU
    ${PAYLOAD}=       Update Bank Details In Json       ${BANK_DETAILS}
    ${OBJ_TO_ADD}=    Create Dictionary      account_routing_value1=083064
    ${PAY_LOAD}=      Add Object To Json  ${PAYLOAD}    $..bank_details        ${OBJ_TO_ADD}
    @{PAY_MET_TYPE}=  Create list           ${LOCAL}
    ${PAYLOAD1}=      Update Value To Json  ${PAY_LOAD}   $..payment_methods     ${PAY_MET_TYPE}
    ${RESP_MSG}=      Create a New Beneficiary Request   ${PAYLOAD1}
    Assert Response Passed      ${RESP_MSG}

Payment Method Field Is Mandatory
    [Tags]  negative_cases
    ${BANK_DETAILS}=  Load Test Data    payload_CN
    ${PAYLOAD}=   Update Bank Details In Json       ${BANK_DETAILS}
    ${PAYLOAD}=   Update Value To Json  ${PAYLOAD}   $..payment_methods     []
    ${RESP_MSG}=  Create a New Beneficiary Request   ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${PAYMENT_METHOD_IS_MANDATORY}

Payment Method Should Not be LOCA
    [Tags]  negative_cases
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${LOCA}
    Assert Response Failed   ${RESP_MSG}    ${FAILED_LOCAL_PAYMENT_METHOD_WRONG}

Payment Method Should Not be Null
    [Tags]  negative_cases
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create Beneficiary Request      ${payload}   ${EMPTY}
    Assert Response Failed   ${RESP_MSG}    ${FAILED_PAYMENT_METHOD_NULL}