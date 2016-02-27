spawn = require('child_process').spawn

module.exports = (socket) ->
  console.log 'connwcted!'
  socket.emit 'news', hello: 'world'

  socket.on 'sync',  (data) ->
    ls = spawn('ls', ['-lh', '/usr'])

    ls.stdout.on 'data', (data) ->
      socket.emit 'answer', data.toString()
      console.log "stdout: #{data}"

    ls.stderr.on 'data', (data) ->
      console.log "stderr: #{data}"

    ls.on 'close', (code) ->
      socket.emit 'sync-answer-done', data
      console.log "child process exited with code #{code}"

    # console.log data
  socket.on 'move-done-torrents',  (data) ->
    ls = spawn 'move-done-torrents.sh'

    ls.stdout.on 'data', (data) ->
      socket.emit 'answer', data.toString()
      console.log "stdout: #{data}"

    ls.stderr.on 'data', (data) ->
      console.log "stderr: #{data}"

    ls.on 'close', (code) ->
      socket.emit 'sync-answer-done', data
      console.log "child process exited with code #{code}"

    # console.log data
