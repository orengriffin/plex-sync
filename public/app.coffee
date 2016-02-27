$ ->
  dataArray = []
  socket = io.connect 'http://localhost:3000'
  # socket.on('news', function (data) {
  #   console.log(data);
  #   socket.emit('my other event', { my: 'data' });
  ul = $('ul')
  $('#sync').click (e) ->
    socket.emit 'sync', data: 'syncing'
    socket.on 'answer', (data) ->
      ul.append "<li><pre>#{data.toString()}</pre></li>"
  $('#move').click (e) ->
    socket.emit 'move-done-torrents', data: 'syncing'
