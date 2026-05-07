from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

os.chdir("app")

server = HTTPServer(("0.0.0.0", 8000), SimpleHTTPRequestHandler)

print("Server running on port 8000")

server.serve_forever()