*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
Account name should not be any 1 characters - @US@SWIFT
    [Tags]  negative_cases
    ${BANK_DETAILS}=        Load Test Data    payload_US        account_name=a
    ${PAYLOAD}=             Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=            Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}

Account name should not be empty@AU@SWIFT
    [Tags]  negative_cases
    ${BANK_DETAILS}=        Load Test Data    payload_US        account_name=
    ${PAYLOAD}=             Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=            Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${FAILED_FIELD_IS_REQUIRED}

Field Account name should be mandatory - @CN @SWIFT
    [Tags]  negative_cases
    ${BANK_DETAILS}=        Load Test Data    payload_US
    ${PAYLOAD}=             Update Bank Details In Json         ${BANK_DETAILS}
    ${PAYLOAD}=             Delete Object From Json  ${PAYLOAD}   $..bank_details.account_name
    ${RESP_MSG}=            Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed   ${RESP_MSG}      ${FAILED_FIELD_IS_REQUIRED}