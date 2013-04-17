players = []

process.on "message", (message, data)->
  switch message
    when "socket" 
      return if players.length is 4
      players.push data
      if players.length is 4
        startGame()
        0
    else
        
startGame = ->
  for player in players
    player.emit 'gameServer', "start"
  0

