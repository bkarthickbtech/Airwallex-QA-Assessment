*** Keywords ***
Create Authorization Token
    Create Session   httpbin    ${URL}     verify=True
    ${headers}     Create Dictionary    Content-Type    application/json    x-client-id    KJbr_Xs5TLmhY03JWSi3NQ   x-api-key    2308e2dd300f6b959b7f4e0a52ba9181186fc92f075f7e64ee9fa0b6b1ada094c39c9a9f39f06693d06b17067f78d4e7
    ${resp}=  Post Request  httpbin  api/v1/authentication/login     headers=${headers}  data={}
    Should Be Equal As Strings      ${resp.status_code}     ${SUCCESS_RESPONSE_CODE}
    [Return]       ${resp.json()}[token]


Create Beneficiary Request
    [Arguments]     ${BANK_DETAILS}     ${PAYMENT_TYPE}
    ${GET_AUTH_TOKEN}=   Create Authorization Token
    Create Session   httpbin    ${URL}     verify=True
    ${HEADERS}              Create Dictionary     Authorization    Bearer ${GET_AUTH_TOKEN}    Content-Type    application/json
    ${JSON_FILE}=           Load JSON From File     ${EXECDIR}${/}config${/}payload.json
    ${JSON_VAL}=            Update Value To Json   ${JSON_FILE}   $..bank_details     ${BANK_DETAILS}
    @{PAY_METHOD_TYPE}=	    Create list   ${PAYMENT_TYPE}
    ${JSON_VAL}=            Run Keyword If	'${PAYMENT_TYPE}' == ''  Delete Object From Json  ${JSON_FILE}   $..payment_methods
    ...     ELSE            Update Value To Json   ${JSON_FILE}   $..payment_methods     ${PAY_METHOD_TYPE}
    ${resp}=    Post Request  httpbin  api/v1/beneficiaries/create     headers=${HEADERS}  data=${JSON_VAL}
    @{RESP_LIST}=        Create list    ${resp.status_code}    ${resp.json()}
    [Return]     ${RESP_LIST}

Create a New Beneficiary Request
    [Arguments]     ${PAYLOAD}
    ${GET_AUTH_TOKEN}=   Create Authorization Token
    Create Session   httpbin    ${URL}     verify=True
    ${HEADERS}              Create Dictionary     Authorization    Bearer ${GET_AUTH_TOKEN}    Content-Type    application/json
    ${resp}=    Post Request  httpbin  api/v1/beneficiaries/create     headers=${HEADERS}  data=${PAYLOAD}
    @{RESP_LIST}=        Create list    ${resp.status_code}    ${resp.json()}
    [Return]     ${RESP_LIST}

Update Bank Details In Json
    [Arguments]     ${BANK_DETAILS}
    ${JSON_FILE}=   Load JSON From File     ${EXECDIR}${/}config${/}payload.json
    ${JSON_VAL}=    Update Value To Json   ${JSON_FILE}   $..bank_details     ${BANK_DETAILS}
    [Return]        ${JSON_VAL}

Swift Code Should be Mandatory While Method Is Swift
    ${payload}=     load test data    payload_US
    ${RESP_MSG}=    Create a New Beneficiary Request      ${payload}   ${LOCAL}
    Assert response passed      ${RESP_MSG}

Assert response passed
    [Arguments]    ${res}
    should be equal as strings    ${res}[0]    ${201}

Assert Response Failed
    [Arguments]     ${ACTUAL_MSG}    ${EXPECT_MSG}
    Should be equal as Strings    ${ACTUAL_MSG}[0]              ${400}
    Should be equal as Strings    ${ACTUAL_MSG}[1][message]     ${EXPECT_MSG}

