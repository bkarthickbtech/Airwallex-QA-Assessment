*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
Field bank country code should be mandatory
    [Tags]  negative_cases
    ${BANK_DETAILS}=   Load Test Data    payload_US
    ${PAYLOAD}=     Update Bank Details In Json         ${BANK_DETAILS}
    ${PAYLOAD}=     Delete Object From Json  ${PAYLOAD}   $..bank_details.bank_country_code
    ${RESP_MSG}=    Create a New Beneficiary Request     ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${FAILED_BANK_CODE_NULL}

Bank country code should not be JP
    [Tags]  negative_cases
    ${BANK_DETAILS}=   Load Test Data    payload_AU     bank_country_code=JP
    ${PAYLOAD}=     Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=    Create a New Beneficiary Request    ${PAYLOAD}
    Should be equal as Strings    ${RESP_MSG}[0]        ${400}