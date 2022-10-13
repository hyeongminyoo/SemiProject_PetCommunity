<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
          <h2>${board}</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>${board}</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

<!-- ======= 같이해요 리스트 Section ======= -->
    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">
        
        <div class="section-header">
          <c:choose>
            <c:when test="${board eq 'sharing'}">
              <h2>같이해요</h2>
              <p>회원 <span>정보 공유</span> 게시판</p>
            </c:when>
            <c:otherwise>
              <h2>이벤트</h2>
              <p>이벤트 게시판</p>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="row">
          <form action="list" class="row row-cols-lg-auto g-3 align-items-center" method="get">
          
            <div class="col-12">
              <label class="visually-hidden" for="kind">Preference</label>
              <select name="kind" class="form-select" id="kind">
                <option class="kinds" value="contents">내용</option>
                <option class="kinds" value="title">제목</option>
                <option class="kinds" value="writer">작성자</option>
              </select>
            </div>
          
            <div class="col-12">
              <label class="visually-hidden" for="search">검색어 입력</label>
              <div class="input-group">
                <input type="text" name="search" value="${pager.search}" class="form-control" id="search" placeholder="검색어 입력">
              </div>
            </div>
        
            <div class="col-12">
              <button type="submit" class="btn btn-outline-danger">검색</button>
            </div>
          </form>
          
        </div>
        <br>
      <div class="row">
        <div class="mb-3">
          <a href="./add" class="btn btn-danger">새 글 작성하기</a>
        </div>
      </div>

      <div class="row gy-4">
		    <c:forEach items="${list}" var="dto">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100" style=" cursor: pointer;" onclick="location.href='./detail?num=${dto.num}';">
            <div class="chef-member">
              <div class="member-img">
                <c:choose>
                  <c:when test="${requestScope.board eq 'sharing'}">
                    <img src="/resources/upload/sharing/${pageScope.dto.boardFileDTOs[0].fileName}" class="img-fluid" alt="">
                  </c:when>
                  <c:otherwise>
                    <img src="/resources/upload/event/${pageScope.dto.boardFileDTOs[0].fileName}" class="img-fluid" alt="">
                  </c:otherwise>
                </c:choose>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>${dto.title}</h4>
                <span>${dto.regDate}</span>
                <p>by ${dto.writer}</p>
                <c:if test = "${board eq 'sharing'}">
                  <img src="/resources/images/comment.png" style="width : 30px; height : 30px; " alt=""><span>${dto.count}</span>
                </c:if>
                </div>
            </div>
          </div><!-- 글 리스트 -->
          
        </c:forEach>
       
      </div>

      </div>
    </section><!-- End Chefs Section -->
  </main>
<c:import url="/WEB-INF/views/template/footer.jsp"></c:import>

</body>
</html>