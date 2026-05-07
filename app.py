from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

PORT = int(os.environ.get("PORT", 8000))

APP_PATH = os.path.join(os.getcwd(), "app")

os.chdir(APP_PATH)

print(f"Serving files from: {APP_PATH}")
print(f"Server running on port: {PORT}")

server = HTTPServer(("0.0.0.0", PORT), SimpleHTTPRequestHandler)

server.serve_forever()