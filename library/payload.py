# -*- coding:utf-8 -*-

payload_country_US = {
    "account_currency": "USD",
    "account_name": "Karthick Bakaran",
    "account_number": "2313232",
    "account_routing_type1": "aba",
    "bank_country_code": "US",
    "bank_name": "Axis Bank",
    "swift_code": "CHASUS33"
}
payload_country_AU = {
    "account_currency": "AUD",
    "account_name": "John Vijay",
    "account_number": "500090021",
    "account_routing_type1": "bsb",
    "bank_country_code": "AU",
    "bank_name": "ABC Bank",
    "swift_code": "CITIAUSX"
}
payload_country_CN = {
    "account_currency": "CNY",
    "account_name": "Mani Sankar",
    "account_number": "5000000021",
    "account_routing_type1": "aba",
    "bank_country_code": "CN",
    "bank_name": "JCB Bank",
    "swift_code": "ABOCCNBJ"
}

length = {
   "payload_US": {"account_number":{"min":1,"max":17}},
   "payload_AU": {"account_number":{"min":6,"max":9}},
   "payload_CN": {"account_number":{"min":8,"max":20}},
   "acc_name": {"min":2,"max":10},
   "swift_code":{"min":8,"max":11},
   "swift_country_code":{"min":5,"max":6},
   "bsb":{"min":0,"max":6},
   "aba":{"min":0,"max":9}
}

template = {
    'payload_US': payload_country_US,
    'payload_AU': payload_country_AU,
    'payload_CN': payload_country_CN,
}