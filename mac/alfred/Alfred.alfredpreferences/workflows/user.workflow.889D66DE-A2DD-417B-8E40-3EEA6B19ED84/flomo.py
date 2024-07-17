# -*- coding: utf-8 -*-
# @Author: zrc199021@163.com
# @Date:   2020-12-12 00:26:09
import sys
import requests

from workflow import Workflow

url = "https://flomoapp.com/iwh/MTY3NjYwNQ/b588c24d70fde4825bd430bce7119168/"

def record(content):
    req  = requests.post(url, data={'content': content})
    return req.text

def main(wf):
    note = wf.args[0]
    try: 
        msg = record(note)
        if msg:
            return
    except Exception as e:
        msg = str(e)

if __name__ == "__main__":
    wf = Workflow()
    log = wf.logger
    sys.exit(wf.run(main))


