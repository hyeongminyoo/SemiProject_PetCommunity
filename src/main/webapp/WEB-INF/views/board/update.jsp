<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${board}</title>
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
          <h2>${board} 수정</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>${board} 수정</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <section class="sample-page">
      <div class="container" data-aos="fade-up">

        <div class="row">
			<form action="update" method="post" enctype="multipart/form-data">
				 
			<div class="mb-3">
				<label for="title" class="form-label">작성자</label>
        <input type="text" class="form-control" value="${dto.num}" name="num" style="display: none;">
		  		<input type="text" class="form-control" id="writer" name="writer"  readonly value="${dto.writer}">
			</div>
			<div class="mb-3">
		  		<label for="title" class="form-label">제목</label>
		  		<input type="text" class="form-control" id="title" name="title" value="${dto.title}">
			</div>
			
			
			<div class="mb-3">
		  		<label for="contents" class="form-label">내용</label>
		  		<textarea class="form-control" id="contents" rows="3" name="contents"></textarea>
			</div>
			
			<c:if test="${board eq 'event'}">
        <div class="mb-3">
		  		<label for="contents" class="form-label">적용할 쿠폰</label>
		  		<select class="form-select" id="validationDefault04" required name ="couponNum">
            <option selected disabled value="">선택</option>
            <c:forEach items="${list}" var="coupon">
              <option value="${coupon.couponNum}"> 쿠폰명 : ${coupon.couponName} ( 할인율/할인금액 : ${coupon.discountRate} % )</option>
            </c:forEach>
          </select>
			</div>
      </c:if>
			
			<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
				<div class="mb-3">
		  			<span class="form-control">${fileDTO.oriName}</span>
		  			<button type="button" class="fileDelete" data-file-num = "${fileDTO.fileNum}">삭제</button>
				</div>
			</c:forEach>
			
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
  
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	 <script type="text/javascript">
	
	 $('#contents').summernote('pasteHTML', '${dto.contents}');
	 
	 /* $("#contents").summernote({
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
  }); */

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

    btn.addEventListener("click", function(){
      if(title.value == "" || contents.value == ""){
        alert("제목 또는 내용을 입력하세요")
      }else if(title.value != "" && contents.value != ""){
        frm.submit();
      }
      })
	</script>

</body>

</html>