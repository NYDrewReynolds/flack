var socket = io('http://localhost:8080');
var sendButton = document.getElementById('message-send-button');

socket.on("connect", function() {
  console.log("You have connected")
});

socket.on("message", function(message) {
  appendMessage(message);
});

sendButton.addEventListener('click', function() {
  var message = document.getElementById('message').val();
  //socket.send("rock", message);
});
