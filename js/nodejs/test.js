var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});

  // change response here without restarting node.js
  res.write("Hello :)");

  res.end();
}).listen(8080);