<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${board} 작성</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


</head>

<body>

  <c:import url="/WEB-INF/views/template/header.jsp"></c:import>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>${board} 작성</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>${board} 작성</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <section class="sample-page">
      <div class="container" data-aos="fade-up">

        <div class="row">
			<form action="add" method="post" enctype="multipart/form-data" id="frm">
				 
			<div class="mb-3">
		  		<input type="text" class="form-control" id="writer" name="writer" style="display: none;" value="${sessionScope.member.userName}">
			</div>
			<div class="mb-3">
		  		<label for="title" class="form-label">제목</label>
		  		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
			</div>
			
			
			<div class="mb-3">
		  		<label for="contents" class="form-label">내용</label>
		  		<textarea class="form-control" id="contents" rows="3" name="contents" placeholder="내용 입력"></textarea>
			</div>
			
			<c:if test="${board eq 'event'}">
        <div class="mb-3">
		  		<label for="contents" class="form-label">적용할 쿠폰</label>
		  		<select class="form-select" id="validationDefault04" required name ="couponNum">
            <option selected disabled value="">선택</option>
            <c:forEach items="${list}" var="coupon">
              <c:choose>
                <c:when test="${coupon.discountMethod eq '0'}">
                  <option id="coupon" value="${coupon.couponNum}"> 쿠폰명 : ${coupon.couponName} ( 할인율/할인금액 : ${coupon.discountRate} % )</option>
                </c:when>
                <c:otherwise>
                  <option id="coupon" value="${coupon.couponNum}"> 쿠폰명 : ${coupon.couponName} ( 할인율/할인금액 : ${coupon.discountPrice} 원 )</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>
			</div>
      </c:if>
      
      <c:if test = "${board eq 'sharing' or board eq 'event'}">
        <label for="file" class="form-label">대표 사진</label>
        <input class="form-control" type="file" id="file0" name="multipartFiles">
      </c:if>

			<div id="addFiles" style=" text-align: center;">
				<button type="button" class="btn btn-danger" id="fileAdd">파일 추가</button>
			</div>
			
			<div style="text-align: right;">
			  <button class="btn btn-outline-danger btn-lg btn-block" type="button" id="btn">작성하기</button>
      </div>
			</form>
		</div>

      </div>
    </section>

  </main><!-- End #main -->

  
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  
  <script src="/resources/JS/board_file.js"></script>
  <!-- include summernote css/js-->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <script type="text/javascript">
	$("#contents").summernote({
      height : 400,
      lang : "ko-KR",
      minHeight : null,
      maxHeight : null,
      focus : true,
      callback : {
        onImageUpload : function(files, editor, welEditable) {
          for(let i=0; i<files.length; i++){
            sendFile(files[i], this);
          }
        }
      }
  });

  function sendFile(file,editor){
    let form_data = new FormData();
    form_data.append('file',file);
    $.ajax({
        data : form_data,
        type : "POST",
        url : '/notice/add',
        cache : false,
        contentType : false,
        enctype : 'multipart/form-data',
        processData : false,
        success : function(url) {
          $(editor).summernote('insertImage', url, function(){
            $image.css('width',"25%");
          });
        }
    })
  }

    let frm = document.getElementById("frm")
    let btn = document.getElementById("btn");
    let title = document.getElementById("title");
    let contents = document.getElementById("contents");
    let coupon = document.getElementById("coupon");

    btn.addEventListener("click", function(){
      if(title.value == "" || contents.value == ""){
        alert("제목 또는 내용을 입력하세요")
      }else if(title.value != "" && contents.value != ""){
        try {
          if(coupon.value == ""){
            alert("쿠폰을 등록하세요.")
            return;
          }
        } catch (error) {
          
        }
        frm.submit();
      }

    })



	</script>
</body>

</html>