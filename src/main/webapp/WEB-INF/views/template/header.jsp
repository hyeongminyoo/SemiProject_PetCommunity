<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WALWAL</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- SockJs Websocket Jquery-->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Yummy - v1.2.0
  * Template URL: https://bootstrapmade.com/yummy-bootstrap-restaurant-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
   <!--Search Modal -->
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Search</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form class="d-flex" action="../sell/search" method="get" id="searchFrm">
              <div class="modal-body">
                <div>
                  <select name="itemCatg" class="form-control" id="searchItemCatg" value="">
                    <option value="">-- ?????? ???????????? ?????? --</option>
                    <option value="1">?????????</option>
                    <option value="2">??????????????????</option>
                    <option value="3">????????????</option>
                  </select>
                </div>
                <input class="form-control me-2" type="text" name="search" placeholder="????????? ??????" aria-label="Search" value="">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-success" id="searchBtn">Search</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >??????</button>
              </div>
            </form>
          </div>
      </div>
    </div>
  <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center" style="position: fixed; top:0; width:100vw; justify-content: space-evenly;">
    <!-- search button+logo start -->
    <div style="display: flex; align-items: center;">
      <!-- Button trigger modal -->
      <button type="button" class="btn-book-a-table" data-bs-toggle="modal" data-bs-target="#searchModal" style="border:0px; margin: 0;">
        <i class="bi bi-search"></i>
        </button>
          <a href="/" class="logo d-flex align-items-center me-auto me-lg-0">
            <span style="font-size: 40px; color: black; font-weight: 700;">WALWAL.</span>
          </a>
    </div>
    <!-- search button+logo end -->

    <!-- Main menu start -->
    <div>
        <nav id="navbar" class="navbar">
              <ul>
                <li><a href="../">Home</a></li>
                <li class="dropdown"><a href="#"><span>?????? ?????????</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                  <ul>
                        <li><a href="/sell/list?itemCatg=1">?????????</a></li>
                        <li><a href="/sell/list?itemCatg=2">One Day ?????????</a></li>
                        <li><a href="/sell/list?itemCatg=3">????????????</a></li>
                        <li><a href="/sell/pettx">Pet-Taxi</a></li>
                  </ul>
                </li>
                <li><a href="/traveling/map">????????????</a></li>
                <li class="dropdown"><a href="#"><span>????????????</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                  <ul>
                    <li><a href="/sharing/list">????????????</a></li>
                    <li><a href="/event/list">?????????</a></li>
                  </ul>
                </li>
                <li class="dropdown"><a href="#"><span>????????????</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                  <ul>
                    <li><a href="/notice/list">????????????</a></li>
                    <li><a href="/qna/list">QnA</a></li>
                  </ul>
                </li>
                <c:if test="${sessionScope.member.userName eq 'admin'}">
                  <li><a href="/admin/mypage">????????? ?????????</a></li>
                </c:if>
              </ul>
        </nav>
    </div>
      <!-- .navbar -->

 <!--????????? ???????????? ???-->

  <c:if test="${not empty sessionScope.member}">
    <div style="display: inline-block; width: 500px;">
    <h5 style="color: gray; font-size: smaller; display: inline-block; width: 100px;">${sessionScope.member.userName}???<br>???????????????!</h5>
    <a class="btn-book-a-table" href="/member/mypage">Mypage</a>
  <c:choose>
    <c:when test="${empty member.password}">
      <!-- ????????? ???????????? ?????? password?????? ??????. kakao session ?????? ??????-->
      <a class="btn-book-a-table" href="https://kauth.kakao.com/oauth/logout?client_id=3de4327e8b367107a94e0ffc38dcc41d&logout_redirect_uri=http://localhost/member/logout">Logout</a>
    </c:when>
    <c:otherwise>
    <a class="btn-book-a-table" href="/member/logout">Logout</a>
    </c:otherwise>
  </c:choose>
  <c:if test="${member.roleNum eq 2}">
  <a href="/member/cart" style="display: inline-block; width: 80px; margin-left: 20px;"><i class="bi bi-cart-check" style="margin-left: 5%; font-size: 2rem;"></i></a>
  </c:if>
  </div>
  </c:if>
  <!-- ????????? ???????????? ??? -->
  <c:if test="${empty sessionScope.member}">
  <div style="display: inline-block;">
    <h5 style="color: gray; font-size: smaller; display: inline-block; width: 100px;">????????? ????????? ??????<br>?????????????????????</h5>
    <a class="btn-book-a-table" href="/member/login">Login</a>
    <a class="btn-book-a-table" href="/member/role">Join</a>
  </div>
    </c:if>        
<i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
<i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
<div id="msgStack"></div>
</header><!-- End Header -->



<!--?????? ???????????????-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="/resources/JS/sellHeader.js"></script>
<script>
searchClose();
</script>
<!-- Sock Js ?????? ????????????-->
<script>

  //????????????
  let socket = null;
  $(document).ready(function(){
    //??? ?????? ??????
    let name = "${sessionScope.member.userName}";
    if(name != null){
      console.log("????????? ??????")
      console.log(name);
      connectWs(name);
    }
  });
    
    function connectWs(name){
      sock = new SockJS("/echo");
      sock.onopen = onOpen;
      sock.onmessage = onMessage;
      sock.onclose = onClose;

      function onOpen(evt){
      }


      // ?????? ??????(??????) ?????? ???????????? ????????? ???????????? ????????? ??????
      function onMessage(msg){
        let data = msg.data;
          console.log(data);

          let toast = "<div class='toast' id='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
          toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>??????</strong>";
          toast += "<small class='text-muted'>just now</small><button type='button' onclick= 'alarmClose()' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
          toast += "<span aria-hidden='true'>&times;</span></button>";
          toast += "</div> <div class='toast-body'>" + data + "</div></div>";
          $("#msgStack").append(toast);   // msgStack div??? ????????? toast ??????
          $(".toast").toast({"animation": true, "autohide": false});
          $('.toast').toast('show');
        
      }

      function onClose(evt){}

    }

    function alarmClose(){
        let toast = document.getElementById("toast");
        toast.remove();
    }

</script>

</body>
</html>