//제이쿼리 선언
$(function(){

    //버튼 클릭
    $("#dataOpen").click(function(){
        alert("게시글 데이터를 가져옵니다.")
        // html 서버 통신 X , 웹프로그래밍, ajax 방법
        // html 일부데이터만 화면 전환 없이 변경이 가능
        $.ajax({
            url:"js/board.json", // 서버로 전송하는 페이지 항상 뒤에 쉼표를 넣어야함
            type:"get", //get: url 외부로 유출되는 방식, post: 헤더에 숨겨서 보내는 방식 
            data:{"bno":1,"bhit":50}, //내가 서버로 전송하는 데이터
            dataType:"json", // html,xml,json,text
            success:function(data){//서버와 통신성공하면 data변수로 데이터를 전송
                //alert("성공");
                console.log(data);
                console.log("1번째",data[0]);
                console.log("1번째",data[0].bno);
                console.log("총개수: ",data.length);
                let hdata =``;

                for(let i=0;i<data.length;i++){
                hdata +=`<tr id="${data[i].bno}">`;
                hdata +=`<td>${data[i].bno}</td>`;
                hdata +=`<td>${data[i].title}</td>`;
                hdata +=`<td>${data[i].id}</td>`;
                hdata +=`<td>${data[i].bdate}</td>`;
                hdata +=`<td>${data[i].bhit}</td>`;
                hdata +=`<td>`;
                hdata +=`<button type="button" class="updateBtn">수정</button>`;
                hdata +=`<button type="button" class="deleteBtn">삭제</button>`;
                hdata +=`</td>`;
                hdata +=`</tr>`;                    
                }

                $("#tbody").html(hdata)



            
            },
            error:function(){
                alert("실패");
            }


            
        });//ajax


    });// dataOpen


    $("#dataOpen2").click(function(){
        alert("데이터를 가져옵니다.")
        $.ajax({
            url:"js/students.json",
            type:"get",
            data:{"sno":1},
            dataType:"json",
            success:function(data){
                console.log(data);
                console.log("총개수 : ",data.length);
                let hdata = ``;

                for(let i=0;i<data.length;i++){
                    hdata += `<tr id="${data[i].sno}">`;
                    hdata += `<td>${data[i].sno}</td>`;
                    hdata += `<td>${data[i].sname}</td>`;
                    hdata += `<td>${data[i].kor}</td>`;
                    hdata += `<td>${data[i].eng}</td>`;
                    hdata += `<td>${data[i].math}</td>`;
                    hdata += `<td>${data[i].kor+data[i].eng+data[i].math}</td>`;
                    hdata += `<td>${((data[i].kor+data[i].eng+data[i].math)/3).tofixed(2)}</td>`;
                    hdata += `<td>${data[i].sdata}</td>`;
                    hdata += `<td>`;
                    hdata += `<button type="button" class="updateBtn">수정</button>`;
                    hdata += `<button type="button" class="deleteBtn">삭제</button>`;
                    hdata += `</td>`;
                    hdata += `</tr>`;

                }
                $("#tbody").html(hdata)


            },
            error:function(){
                alert("실패")
            }





        });// ajax


    });//dataOpen2





})//jquery