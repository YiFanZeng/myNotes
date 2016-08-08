#!/usr/bin/python

import asyncio

@asyncio.coroutine
def hello():
    print('hello world!')
    r = yield from asyncio.sleep(1)
    print('hello again!')

loop = asyncio.get_event_loop()
loop.run_util_complete(hello())
loop.close()
