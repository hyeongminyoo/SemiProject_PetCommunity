<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Update Review</title>
<meta content="" name="description">
<meta content="" name="keywords">

<link href="/resources/assets/css/star.css" rel="stylesheet">
<style type="text/css">
#imgDiv{
  display: flex;
}

.newDiv{
  justify-content: center;
  align-items:center;
  position: relative;
  width: 80px;
      height: 80px;
  margin-right: 5px;
}
.thumnail{
    width: 80px;
    height: 80px;

    } 
.imgDeleteBtn {
  position: absolute;
  top: 0px;
  right: 0px;
}

#inputDiv{
  display: none;
}


</style>
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Add Items Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Update Review</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
			<form action="reviewupdate" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				<input type="hidden" name="rvNum" value="${reviewDTO.rvNum }">
				<div class="row gy-4">
                	<div class="col-lg-8 col-md-6">
						작성자<input type="text" class="form-control disb" readonly="readonly" name="userId" value="${reviewDTO.userId }">
						<div class="validate"></div>
                	</div>
                	<div class="col-lg-8 col-md-6">
						제목<input type="text" class="form-control disb" name="rvTitle" value="${reviewDTO.rvTitle }">
						<div class="validate"></div>
                	</div>
                	<div class="form-group mt-3" style="margin-top: 5px;">
						<textarea class="form-control" rows="5" name="rvContents" value="${reviewDTO.rvContents }">${reviewDTO.rvContents}</textarea>
					<div class="validate"></div>
                	</div>
				<c:if test="${reviewDTO.rvRate == 0.5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" checked="checked" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 1}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" checked="checked" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 1.5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" checked="checked" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 2}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" checked="checked" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 2.5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" checked="checked" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 3}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" checked="checked" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 3.5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" checked="checked" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 4}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" checked="checked" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 4.5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" checked="checked" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

						

					  </fieldset>
				</c:if>
				<c:if test="${reviewDTO.rvRate == 5}">
					<fieldset class="rating">
						평점
						<input type="radio" id="star5" name="rvRate" value="5" checked="checked" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>

						<input type="radio" id="star4half" name="rvRate" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
						<input type="radio" id="star4" name="rvRate" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
						<input type="radio" id="star3half" name="rvRate" value="3.5" /><label  class="half" for="star3half" title="Meh - 3.5 stars"></label>
						<input type="radio" id="star3" name="rvRate" value="3" /><label  class = "full" for="star3" title="Meh - 3 stars"></label>
						<input type="radio" id="star2half" name="rvRate" value="2.5" /><label  class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
						<input type="radio" id="star2" name="rvRate" value="2" /><label  class = "full" for="star2" title="Kinda bad - 2 stars"></label>
						<input type="radio" id="star1half" name="rvRate" value="1.5" /><label  class="half" for="star1half" title="Meh - 1.5 stars"></label>
						<input type="radio" id="star1" name="rvRate" value="1" /><label  class = "full" for="star1" title="Sucks big time - 1 star"></label>
						<input type="radio" id="starhalf" name="rvRate" value="0.5" /><label  class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

						  

					  </fieldset>
				</c:if>
				<input type="hidden" name="itemNum" value="${reviewDTO.itemNum}">
				<div class="col-lg-12 col-md-12 fileList">
					<c:forEach items="${reviewDTO.rvFileDTOs }" var="fileDTO">
						<span>${fileDTO.oriName}
						<button class="fileDelete uFileDelete btn btn-outline-danger" type="button" data-file-num="${fileDTO.photoNum}">사진 삭제</button>
						</span>
					</c:forEach>
				</div>
				<div class="col-lg-12 col-md-12">
					<div id="addFiles">
						<button type="button" id="fileAdd" class="btn btn-outline-primary">리뷰 사진 추가</button>
					</div>
				<div class="col-lg-4 col-md-6">  
                <div id="sellFileImages">
                  <div id= "inputDiv"></div>
                  <div id = "imgDiv"></div>
                </div>
                </div>
				</div>
              	<br>
				<div class="text-center">
		 	    	<button type="submit" class="btn btn-outline-primary">리뷰수정</button>
		 	    </div>
				</div>
     	     </form>
     	    </div>
     	  </div>
     	 </section>
  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->
  <script src="/resources/JS/review_file.js"></script>
  <script>setCount(${reviewDTO.rvFileDTOs.size()});</script>
</body>
</html>