# -*- coding: utf-8 -*-
import json
import payload
import sys
import os
import inspect
import copy
import random
import string

#reload(sys)
#sys.setdefaultencoding('utf8')
cur_path = os.path.dirname(os.path.abspath(__file__))
errmsg = os.path.join(cur_path, '../config/error.json')


class FakeTestDataException(Exception):
    def __init__(self, item):
        print('Fake data error,field %s not exist in data template' % item)


def load_test_data(template_type, **kwargs):
    customed_kv = kwargs
    try:
        data = copy.deepcopy(payload.template[template_type])
    except KeyError:
        raise FakeTestDataException(template_type)
    for key in customed_kv.keys():
        if key in data.keys():
            data[key] = str(customed_kv[key])
        else:
            raise FakeTestDataException(key)
    acc_length = payload.length[template_type]["account_number"]
    digits =  get_right(acc_length["min"], acc_length["max"])
    data["account_number"] =  digits
    return data

def get_right(from_int, to_int):
    if from_int > to_int:
        logging.error("{} must largger or equal than {}".format(to_int, from_int))
        return "0"
    digits = random.randint(from_int, to_int)
    ret_string = ""
    for _ in range(digits):
        ret_string += random.choice(string.digits)
    return ret_string



def main():
    pass


if __name__ == '__main__':
    load_test_data('payload_US')
    print (is_strings_equal(u"1", 'payment_method_wrong'))