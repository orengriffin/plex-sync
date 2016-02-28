spawn = require('child_process').spawn

module.exports = (socket) ->
  console.log 'connwcted!'
  socket.emit 'news', hello: 'world'

  socket.on 'sync',  (data) ->
    sync = spawn('acd_cli', ['sync'])

    sync.stdout.on 'data', (data) ->
      socket.emit 'answer', data.toString()
      console.log "stdout: #{data}"

    sync.stderr.on 'data', (error) ->
      socket.emit 'error', error
      console.log "stderr: #{data}"

    sync.on 'close', (code) ->
      socket.emit 'done', 'done'
      console.log "child process exited with code #{code}"

    # console.log data
  socket.on 'move-done-torrents',  (data) ->
    move = spawn './move-done-torrents.sh'

    move.stdout.on 'data', (data) ->
      socket.emit 'answer', data.toString()
      console.log "stdout: #{data}"

    move.stderr.on 'data', (error) ->
      socket.emit 'error', error
      console.log "stderr: #{data}"

    move.on 'close', (code) ->
      socket.emit 'done', 'done'
      console.log "child process exited with code #{code}"

    # console.log data
