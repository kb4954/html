//jquery선언
$(function(){
    $("#dataOpen3").click(function(){
        //alert("확인");
        $.ajax({
            url:"https://apis.data.go.kr/B551011/PhotoGalleryService1/galleryList1?serviceKey=kt%2BGYuzNFqdo%2FgA0x5HWITckdSQgYgOPHUzOLu7jbdN65kzxUQwBKTyrsis5Q%2B7xXRE84a5hsgWeU5Tksw9erw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&_type=json",
            type:"get",
            data:{}, // 내가보내는거
            dataType:"json",
            success:function(data){
                alert("성공");
                let array = 
                console.log(data.response.body.items.item);
                console.log(data.response.body.items.item[0].galWebImageUrl);
                let imgData = data.response.body.items.item[0].galWebImageUrl
                let hdata = <img id="img" src="${imgData}"></img>;
                $("#txt").html(hdata)
                    
                for(i=0;i<data.length; i++){
                    let hdata = ``
                    hdata +=`<tr id="no">`
                    hdata +=`<td>${data.response.body.items.item[i].galContentId}</td>`
                    hdata +=`<td>${data.response.body.items.item[i].galCreatedtime}</td>`
                    hdata +=`<td>${data.response.body.items.item[i].galPhotographer}r</td>`
                    hdata +=`<td>${data.response.body.items.item[i].galPhotographer}</td>`
                    hdata +=`<td>통영 중앙전통시장, 경상남도 통영시, 상설시장</td>`
                    hdata +=`<td>통영 중앙전통시장</td>`
                    hdata +=`<td>http://tong.visitkorea.or.kr/cms2/website/14/3479214.jpg</td>`
                    hdata +=`<td>`
                    hdata +=`<button type="button" class="updateBtn">수정</button>`
                    hdata +=`<button type="button" class="deleteBtn">삭제</button>`
                    hdata +=`</td>`
                    hdata +=`</tr>`
    
                    $("#tbody").html(hdata)
                


            },
            error:function(){
                alert("실패")
            }
        });



    });//dataOpen3


});// jquery 선언