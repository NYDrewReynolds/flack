var socket = io();
var messageBody = document.getElementById('message-body');
var sendButton = document.getElementById('message-send-button');

socket.on("connect", function() {
  console.log("You have connected")
});

socket.on("message", function(message) {
  messageBody.innerText = message
});

sendButton.addEventListener('click', function() {
  var message = document.getElementById('message').val();
  socket.send("rock", message);
});
