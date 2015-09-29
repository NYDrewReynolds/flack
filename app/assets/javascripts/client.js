$(document).ready(function() {

  var socket = io('http://localhost:8080');

  socket.on("connect", function() {
    console.log("You have connected");
    socket.emit("subscribe", $('#message').data().roomName);
  });

  socket.on("message", function(message) {
    console.log(message);
    $('#messages').append(message);
    var $chatBox = $(".panel-body");
    $chatBox.animate({scrollTop: $chatBox[0].scrollHeight}, 1000);
  });
});
