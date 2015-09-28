var socket = io('http://localhost:8080');

socket.on("connect", function () {
    console.log("You have connected")
});

socket.on("message", function (message) {
    $('#messages').append(message);
    var $chatBox = $(".panel-body");
    $chatBox.animate({scrollTop: $chatBox[0].scrollHeight}, 1000);
});
