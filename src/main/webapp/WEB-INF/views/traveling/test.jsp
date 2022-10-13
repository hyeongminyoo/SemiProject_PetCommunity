<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.side-menu {
            top: 89px;
            width: 45px;
            z-index: 10;
            background: #ff5858;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 70px;
            position: fixed;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
        }

        .sidebar-inner {
            height: 100%;
            padding-top: 30px;
        }

        #sidebar-menu,
        #sidebar-menu ul,
        #sidebar-menu li,
        #sidebar-menu a {
            border: 0;
            font-weight: normal;
            line-height: 1;
            list-style: none;
            margin: 0;
            padding: 0;
            position: relative;
            text-decoration: none;
        }

        #sidebar-menu>ul>li a {
            color: #fff;
            font-size: 20px;
            display: block;
            padding: 14px 0px;
            margin: 0px 0px 0px 8px;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            width: 28px;
            cursor: pointer;
        }

        #sidebar-menu .fas {
            padding-left: 6px;
        }

        /* 사이드 메뉴 */
        input[type="search"] {
            width: 180px;
            margin: 0 auto;
            margin-left: 9px;
            border: 2px solid #797979;
            font-size: 14px;
            margin-top: 10px;
            padding: 4px 0 4px 14px;
            border-radius: 50px;
        }

        .left_sub_menu {
            position: fixed;
            top: 89px;
            width: 200px;
            z-index: 10;
            left: 45px;
            background: white;
            border-right: 1px solid rgba(0, 0, 0, 0.07);
            bottom: 50px;
            height: 100%;
            margin-bottom: -70px;
            margin-top: 0px;
            padding-bottom: 0px;
            box-shadow: 0 0px 24px 0 rgb(0 0 0 / 6%), 0 1px 0px 0 rgb(0 0 0 / 2%);
            color: black;
        }

        .sub_menu {
            margin-top: 50px;
        }

        .left_sub_menu>.sub_menu li:hover {
            color: ff5858;
            background-color: #e1e1e1;
        }

        .left_sub_menu>.sub_menu li {
            color: #333;
            font-size: 17px;
            font-weight: 600;
            padding: 20px 0px 8px 14px;
            border-bottom: 1px solid #e1e1e1;
        }

        .sub_menu>h2 {
            padding-bottom: 4px;
            border-bottom: 3px solid #797979;
            margin-top: 30px;
            font-size: 21px;
            font-weight: 600;
            color: #333;
            margin-left: 10px;
            margin-right: 10px;
            font-family: 'NotoKrB';
            line-height: 35px;
        }

        .sub_menu .fas {
            color: #ff5858;
            font-size: 20px;
            line-height: 20px;
            float: right;
            margin-right: 20px;
        }

        .sub_menu>.big_menu>.small_menu li {
            color: #333;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 0px solid #e1e1e1;
            margin-left: 14px;
            padding-top: 8px;
        }

        .big_menu {
            cursor: pointer;
        }

        ul {
            padding-inline-start: 0px;
        }

        a {
            color: #797979;
            text-decoration: none;
            background-color: transparent;
        }

        ul {
            list-style: none;
        }

        ol,
        ul {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .has_sub {
            width: 100%;
        }

        .overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
        }

        .hide_sidemenu {
            display: none;
        }

        


</style>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
  <!-- 지도영역 -->
        
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>

  <div class="map_wrap" style="position: relative;">
      <div id="map" style="width:100%; height:100vh; position:relative; overflow:hidden; z-index: 1;">
          
        
              <!-- 왼쪽 메뉴 -->
              <div class="left side-menu">
                  <div class="sidebar-inner">
                      <div id="sidebar-menu">
                          <ul>
                              <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
                                  <i class="fas fa-bars"></i>
                              </a></li>
                          </ul>
                      </div>
                  </div>
              </div>
              <!-- 왼쪽 서브 메뉴 -->
              <div class="left_sub_menu" id="submenu" style="display: none;">
                  <div class="sub_menu">
                    
                      <strong><span style="font-size: 30px;" id="title"></span></strong>
                      <div>
                        <img id="itemimg" style="border-radius: 30%;">
                      </div>
       
                  </div>
            
              </div>
              
          </div>
      
      </div>
      <hr>
      
    </div>
    
    <div class="row" id="weather">
      <div class="topbar" style="position: absolute; top:0;">
        <div id="menu_wrap" class="bg_white" style="z-index: 2; color: black; position:absolute">
        <span id="latitude" style="display: none;"></span><br>
        <span id="longitude"style="display: none;"></span><br>
        현재 날씨 : <img id="wicon" src=""><br>
        기온 : <span id="tempr"></span>
      </div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c8a091a525c100bb59fb876c4c7b6bf9&libraries=services"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script> 
  <script>
       
    
 
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET","/traveling/getlist");
    xhttp.send();
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = JSON.parse(xhttp.responseText.trim());
            list = result;
            console.log(list);
            getMap(list);
        }
    }


 
    

    function getMap(list){
    let lat = null;
    let lon = null;
    
    // 현재위치 불러오기-------------------------------------------------------------------
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            lat = position.coords.latitude; // 위도
            lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">나의 현재 위치</div>'; // 인포윈도우에 표시될 내용입니다


            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
            sellItemMarker(list);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
        sellItemMarker(list);
    }


    // -------------------------------------------------------------------

    // -------------------------------------------------------------------


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(lat,lon), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨 
        }; 

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    

 
    
    function sellItemMarker(list){
      var geocoder = new kakao.maps.services.Geocoder();

      for(let i=0; i<list.length; i++){
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(list[i].itemAddress, function(result, status) {

            // 정상적으로 검색이 완료됐으면 
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+list[i].itemName+'</div>'
                });
                infowindow.open(map, marker);
                
                kakao.maps.event.addListener(marker, 'click', function() {
                  // 마커 위에 인포윈도우를 표시합니다
                  console.log("클릭");
                  let item = document.querySelector("#item");
                  let title = document.getElementById("title")
                  let submenu = document.getElementById("submenu");
                  let itemimg = document.getElementById("itemimg");
                  itemimg.setAttribute("src","/resources/upload/sellfile/"+list[i].fileDTOs[0].fileName);
                  submenu.removeAttribute("style");
                  title.innerHTML = ""+list[i].itemName+"";
                 
                //   console.log(list[i].fileDTOs[0]);
                //   infowindow = new kakao.maps.InfoWindow({
                //     content: '<img src="/resources/upload/sellfile/'+list[i].fileDTOs[0].fileName+'/>'
                //               +'<div style="width:150px;text-align:center;padding:6px 0;">'+list[i].itemName+'</div><br>'
                //               +'<div style="width:150px; text-align:center;padding:6px 0;">'+list[i].itemPrice+'</div>'

                //             });
                //             infowindow.open(map, marker);

                });
                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                // map.setCenter(coords);
              
            } 
          
        });    
    }
  }




    function showLocation(event) {
        var latitude = event.coords.latitude 
        var longitude = event.coords.longitude
        document.querySelector("#latitude").textContent = latitude
        document.querySelector("#longitude").textContent = longitude 
      
        
        let apiKey = "184b4b64db6cd5ca2d07ddafd0b11d3b";
        let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latitude 
                      + "&lon=" + longitude 
                      + "&appid=" + apiKey; 
      
          let options = { method: 'GET' }
        $.ajax(weatherUrl, options).then((response) => {
            console.log(response)
            let icon = (response.weather[0].icon);
            console.log(icon);
            let iconUrl = "http://openweathermap.org/img/wn/" + icon +"@2x.png";
            let img = document.querySelector("#wicon");
            img.src = iconUrl 
            document.querySelector("#tempr").textContent = "" + (response.main.temp - 273) + "ºC"  // 현재 온도
          })
      }
      
      function showError(event) {
        alert("위치 정보를 얻을 수 없습니다.")
      }
      
      window.addEventListener('load', () => { 
        if(window.navigator.geolocation) {
          window.navigator.geolocation.getCurrentPosition(showLocation,showError)
        }
      
      })

      let weather = document.getElementById("weather");
      map.addControl(weather, kakao.maps.ControlPosition.TOPRIGHT);

    }

  </script>
</body>
</html>