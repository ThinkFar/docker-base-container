#!/bin/sh
apt-get update && apt-get install -y sudo wget curl git vim nano zip unzip tar gzip make python
curl -sL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt install yarn
if [ ! -f /usr/src/app/docker-index-placeholder.js ]; then 
  printf 'const http = require("http"); const hostname = "0.0.0.0"; const port = 65321; const server = http.createServer((req, res) => { res.statusCode = 404; res.setHeader("Content-Type", "text/html"); res.end("<!DOCTYPE html><html><head><style>body { background-color: black; color: white; }</style></head><body><h1>404 Not Found</h1></body></html>"); }); server.listen(port, hostname, () => { console.log("Server running at http://"+hostname+":"+port+"/"); });' > /usr/src/app/docker-index-placeholder.js; 
fi 
if command -v node >/dev/null; then
  node /usr/src/app/docker-index-placeholder.js
else
  echo "Error: Node.js is not installed or 'node' command is not available."
fi
