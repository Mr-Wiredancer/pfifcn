player = io.connect(document.domain)

player.on("connect", ->
  player.on("message", (data) -> console.log "message: "+data )
  player.on("updatePlayers", handleUpdatePlayers )
)

handleUpdatePlayers = (players) ->
  console.log "updatePlayers:" + players


