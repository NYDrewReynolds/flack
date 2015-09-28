var socket = io('http://localhost:8080');

socket.on("connect", function() {
  console.log("You have connected")
});

socket.on("message", function(message) {
  console.log($('messages'));
  $('#messages').append(message);
});
