<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${board} 상세 페이지</title>
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
          <h2>Sample Inner Page</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Sample Inner Page</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

	<c:if test="${board eq 'sharing'}">
	<section id="hero" class="hero d-flex align-items-center section-bg" style="padding-top: 20px; padding-left: 130px; padding-right: 130px; padding-bottom: 20px;">
		<div class="container">
		  <div class="row justify-content-between gy-5">
			<div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center align-items-center align-items-lg-start text-center text-lg-start">
			  <h2 data-aos="fade-up">${requestScope.member.userName} 님</h2>
			  <p data-aos="fade-up" data-aos-delay="100">Pet 이름 : ${requestScope.member.petName}</p>
			  <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
				<a class="btn-book-a-table" id="follow">팔로우</a>
				
				<!-- <c:if test="${not empty sessionScope.member}">
					<a href="#" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i></a>
				</c:if> -->
				
			  </div>
			</div>
				<div class="col-lg-5 order-1 order-lg-2 text-center text-lg-start">
			  		<img src="../resources/upload/member/${requestScope.member.memberFileDTO.fileName}" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="300">
				</div>
		  </div>
		</div>
	  </section><!-- End Hero Section -->
	</c:if> 

    <section class="sample-page">
		
      <div class="container" data-aos="fade-up">
		<c:if test="${board eq 'qna'}">
		<a href="./reply?num=${dto.num}" class="btn btn-outline-danger">reply</a>
		</c:if>
	
		<a href="./update?num=${requestScope.dto.num}" class="btn btn-outline-danger">수정</a>
	
	
		<a href="./delete?num=${requestScope.dto.num}" class="btn btn-outline-danger">삭제</a>
       <table class="table">
	
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${requestScope.dto.num}</td>
				<td>${requestScope.dto.title}</td>
				<td>${requestScope.dto.writer}</td>
				<td>${requestScope.dto.hit}</td>
				
			</tr>
		</tbody>
		</table>
		
		<!-- <div class="row">
			<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
				<p>
					<img src="../resources/upload/sharing/${fileDTO.fileName}" class="testimonial-img" alt="" style="border-radius: 50%; border: 4px solid #fff; margin: 0 auto; width: 300px; height: 300px; display: block;">
				</p>
			</c:forEach>
		</div>  -->
		
				<div class="form-floating">
					<div class="mb-3">
						<textarea class="form-control" id="text" rows="10" name="contents"></textarea>
				  </div>
			</div>
		
		
				<c:if test="${board eq 'event'}">
					<div>
						<img src="/resources/images/coupon1.png" style="display: block; margin: 0 auto; width:150px; height:150px">
						<button type="button" class="btn btn-outline-danger" id="couponSave" style="display: block; margin: 0 auto;">쿠폰 다운로드</button>
					</div>
				</c:if>
		
		
		
    </div>

    <c:if test="${board eq 'sharing'}">
    <!--------COMMENT---------->
		<div class="row" style="padding-left: 120px; padding-right: 120px;">
			<h5>${requestScope.count} 개의 댓글</h5>
				<div class="mb-3" style="display: none;">
					<label for="writer" class="form-label" style="display: none;">작성자</label>
					<input type="text" class="form-control" id="writer" style="display: none;" readonly value="${sessionScope.member.userId}">
				  </div>
				  <div class="mb-3">
					<textarea class="form-control" id="contents" rows="3" placeholder="댓글을 작성하세요"></textarea>
				  </div>
				  <div class="mb-3">
					<button type="button" id="commentAdd" data-num="${dto.num}">댓글 작성</button>

				  </div>
			</div>
			<div class="row" style="padding-left: 120px; padding-right: 120px;">
				<table id="commentList" class="table table-light table-hover">

				</table>

				<button id="more" class="btn btn-danger">더 보기</button>

			</div>
			<!--------COMMENT---------->

		
		<!--- Modal ----->
		<div>
			<button type="button" style="display: none;" id="up" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">댓글 수정</button>

			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="num">
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">Writer</label>
						<input type="text" class="form-control" readonly id="updateWriter">
					</div>
					<div class="mb-3">
						<label for="message-text" class="col-form-label">Contents</label>
						<textarea class="form-control" id="updateContents"></textarea>
					</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="updateButton">수정하기</button>
				</div>
				</div>
			</div>
			</div>

		</div>
   </c:if>

    </section>
	
  </main><!-- End #main -->

  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  	<script type="text/javascript">
		let userName = '${requestScope.member.userName}';
		let userName2 = '${sessionScope.member.userName}';
	</script>
	<script type="text/javascript" src="/resources/JS/board/boardComment.js"></script>
  	<script type="text/javascript">

		$('#text').summernote('pasteHTML', '${requestScope.dto.contents}');
		$('#text').next().find(".note-editable").attr("contenteditable", false);
		
		const toolbar = document.getElementsByClassName("note-toolbar");
		toolbar[0].setAttribute("style","display : none;");

		let followee = "${requestScope.member.userId}";
		let userId= "${sessionScope.member.userId}";
		let couponNum = "${coupon.couponNum}"
		let num = "${requestScope.dto.num}";
		let data = "${requestScop.dto.contents}";
		
		try {
			
			setFollow(followee, userId);
		} catch (error) {
			
		}
		
		try {
			
			saveCoupon(couponNum, userId, num);
		} catch (error) {
			
		}

	</script>
</body>

</html>