#!/bin/sh
apt-get update && apt-get install -y git yarn curl wget vim nano zip unzip tar gzip make python 
if [ ! -f /usr/src/app/docker-index-placeholder.js ]; then 
  printf 'const http = require("http"); const hostname = "0.0.0.0"; const port = 65321; const server = http.createServer((req, res) => { res.statusCode = 404; res.setHeader("Content-Type", "text/html"); res.end("<!DOCTYPE html><html><head><style>body { background-color: black; color: white; }</style></head><body><h1>404 Not Found</h1></body></html>"); }); server.listen(port, hostname, () => { console.log("Server running at http://"+hostname+":"+port+"/"); });' > /usr/src/app/docker-index-placeholder.js; 
fi 
node /usr/src/app/docker-index-placeholder.js
