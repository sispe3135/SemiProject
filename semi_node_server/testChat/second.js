// 모듈을 추출한다. - http://localhost:52273
const app = require('express')(); 
var http = require("http");
var fs = require("fs");
var socketio = require("socket.io");

var host = "192.168.110.225";
//http://192.168.0.17:8086/?roomSeq=0&userId=kh
// 웹 서버를 생성한다.

var server = http.createServer(function(request, response) {

    // HTMLPage.html 파일을 읽는다.
	
    fs.readFile("second.jsp", function(error, data) {

        response.writeHead(200, {"Content-Type" : "text/html"});
        response.end(data);
    });
}).listen(8086, host , function() {

    console.log("Server Running at http://192.168.110.225:8086/");
});

// 소켓 서버를 만든다.
var io = socketio.listen(server);


// 접속한 사용자의 방이름, 사용자명, socket.id값을 저장할 전역변수
const loginIds = new Array();

io.sockets.on("connection", function(socket) {

    // 채팅방 입시 실행
    socket.on("access", function(data) {

        // console.log(io.sockets.adapter.rooms);

        socket.leave(socket.id);
        socket.join(data.room);

        loginIds.push({
              socket : socket.id  // 생성된 socket.id
            , room : data.room  // 접속한 채팅방의 이름
            , user : data.name   // 접속자의 유저의 이름
        });

        // 사용자가 페이지 새로고침시 loginIds 변수에 값이 누적되지 않게 동일한 사용자의 socket.id 값을 삭제한다.
        for(var num in loginIds) {

            // 사용자 이름이 같으면서, 기존소켓아이디와 현재 소켓아이디가 다른 값이 있는지 찾아낸다.
            if(loginIds[num]['user'] == data.name && loginIds[num]['socket'] != socket.id) {
               
                // loginIds의 해당 순서의 값을 삭제한다.
                loginIds.splice(num, 1);
            }
        }

        // 클라이언트의 Contact 이벤트를 실행하여 입장한 사용자의 정보를 출력한다.
        io.sockets.in(data.room).emit("contact", {
              count : io.sockets.adapter.rooms[data.room].length
            , name : data.name
            , message : data.name + "님이 채팅방에 들어왔습니다."
        });
    });

    // 채팅방 퇴장시 실행(Node.js에서 사용자의 Disconnect 이벤트는 사용자가 방을 나감과 동시에 이루어진다.)
    socket.on("disconnect", function() {

        var room = "";
        var name = "";
        var socket = "";
        var count = 0;
       
        // disconnect 이벤트중 socket.io의 정보를 꺼내는데는 에러가 발생하고,
        // 실행중인 node.js Application이 종료된다.
        // 이에따라 try ~ catch ~ finally 로 예외처리해준다.
        try {
           
            // 생성된 방의 수만큼 반복문을 돌린다.
            for(var key in io.sockets.adapter.rooms) {

                // loginIds 배열의 값만큼 반복문을 돌린다.
                var members = loginIds.filter(function(chat) {
                    return chat.room === key;
                });
   
                // 현재 소켓 방의 length와 members 배열의 갯수가 일치하지 않는경우
                if(io.sockets.adapter.rooms[key].length != members.length) {
               
                    // 반복문으로 loginIds에 해당 socket.id값의 존재 여부를 확인한다.
                    for(var num in loginIds) {

                        // 일치하는 socket.id의 정보가 없을경우 그 사용자가 방에서 퇴장한것을 알 수 있다.
                        if(io.sockets.adapter.rooms[key].sockets.hasOwnProperty(loginIds[num]['socket']) == false) {

                            // 퇴장한 사용자의 정보를 변수에 담는다.
                            room = key;
                            name = loginIds[num]['user'];

                            // loginIds 배열에서 퇴장한 사용자의 정보를 삭제한다.
                            loginIds.splice(num, 1);
                        }
                    }
                   
                    // 해당 방의 인원수를 다시 구한다.
                    count = io.sockets.adapter.rooms[key].length;
                }
            }

        } catch(exception) {

            console.log(exception);

        } finally {

            // 클라이언트의 Contact 이벤트를 실행하여 이탈한 사용자가 누군지 알린다.
            io.sockets.in(room).emit("contact", {
                  count : count
                , name : name
                , message : name + "님이 채팅방에서 나갔습니다."
            });
        }
      });

    // 메세지 전송 이벤트
    socket.on("message", function(data) {

        // 클라이언트의 Message 이벤트를 발생시킨다.
        io.sockets.in(data.room).emit("message", data);
    });
});