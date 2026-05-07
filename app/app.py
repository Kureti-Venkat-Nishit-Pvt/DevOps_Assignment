from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

PORT = int(os.environ.get("PORT", 8000))

os.chdir("app")

server = HTTPServer(("0.0.0.0", PORT), SimpleHTTPRequestHandler)

print(f"Server running on port {PORT}")

server.serve_forever()