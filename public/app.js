// Generated by CoffeeScript 1.9.3
(function() {
  $(function() {
    var errorUl, init, input, li, liPre, socket, status, ul;
    socket = io.connect(document.URL);
    li = function(txt) {
      return "<li>" + txt + "</li>";
    };
    liPre = function(txt) {
      return li("<pre>" + txt + "</pre>");
    };
    init = function() {
      socket.on('done', function() {
        return status.hide();
      });
      return socket.on('error', function(error) {
        return errorUl.append(li(error));
      });
    };
    ul = $('.content ul');
    errorUl = $(".errors ul");
    status = $('#status');
    input = $('input');
    init();
    $('#connect').click(function() {
      var ip;
      if ((ip = input.val()).match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/)) {
        socket = io.connect("http://" + ip + ":3000");
        return init();
      } else {
        return errorUl.append(li('not an ip'));
      }
    });
    $('#sync').click(function() {
      status.show();
      socket.emit('sync', {
        data: 'syncing'
      });
      return socket.on('answer', function(answer) {
        return ul.append(liPre(answer));
      });
    });
    $('#move').click(function() {
      status.show();
      return socket.emit('move-done-torrents', {
        data: 'syncing'
      });
    });
    return $('#clear').click(function(e) {
      $('ul').empty();
      return status.hide();
    });
  });

}).call(this);

//# sourceMappingURL=app.js.map
