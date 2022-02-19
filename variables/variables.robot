*** Variables ***
${JSON_PATH}                                    ./config/payload.json
${URL}                                          https://api-demo.airwallex.com
${SUCCESS_RESPONSE_CODE}                        201
${SWIFT}                                        SWIFT
${SWIF}                                         SWIF
${LOCAL}                                        LOCAL
${LOCA}                                         LOCA
${NULL}


${PASSED_MSG}                                   Bank details saved
${FAILED_PAYMENT_METHOD_NULL}                   must not be null
${FAILDE_BANK_COUNTRY_CODE_SWIFT_CODE_WRONG}    The SWIFT code / BIC should match the bank location selected
${PAYMENT_METHOD_IS_MANDATORY}                  payment_methods is not of the expected type; please refer to our API documentation
${FAILED_SWIFT_PAYMENT_METHOD_WRONG}            No enum constant com.airwallex.domain.transaction.payment.PaymentMethod.SWIF
${FAILED_LOCAL_PAYMENT_METHOD_WRONG}            No enum constant com.airwallex.domain.transaction.payment.PaymentMethod.LOCA
${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}         Should contain 2 to 200 characters
${FAILED_FIELD_IS_REQUIRED}                     This field is required
${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_US}       Should contain 1 to 17 characters
${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_AU}       Should contain 6 to 20 characters
${FAILED_LENGTH_ACCOUNT_NUM_NOT_VALID_CN}       Should contain 8 to 34 characters
${FAILED_SWIFT_CODE_NOT_VALID}                  payment_methods is not of the expected type; please refer to our API documentation
${FAILED_ABA_LENGTH_INVALID}                    Should be 9 characters long

${FAILED_SWIFT_CODE_REQUIRED}                   swift_code_required
${FAILED_SWIFT_CODE_NOT_VALID_AU}               swift_code_not_valid_AU
${FAILED_SWIFT_CODE_NOT_VALID_US}               swift_code_not_valid_US
${FAILED_SWIFT_CODE_NOT_VALID_CN}               swift_code_not_valid_CN
${FAILED_SWIFT_CODE_NOT_VALID}           payment_methods is not of the expected type; please refer to our API documentation

#${FAILED_LENGTH_ACCOUNT_NAME_NOT_VALID}         length_account_name_not_valid
${FAILED_ACCOUNT_NAME_REQUIRED}                 account_name_required
${FAILED_ACCOUNT_NUMBER_REQUIRED}               account_number_required
${FAILED_BANK_COUNTRY_CODE_REQUIRED}            bank_country_code_required
${FAILED_BSB_REQUIRED_AU}                       bsb_required_AU
${FAILED_LENGTH_BSB_NOT_VALID}                  length_bsb_not_valid
${FAILED_ABA_REQUIRED_US}                       aba_required_US
${FAILED_LENGTH_ABA_NOT_VALID}                  length_aba_not_valid
${FAILED_BANK_CODE_NULL}                        must not be null
${FAILED_BANK_COUNTRY_CODE_INVALID}             Should equal zengin_code