var http = require('http')
var PORT = 8000

var server = http.createServer(function (req, res) {
  res.writeHead(200, {
    'Content-Type': 'text/html'
  })
  res.end('Hello')
})

server.listen(PORT, function (err) {
  console.log('Server Running at http://localhost:' + PORT)
})
