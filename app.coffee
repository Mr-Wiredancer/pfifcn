###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
fork = require("child_process").fork
app = express()
server = http.createServer(app)
io = require("socket.io").listen(server)

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))
app.enable "trust proxy"

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/users", user.list
server.listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  0

joinedSockets = []

io.sockets.on "connection", (socket) ->
  socket.send "hello from the game server"
  joinedSockets.push socket
  socket.on "debug", (data)->
    socket.emit "debug", data
    0
  createGame() if joinedSockets.length is 4
  0
  
createGame = ->
  for player in joinedSockets
    player.send "game starts!"
  joinedSockets = []
  0
