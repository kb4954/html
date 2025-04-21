function chBtn(){
    alert("색상을 빨간색으로 변경합니다.");
    // id 찾는 방법
    // let color1 = document.getElementById("color1");
    
    // class 찾는 방법
    
    /*let color2 = document.getElementsByClassName("color2");
    console.log(color2);
    console.log(color2[0]);
    color2[0].style.color = "red";
    color2[0].innerText = "회원수정";*/
    // querySelector = id : 1개만 찾음, class : 1개만 검색 둘다 찾기 가능
    /*let color3 = document.querySelector("#color3");
    console.log(color3);
    console.log(color3[0]);
    color3.style.color = "red";
    color3.innerText = "회원수정";*/
    
    // querySelectorAll() = class 여러개 찾아줌:  배열로 검색해야됨
    let color4 = document.querySelector(".color4"); // 요즘은 무조건 이걸 씀
    console.log(color4);
    console.log(color4[0]);
    color4.style.color = "red";
    color4.innerText = "회원수정";

    let color5 = document.querySelectorAll(".color4");
    console.log(color5);
}