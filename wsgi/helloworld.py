# /usr/bin/python

def pplication(environ, start_response):
    start_response('200 OK', [('Content-Type','text/html')])
    body = '<h1>Hello, %s!</h1>' % (environ['PATH_INFO'][1:] or 'web')
    # return ["Hello World"]
    return [body.encode('utf-8')]
