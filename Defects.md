# Defects

**Defect # 1:**
    
    Requirement: For US, account number is 1-17 character long, can be any character
    
    Expected Error:  (When out of required length): Error Messgae Length of account_number should be Only between 1 - 17 when bank country code is US
    
    Actual Error: It Not throwing any error
   
**Defect # 2:**
    
    when bank country= US but account_routing_type1, we are supposed to get 400 error, but got 200 succeed code.
    
**Defect # 3：**
    
    requirement: for CN, account number is 8-20 character long, can be any character
    Actual error (when out of required length>20): Should contain 8 to 34 characters
    

    
    
    
