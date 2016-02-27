// Generated by CoffeeScript 1.9.3
(function() {
  $(function() {
    var dataArray, socket, ul;
    dataArray = [];
    socket = io.connect('http://localhost:3000');
    ul = $('ul');
    $('#sync').click(function(e) {
      socket.emit('sync', {
        data: 'syncing'
      });
      return socket.on('answer', function(data) {
        return ul.append("<li><pre>" + (data.toString()) + "</pre></li>");
      });
    });
    return $('#move').click(function(e) {
      return socket.emit('move-done-torrents', {
        data: 'syncing'
      });
    });
  });

}).call(this);

//# sourceMappingURL=app.js.map
