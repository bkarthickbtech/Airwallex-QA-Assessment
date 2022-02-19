*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot
Force Tags          smoke

*** Test Cases ***
Account Number Should Be 1-17 Characters - @US@SWIFT
    [Tags]  positive_cases
    ${BANK_DETAILS}=            Load Test Data    payload_US
    ${PAYLOAD}=                 Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=                Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Passed      ${RESP_MSG}

Account Number Should Be 6-9 Characters - @AU@SWIFT
    [Tags]  positive_cases
    ${BANK_DETAILS}=            Load Test Data    payload_AU
    ${PAYLOAD}=                 Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=                Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Passed      ${RESP_MSG}

Account Number Should Be 8-20 Characters - @CN@SWIFT
    [Tags]  positive_cases
    ${BANK_DETAILS}=            Load Test Data    payload_CN
    ${PAYLOAD}=                 Update Bank Details In Json         ${BANK_DETAILS}
    ${RESP_MSG}=                Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Passed      ${RESP_MSG}

Account num should not be empty characters@US
   [Tags]  negative_cases
   ${BANK_DETAILS}=    Load Test Data    payload_CN
   ${PAYLOAD}=        Update Bank Details In Json         ${BANK_DETAILS}
   ${PAYLOAD}=	Update Value To Json	${PAYLOAD}	$..bank_details.account_number	${EMPTY}
   ${RESP_MSG}=    Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed      ${RESP_MSG}     ${FAILED_FIELD_IS_REQUIRED}

Account num should not be 7 characters@CN
   [Tags]  negative_cases
   ${BANK_DETAILS}=    Load Test Data    payload_CN
   ${PAYLOAD}=        Update Bank Details In Json         ${BANK_DETAILS}
   ${PAYLOAD}=	Update Value To Json	${PAYLOAD}	$..bank_details.account_number	98091
   ${RESP_MSG}=    Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed      ${RESP_MSG}     ${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_CN}

Account num should not be 7 characters@AU
   [Tags]  negative_cases
   ${BANK_DETAILS}=    Load Test Data    payload_AU
   ${PAYLOAD}=        Update Bank Details In Json         ${BANK_DETAILS}
   ${PAYLOAD}=	Update Value To Json	${PAYLOAD}	$..bank_details.account_number	98091
   ${RESP_MSG}=    Create a New Beneficiary Request    ${PAYLOAD}
    Assert Response Failed      ${RESP_MSG}     ${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_AU}