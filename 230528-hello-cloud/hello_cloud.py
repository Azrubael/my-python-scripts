#!/usr/bin/env python3

"""A simple Hello World type app which can serve on port 8000.
Optionally, a different port can be passed.

The code was inspired by:
https://gist.github.com/davidbgk/b10113c3779b8388e96e6d0c44e03a74
"""
import http
import http.server
import socket
import socketserver
import sys

# TCP port for listening to connections, if no port is received
DEFAULT_PORT=8000

class Handler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(http.HTTPStatus.OK)
        self.end_headers()
        # Hello message
        self.wfile.write(b'Hello Cloud')
        # Now get the hostname and IP and print that as well.
        hostname = socket.gethostname()
        host_ip = socket.gethostbyname(hostname)
        self.wfile.write(
            '\n\nHostname: {} \nIP Address: {}'.format(
                hostname, host_ip).encode())


def main(argv):
    port = DEFAULT_PORT
    if len(argv) > 1:
        port = int(argv[1])

    web_server = socketserver.TCPServer(('', port), Handler)
    print("Listening for connections on port {}".format(port))
    web_server.serve_forever()


if __name__ == "__main__":
    main(sys.argv)
