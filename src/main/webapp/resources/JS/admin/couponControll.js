// Guest 페이지네이션
const previous2 = document.getElementById("previous2");
const next2 = document.getElementById("next2");
const present2 = document.querySelectorAll(".page-link");
const tbody2 = document.getElementById("tbody2");
console.log(tbody2);

next2.addEventListener("click",function(){
    let page = next2.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./guestlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody2.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let tr2 = document.createElement("tr2");
                let userId = list[i].userId
                
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].userId);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].userName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteMember");
                td.setAttribute("data-userId", list[i].userId);
                text = document.createTextNode("추방");
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                let button = document.createElement("button");
                button.setAttribute("class","memberSharing");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getSharingList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("같이해요 작성한글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberQna");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getQnaList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("QnA작성한 글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getItemList('1',list[i].userId));
                text = document.createTextNode("구매목록");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getDetail(list[i].userId));
                text = document.createTextNode("회원 상세 프로필");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                tbody2.appendChild(tr2);
            }


        }
    }
})

try {
    for(let i=0; present2.length; i++){
        present2[i].addEventListener("click",function(){
            console.log("asdf");
            let page = present2[i].getAttribute("data-page");
            console.log(page);
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./guestlist");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("page="+page);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());
                    
                    let list = result.list;
        
                    console.log(list);
                    console.log(tbody2);

                    tbody2.innerHTML = "";
                    console.log(tbody2);
        
                    for(let i=0; i<list.length; i++){
                        let tr2 = document.createElement("tr");
                        let userId = list[i].userId
                        
                        let td = document.createElement("td");
                        let text =document.createTextNode(list[i].userId);
                        td.appendChild(text);
                        tr2.appendChild(td);
                        
                        td = document.createElement("td");
                        text = document.createTextNode(list[i].userName);
                        td.appendChild(text);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        td.setAttribute("class","deleteMember");
                        td.setAttribute("data-userId", list[i].userId);
                        text = document.createTextNode("추방");
                        td.appendChild(text);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        let button = document.createElement("button");
                        button.setAttribute("class","memberSharing");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", "getSharingList('1',"+'"'+userId+'"'+")");
                        text = document.createTextNode("같이해요 작성한글");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        button = document.createElement("button");
                        button.setAttribute("class","memberQna");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", "getQnaList('1',"+'"'+userId+'"'+")");
                        text = document.createTextNode("QnA작성한 글");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        button = document.createElement("button");
                        button.setAttribute("class","memberItem");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", getItemList('1',list[i].userId));
                        text = document.createTextNode("구매목록");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        button = document.createElement("button");
                        button.setAttribute("class","memberItem");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", getDetail(list[i].userId));
                        text = document.createTextNode("회원 상세 프로필");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);
                        
                        tbody2.appendChild(tr2);
                    }
        
        
                }
            }
        })
        }
} catch (error) {
    
}


previous2.addEventListener("click",function(){
    let page = previous2.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./guestlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody2.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let userId = list[i].userId
                let tr2 = document.createElement("tr");
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].userId);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].userName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteMember");
                td.setAttribute("data-userId", list[i].userId);
                text = document.createTextNode("추방");
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                let button = document.createElement("button");
                button.setAttribute("class","memberSharing");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getSharingList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("같이해요 작성한글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberQna");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getQnaList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("QnA작성한 글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getItemList('1',list[i].userId));
                text = document.createTextNode("구매목록");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getDetail(list[i].userId));
                text = document.createTextNode("회원 상세 프로필");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                tbody2.appendChild(tr2);

            }


        }
    }
})

//----------------------------------------------------------------------

// 쿠폰 페이지네이션
const previous1 = document.getElementById("previous2");
const next1 = document.getElementById("next2");
const present1 = document.getElementsByClassName("page-link 2");
const tbody3 = document.getElementById("tbody3");


next1.addEventListener("click",function(){
    let page = next1.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./couponlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody3.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let tr2 = document.createElement("tr2");
                
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].couponNum);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].couponName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].expDate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].regDate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].discountRate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].discountPrice);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteCoupon");
                td.setAttribute("data-couponNum", list[i].couponNum);
                td.setAttribute("onclick", "deleteCoupon()");
                text = document.createTextNode("삭제");
                td.appendChild(text);
                tr2.appendChild(td);


                tbody3.appendChild(tr2);
            }


        }
    }
})

try {
    for(let i=0; present1.length; i++){
        present2[i].addEventListener("click",function(){
            console.log("asdf");
            let page = present1[i].getAttribute("data-page");
            console.log(page);
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./guestlist");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("page="+page);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());
                    
                    let list = result.list;
        
                    console.log(list);
                    console.log(tbody3);

                    tbody3.innerHTML = "";
                    console.log(tbody3);
        
                    for(let i=0; i<list.length; i++){
                        let tr2 = document.createElement("tr2");
                
                        let td = document.createElement("td");
                        let text =document.createTextNode(list[i].couponNum);
                        td.appendChild(text);
                        tr2.appendChild(td);
                        
                        td = document.createElement("td");
                        text = document.createTextNode(list[i].couponName);
                        td.appendChild(text);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        text = document.createTextNode(list[i].expDate);
                        td.appendChild(text);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        text = document.createTextNode(list[i].regDate);
                        td.appendChild(text);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        text = document.createTextNode(list[i].discountRate);
                        td.appendChild(text);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        text = document.createTextNode(list[i].discountPrice);
                        td.appendChild(text);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        td.setAttribute("class","deleteCoupon");
                        td.setAttribute("data-couponNum", list[i].couponNum);
                        td.setAttribute("onclick", "deleteCoupon()");
                        text = document.createTextNode("삭제");
                        td.appendChild(text);
                        tr2.appendChild(td);


                        tbody3.appendChild(tr2);
                    }
        
        
                }
            }
        })
        }
} catch (error) {
    
}


previous1.addEventListener("click",function(){
    let page = previous1.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./guestlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody3.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let tr2 = document.createElement("tr2");
                
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].couponNum);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].couponName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].expDate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].regDate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].discountRate);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                text = document.createTextNode(list[i].discountPrice);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteCoupon");
                td.setAttribute("data-couponNum", list[i].couponNum);
                td.setAttribute("onclick", "deleteCoupon()");
                text = document.createTextNode("삭제");
                td.appendChild(text);
                tr2.appendChild(td);


                tbody3.appendChild(tr2);

            }


        }
    }
})

//사업자 페이지 네이션

const previous3 = document.getElementById("previous3");
const next3 = document.getElementById("next3");
const present3 = document.getElementsByClassName("page-link 3");
const tbody4 = document.getElementById("tbody4");
console.log(tbody4);

next2.addEventListener("click",function(){
    let page = next3.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./bizlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody4.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let tr2 = document.createElement("tr2");
                let userId = list[i].userId
                
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].userId);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].userName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteMember");
                td.setAttribute("data-userId", list[i].userId);
                text = document.createTextNode("추방");
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                let button = document.createElement("button");
                button.setAttribute("class","memberEvent");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getEventList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("이벤트 작성한 글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberQna");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getBizQnaList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("QnA작성한 글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getSellItem(list[i].userId));
                text = document.createTextNode("판매상품목록");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                tbody4.appendChild(tr2);
            }


        }
    }
})

try {
    for(let i=0; present3.length; i++){
        present3[i].addEventListener("click",function(){
            console.log("asdf");
            let page = present3[i].getAttribute("data-page");
            console.log(page);
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./bizlist");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("page="+page);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());
                    
                    let list = result.list;
        
                    console.log(list);
                    console.log(tbody4);

                    tbody2.innerHTML = "";
                    console.log(tbody4);
        
                    for(let i=0; i<list.length; i++){
                        let tr2 = document.createElement("tr");
                        let userId = list[i].userId
                        
                        let td = document.createElement("td");
                        let text =document.createTextNode(list[i].userId);
                        td.appendChild(text);
                        tr2.appendChild(td);
                        
                        td = document.createElement("td");
                        text = document.createTextNode(list[i].userName);
                        td.appendChild(text);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        td.setAttribute("class","deleteMember");
                        td.setAttribute("data-userId", list[i].userId);
                        text = document.createTextNode("추방");
                        td.appendChild(text);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        let button = document.createElement("button");
                        button.setAttribute("class","memberEvent");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", "getEventList('1',"+'"'+userId+'"'+")");
                        text = document.createTextNode("같이해요 작성한글");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);
        
                        td = document.createElement("td");
                        button = document.createElement("button");
                        button.setAttribute("class","memberQna");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", "getBizQnaList('1',"+'"'+userId+'"'+")");
                        text = document.createTextNode("QnA작성한 글");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);

                        td = document.createElement("td");
                        button = document.createElement("button");
                        button.setAttribute("class","memberItem");
                        button.setAttribute("data-userId", list[i].userId);
                        button.setAttribute("onclick", getSellItem(list[i].userId));
                        text = document.createTextNode("판매상품목록");
                        button.appendChild(text);
                        td.appendChild(button);
                        tr2.appendChild(td);
                        
                        tbody4.appendChild(tr2);
                    }
        
        
                }
            }
        })
        }
} catch (error) {
    
}


previous3.addEventListener("click",function(){
    let page = previous3.getAttribute("data-page");
    
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./bizlist");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("page="+page);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            
            let list = result.list;

            console.log(list);

            tbody4.innerHTML = "";

            for(let i=0; i<list.length; i++){
                let userId = list[i].userId
                let tr2 = document.createElement("tr");
                let td = document.createElement("td");
                let text =document.createTextNode(list[i].userId);
                td.appendChild(text);
                tr2.appendChild(td);
                
                td = document.createElement("td");
                text = document.createTextNode(list[i].userName);
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                td.setAttribute("class","deleteMember");
                td.setAttribute("data-userId", list[i].userId);
                text = document.createTextNode("추방");
                td.appendChild(text);
                tr2.appendChild(td);

                td = document.createElement("td");
                let button = document.createElement("button");
                button.setAttribute("class","memberEvent");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getEventList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("같이해요 작성한글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberQna");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", "getBizQnaList('1',"+'"'+userId+'"'+")");
                text = document.createTextNode("QnA작성한 글");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                td = document.createElement("td");
                button = document.createElement("button");
                button.setAttribute("class","memberItem");
                button.setAttribute("data-userId", list[i].userId);
                button.setAttribute("onclick", getSellItem(list[i].userId));
                text = document.createTextNode("판매상품목록");
                button.appendChild(text);
                td.appendChild(button);
                tr2.appendChild(td);

                tbody4.appendChild(tr2);

            }


        }
    }
})




//------------------------ 사업자 페이징 끝


// ------ 쿠폰 페이징 끝
//----------------------------------------------------------------------

function deleteCoupon(){
    const deleteCoupon = document.getElementsByClassName("deleteCoupon");
    for(let i = 0; i<deleteCoupon.length; i++){
        
            let couponNum = deleteCoupon[i].getAttribute("data-couponNum");
            console.log(couponNum);

            let check = window.confirm("삭제하시겠습니까?");

            if(!check){
                return;
            }

            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./deletecoupon");
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("couponNum="+couponNum);
            xhttp.onreadystatechange = function(){
                if(xhttp.readyState == 4 && xhttp.status==200){
                    let result = xhttp.responseText.trim();
                    if(result == 1){
                        alert("삭제 성공");
                        location.reload();
                        return;
                    }else{
                        alert("삭제 실패");
                    }
                }
            }
            return;

        
    }
}

function deleteMember(){
    const deleteMember = document.getElementsByClassName("deleteMember");
    for(let i = 0; i<deleteMember.length; i++){
    
        let userId = deleteMember[i].getAttribute("data-userId");

        let check = window.confirm("추방하시겠습니까?");
        if(!check){
            return;
        }

        const xhttp = new XMLHttpRequest();
        xhttp.open("POST","./deletemember");
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("userId="+userId);
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = xhttp.responseText.trim();
                if(result == '1'){
                    alert("추방 성공");
                    location.reload();
                    return;
                }else{
                    alert("추방 실패");
                    return;
                }
            }
        }
        return;
    
    }
}

// 같이해요 회원 별 목록 불러오기
let boardlist = document.getElementById("boardlist");
let sharinguser = null;
let shlength = null;
const btn = document.getElementById("btn");
function getSharingList(page,userId){
    sharinguser = userId;
  
    console.log("같이해요 리스트");
    
    console.log(userId);

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","./sharinglist?page="+page+"&userId="+userId);
        xhttp.send();
        xhttp.addEventListener("readystatechange", function(){
            if(this.readyState == 4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                let pager = result.pager;
                // console.log(pager);
                let sharing = result.sharing;
                shlength = sharing.length;
                let staticBackdropLabel = document.getElementById("staticBackdropLabel");
                staticBackdropLabel.innerHTML = "같이해요";

                

                boardlist.innerHTML = "";

                let tab = document.createElement("table");
                    tab.setAttribute("class","table");
                    let thead = document.createElement("thead");
                    let tr = document.createElement("tr");
                    let th = document.createElement("th");
                    let text = document.createTextNode("글제목");

                    th.appendChild(text);
                    tr.appendChild(th);
                    
                    th=document.createElement("th");
                    text = document.createTextNode("작성일");
                    
                    th.appendChild(text);
                    tr.appendChild(th);


                    th=document.createElement("th");
                    text = document.createTextNode("조회수");
                    
                    th.appendChild(text);
                    tr.appendChild(th);

                    
                    thead.appendChild(tr);
                    tab.appendChild(thead);

                    let tb = document.createElement("tbody");
                for(let i = 0 ; i<sharing.length ; i++){
                   
                    let tr = document.createElement("tr");

                    let td = document.createElement("td");
                    let text = document.createTextNode(sharing[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(sharing[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(sharing[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute("class","delete"+i);
                    td.setAttribute("data-num", sharing[i].num);
                    text = document.createTextNode("삭제");
                    td.appendChild(text);
                    tr.appendChild(td);

                    tb.appendChild(tr);
                }//for문 끝

                tab.appendChild(tb);
                boardlist.appendChild(tab);
                
                let btnmore = document.createElement("btn");
                let txt = document.createTextNode("더보기");
                btnmore.setAttribute("id","more");
                btnmore.setAttribute("class", "btn btn-danger");
                btnmore.appendChild(txt);
                
                boardlist.appendChild(btnmore);

                let more = document.getElementById("more");

                
                btn.click();

                page++;
                console.log(pager.totalPage);
                if(page > pager.totalPage){
                    more.classList.add("disabled");
                }else{
                    more.classList.remove("disabled");
                }

                more.addEventListener("click", function(){
                    const xhttp2 = new XMLHttpRequest();
                    xhttp2.open("GET","./sharinglist?page="+page+"&userId="+userId);
                    xhttp2.send();
                    xhttp2.onreadystatechange = function(){
                        if(this.readyState == 4 && this.status == 200){
                            let result = JSON.parse(xhttp2.responseText.trim());
                            sharing = result.sharing;
                            shlength = sharing.length;
                            for(let i = 0 ; i<sharing.length ; i++){
                                let tr = document.createElement("tr");
                                let td = document.createElement("td");
                                let text = document.createTextNode(sharing[i].title);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(sharing[i].regDate);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(sharing[i].hit);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                td.setAttribute("class","delete"+i);
                                td.setAttribute("data-num", sharing[i].num);
                                text = document.createTextNode("삭제");
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                tb.appendChild(tr);

                            }//for문 끝
                            page++;
                            console.log(pager.totalPage);
                            if(page > pager.totalPage){
                                more.classList.add("disabled");
                            }else{
                                more.classList.remove("disabled");
                            }
                          
                        }
                    }

                })

            //if문 끝
            }
        })//ajax 끝

}


// Sharing 삭제
boardlist.addEventListener("click", function(event){
    for(let i = 0 ; i<shlength ; i++){
    if(event.target.className == "delete"+i){
        let check = window.confirm("삭제하시겠습니까?");
        if(check == true){
            let num = event.target.getAttribute("data-num");
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./sharingdelete");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("num="+num);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());

                    if(result == '1'){
                        
                        alert("삭제 완료");
                        getSharingList('1',sharinguser);
                    }
                    
                }
                
            }
            
        }
        
    }
}
})

//QNA 리스트 불러오기

let qnauser = null;
let qnalength = null;
function getQnaList(page,userId){
    qnauser = userId;
  
    console.log("같이해요 리스트");
    
    console.log(userId);

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","./qnalist?page="+page+"&userId="+userId);
        xhttp.send();
        xhttp.addEventListener("readystatechange", function(){
            if(this.readyState == 4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                let pager = result.pager;
                // console.log(pager);
                let qna = result.qna;
                qnalength = qna.length;
                let staticBackdropLabel = document.getElementById("staticBackdropLabel");
                staticBackdropLabel.innerHTML = "QNA";

                
                boardlist.innerHTML = "";

                let tab = document.createElement("table");
                    tab.setAttribute("class","table");
                    let thead = document.createElement("thead");
                    let tr = document.createElement("tr");
                    let th = document.createElement("th");
                    let text = document.createTextNode("글제목");

                    th.appendChild(text);
                    tr.appendChild(th);
                    
                    th=document.createElement("th");
                    text = document.createTextNode("작성일");
                    
                    th.appendChild(text);
                    tr.appendChild(th);


                    th=document.createElement("th");
                    text = document.createTextNode("조회수");
                    
                    th.appendChild(text);
                    tr.appendChild(th);

                    
                    thead.appendChild(tr);
                    tab.appendChild(thead);

                    let tb = document.createElement("tbody");

                for(let i = 0 ; i<qna.length ; i++){
                    let tr = document.createElement("tr");
                    let td = document.createElement("td");
                    let text = document.createTextNode(qna[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(qna[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(qna[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute("class","delete"+i);
                    td.setAttribute("data-num", qna[i].num);
                    text = document.createTextNode("삭제");
                    td.appendChild(text);
                    tr.appendChild(td);

                    tb.appendChild(tr);
                }//for문 끝


                tab.appendChild(tb);
                boardlist.appendChild(tab);
                
                let btnmore = document.createElement("btn");
                let txt = document.createTextNode("더보기");
                btnmore.setAttribute("id","more");
                btnmore.setAttribute("class", "btn btn-danger");
                btnmore.appendChild(txt);
                
                boardlist.appendChild(btnmore);

                let more = document.getElementById("more");

                btn.click();

                page++;
                console.log(pager.totalPage);
                if(page > pager.totalPage){
                    more.classList.add("disabled");
                }else{
                    more.classList.remove("disabled");
                }

                more.addEventListener("click", function(){
                    const xhttp2 = new XMLHttpRequest();
                    xhttp2.open("GET","./qnalist?page="+page+"&userId="+userId);
                    xhttp2.send();
                    xhttp2.onreadystatechange = function(){
                        if(this.readyState == 4 && this.status == 200){
                            let result = JSON.parse(xhttp2.responseText.trim());
                            qna = result.qna;
                            qnalength= qna.length;
                            for(let i = 0 ; i<qna.length ; i++){
                                let tr = document.createElement("tr");
                                let td = document.createElement("td");
                                let text = document.createTextNode(qna[i].title);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(qna[i].regDate);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(qna[i].hit);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                td.setAttribute("class","delete"+i);
                                td.setAttribute("data-num", qna[i].num);
                                text = document.createTextNode("삭제");
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                tb.appendChild(tr);

                            }//for문 끝
                            page++;
                            console.log(pager.totalPage);
                            if(page > pager.totalPage){
                                more.classList.add("disabled");
                            }else{
                                more.classList.remove("disabled");
                            }
                          
                        }
                    }

                })

            //if문 끝
            }
        })//ajax 끝
}


// QNA 삭제
boardlist.addEventListener("click", function(event){
    for(let i = 0; i<qnalength ; i++){
    if(event.target.className == "delete"+i){
        let check = window.confirm("삭제하시겠습니까?");
        if(check == true){
            let num = event.target.getAttribute("data-num");
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./qnadelete");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("num="+num);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());

                    if(result == '1'){
                        alert("삭제 완료");

                        getQnaList('1',qnauser);
                        // btn.click();
                    }else{
                        alert("삭제 실패");
                    }
                }
            }
        }
    }
    }
})



//회원 상세 프로필
function getDetail(id){
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./memberdetail");
    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhttp.send("userId="+id);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());

            boardlist.innerHTML = "";
            

            let div1 = document.createElement("div");
            div1.setAttribute("class","col-lg-8 align-items-center");
            let div = document.createElement("div");
            div.setAttribute("class","col-lg-2 text-center");
            let img = document.createElement("img");
            img.setAttribute("src","/resources/upload/member/"+result.memberFileDTO.fileName);
            img.setAttribute("class","img-fluid testimonial-img");

            div.appendChild(img);
            div1.appendChild(div);

            let input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.userName);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","number");
            input.setAttribute("value",result.phone);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","email");
            input.setAttribute("value",result.email);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.itemZipCode);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.address);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.deAddress);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.petCatg);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            input = document.createElement("input");
            input.setAttribute("type","text");
            input.setAttribute("value",result.petName);
            div = document.createElement("div");
            div.setAttribute("class","col-sm-7");
            div.appendChild(input);
            div1.appendChild(div);

            boardlist.appendChild(div1);
            btn.click();
        }
    }

    
}

//------------------------------------------------------------------

// 회원 별 구매 상품 목록 불러오기

function getItemList(p,ui,ps){
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST","./purchaselist");
    xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xhttp.send("userId="+ui+"&purchaseStatus="+ps);
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());

            boardlist.innerHTML = "";

            
            let row = document.createElement("div");
            row.setAttribute("class","row gy-4");
            
            for(let i = 0 ; i<result.length; i++){
                let div = document.createElement("div");
                div.setAttribute("class","col-lg-4 col-md-6 d-flex align-items-stretch");
                div.setAttribute("data-aos","fade-up");
                div.setAttribute("data-aos-delay",'100');

                let div1 = document.createElement("div");
                div1.setAttribute("class","chef-member");

                let div2 = document.createElement("div");
                div2.setAttribute("class","member-img");
                // div2.setAttribute("style","border: 1px solid gold; float: left; width: 50%;")

                let img1 = document.createElement("img");
                img1.setAttribute("src","/resources/upload/sellfile/"+result[i].fileDTOs[0].fileName);

                // let div3 = document.createElement("div");
                // div3.setAttribute("class","social");

                let div4 = document.createElement("div");
                div4.setAttribute("class","member-info");
                // div4.setAttribute("style","border: 1px solid gold; float: right; width: 50%;")
                let h4 = document.createElement("h4");
                let text = document.createTextNode("상품이름 : "+ result[i].itemDTO.itemName);
                console.log(result[i].itemDTO.itemName);
                h4.appendChild(text);
                div4.appendChild(h4);
                let span = document.createElement("span");
                text = document.createTextNode("결제금액 : " + result[i].amount);
                span.appendChild(text);
                div4.appendChild(span);

                div2.appendChild(img1);
                div1.appendChild(div2);
                div1.appendChild(div4);
                div.appendChild(div1);

                row.appendChild(div);
            }
            boardlist.appendChild(row);
            
            
            btn.click();
        }
    }
}


//이벤트 목록 불러오기
let eventuser = null;
let eventlength = null;
function getEventList(page,userId){
    eventuser = userId;
  
    console.log("이벤트 리스트");
    
    console.log(userId);

        const xhttp = new XMLHttpRequest();
        xhttp.open("GET","./eventlist?page="+page+"&kind=writer"+"&search="+userId);
        xhttp.send();
        xhttp.addEventListener("readystatechange", function(){
            if(this.readyState == 4 && this.status==200){
                let result = JSON.parse(xhttp.responseText.trim());
                let pager = result.pager;
                // console.log(pager);
                let event = result.event;
                eventlength = event.length;
                let staticBackdropLabel = document.getElementById("staticBackdropLabel");
                staticBackdropLabel.innerHTML = "이벤트";

                

                boardlist.innerHTML = "";

                let tab = document.createElement("table");
                    tab.setAttribute("class","table");
                    let thead = document.createElement("thead");
                    let tr = document.createElement("tr");
                    let th = document.createElement("th");
                    let text = document.createTextNode("글제목");

                    th.appendChild(text);
                    tr.appendChild(th);
                    
                    th=document.createElement("th");
                    text = document.createTextNode("작성일");
                    
                    th.appendChild(text);
                    tr.appendChild(th);


                    th=document.createElement("th");
                    text = document.createTextNode("조회수");
                    
                    th.appendChild(text);
                    tr.appendChild(th);

                    
                    thead.appendChild(tr);
                    tab.appendChild(thead);

                    let tb = document.createElement("tbody");
                for(let i = 0 ; i<event.length ; i++){
                   
                    let tr = document.createElement("tr");

                    let td = document.createElement("td");
                    let text = document.createTextNode(event[i].title);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(event[i].regDate);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    text = document.createTextNode(event[i].hit);
                    td.appendChild(text);
                    tr.appendChild(td);

                    td = document.createElement("td");
                    td.setAttribute("class","delete"+i);
                    td.setAttribute("data-num", event[i].num);
                    text = document.createTextNode("삭제");
                    td.appendChild(text);
                    tr.appendChild(td);

                    tb.appendChild(tr);
                }//for문 끝

                tab.appendChild(tb);
                boardlist.appendChild(tab);
                
                let btnmore = document.createElement("btn");
                let txt = document.createTextNode("더보기");
                btnmore.setAttribute("id","more");
                btnmore.setAttribute("class", "btn btn-danger");
                btnmore.appendChild(txt);
                
                boardlist.appendChild(btnmore);

                let more = document.getElementById("more");

                
                btn.click();

                page++;
                console.log(pager.totalPage);
                if(page > pager.totalPage){
                    more.classList.add("disabled");
                }else{
                    more.classList.remove("disabled");
                }

                more.addEventListener("click", function(){
                    const xhttp2 = new XMLHttpRequest();
                    xhttp2.open("GET","./eventlist?page="+page+"&kind=writer"+"&search="+userId);
                    xhttp2.send();
                    xhttp2.onreadystatechange = function(){
                        if(this.readyState == 4 && this.status == 200){
                            let result = JSON.parse(xhttp2.responseText.trim());
                            event = result.event;
                            eventlength = event.length;
                            for(let i = 0 ; i<event.length ; i++){
                                let tr = document.createElement("tr");
                                let td = document.createElement("td");
                                let text = document.createTextNode(event[i].title);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(event[i].regDate);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                text = document.createTextNode(event[i].hit);
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                td = document.createElement("td");
                                td.setAttribute("class","delete"+i);
                                td.setAttribute("data-num", event[i].num);
                                text = document.createTextNode("삭제");
                                td.appendChild(text);
                                tr.appendChild(td);
            
                                tb.appendChild(tr);

                            }//for문 끝
                            page++;
                            console.log(pager.totalPage);
                            if(page > pager.totalPage){
                                more.classList.add("disabled");
                            }else{
                                more.classList.remove("disabled");
                            }
                          
                        }
                    }

                })

            //if문 끝
            }
        })//ajax 끝
}

//이벤트 삭제
boardlist.addEventListener("click", function(event){
    for(let i = 0; i<eventlength ; i++){
    if(event.target.className == "delete"+i){
        let check = window.confirm("삭제하시겠습니까?");
        if(check == true){
            let num = event.target.getAttribute("data-num");
            
            const xhttp = new XMLHttpRequest();
            xhttp.open("POST","./qnadelete");
            xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xhttp.send("num="+num);
            xhttp.onreadystatechange = function(){
                if(this.readyState == 4 && this.status == 200){
                    let result = JSON.parse(xhttp.responseText.trim());

                    if(result == '1'){
                        alert("삭제 완료");

                        getEventList('1',eventuser);
                        // btn.click();
                    }else{
                        alert("삭제 실패");
                    }
                }
            }
        }
    }
    }
})


function getSellItem(){
    
}