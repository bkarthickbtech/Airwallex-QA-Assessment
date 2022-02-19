*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
BSB Account Type Value Should be 6 characters - @US@LOCAL
    [Tags]  negative_cases
    ${BANK_DETAILS}=  Load Test Data    payload_US
    ${PAYLOAD}=       Update Bank Details In Json       ${BANK_DETAILS}
    @{PAY_MET_TYPE}=  Create list           ${LOCAL}
    ${PAYLOAD}=       Update Value To Json  ${PAYLOAD}   $..payment_methods     ${PAY_MET_TYPE}
    ${OBJ_TO_ADD}=    Create Dictionary      account_routing_value1=02100
    ${PAY_LOAD}=      Add Object To Json  ${PAYLOAD}    $..bank_details        ${OBJ_TO_ADD}
    ${RESP_MSG}=      Create a New Beneficiary Request   ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${FAILED_ABA_LENGTH_INVALID}