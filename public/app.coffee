$ ->
  # dataArray = []
  socket = io.connect document.URL#'http://localhost:3000'

  li = (txt) -> "<li>#{txt}</li>"
  liPre = (txt) -> li "<pre>#{txt}</pre>"
  init = ->
    socket.on 'done', -> status.hide()
    socket.on 'error', (error) -> errorUl.append li(error)
    socket.on 'answer', (answer) ->
      ul.append liPre(answer)

  ul = $('.content ul')
  errorUl = $(".errors ul")
  status = $('#status')
  input = $('input')

  init()

  $('#connect').click ->
    if (ip = input.val()).match /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
      socket = io.connect "http://#{ip}:3000"
      init()
    else
      errorUl.append li('not an ip')

  $('#sync').click ->
    status.show()
    socket.emit 'sync', data: 'syncing'

  $('#move').click ->
    status.show()
    socket.emit 'move-done-torrents', data: 'syncing'

  $('#clear').click (e) ->
    $('ul').empty()
    status.hide()
