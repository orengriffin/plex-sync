$ ->
  dataArray = []
  socket = io.connect 'http://localhost:3000'

  li = (txt) -> "<li>#{txt}</li>"
  liPre = (txt) -> li "<pre>#{txt}</pre>"

  ul = $('.content ul')
  errorUl = $(".errors ul")
  status = $('#status')
  input = $('input')
  $('#connect').click (e) ->
    if (ip = input.val()).match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
      socket = io.connect ip
    else
      errorUl.append li('not an ip')

  $('#sync').click (e) ->
    status.show()
    socket.emit 'sync', data: 'syncing'
    socket.on 'answer', (answer) ->
      ul.append liPre(answer)

  $('#move').click (e) ->
    status.show()
    socket.emit 'move-done-torrents', data: 'syncing'

  $('#clear').click (e) -> $('ul').empty()

  socket.on 'done', -> status.hide()
  socket.on 'error', (error) -> errorUl.append li(error)
