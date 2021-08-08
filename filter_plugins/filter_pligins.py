from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from functools import partial
import types

from ansible import errors


def get_mongo_src(arg, os_name, os_version, mongodb_version):
    import re

    os_name = os_name.lower()
    if os_name == "centos":
        os_name = "rhel"

    if os_name == "redhat":
        os_name = "rhel"

    if os_name == "linuxmint":
        os_name = "ubuntu"        

    for item in arg:
        if re.match('.*' + os_name + os_version + '.*', item, re.M|re.I) and re.match('.*' + mongodb_version + '.*', item, re.M|re.I):
            return item

    return "nothing found"


class FilterModule(object):
    def filters(self):
        return {
            'get_mongo_src': get_mongo_src
        }
