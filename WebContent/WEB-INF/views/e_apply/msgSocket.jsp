<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
var ws = new WebSocket("ws://localhost:8080/Pickme/msgEcho.do?bno=1234");

// 연결됐을때 
ws.onopen = function(){
	console.log('info: connecton opened.');
	setTimeout(function(){connect();}, 1000); // retry connection!

	// 연결 후 메시지 도착시
	ws.onmessage = function(event){
		console.log(event.data + '\n');
			
	};
};



ws.onclose = function (event) {console.log('Info: connection closed.'); };
ws.onerror = function (event) {console.log('Error: error.');};

$('#btnSend').on('click', function(evt){
	evt.preventDefault();
	if(socket.readyState !== 1) return;
	let msg = $('input#msg').val();
	ws.send(msg);


	
});

</script>

</body>
</html>