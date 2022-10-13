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
          <h2>${board}</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>${board}</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <section class="sample-page">
      <div class="container" data-aos="fade-up">
		<div class="row">
		<form action="./list?" class="row row-cols-lg-auto g-3 align-items-center">
		
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
     
     
      <div class="row">
	<table class="table">
		<thead>
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일자</th><th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="dto">
			<tr>
				<td>${pageScope.dto.num}</td>
				<td>
				<%-- for(int i = begin; i<= end; i++ --%>
				<c:catch>
				<c:forEach begin="1" end="${dto.depth}">&ensp;↳</c:forEach>
				</c:catch>
				<a href="./detail?num=${pageScope.dto.num}">${pageScope.dto.title}</a>
				</td>
				<td>${pageScope.dto.writer}</td>
				<td>${pageScope.dto.regDate}</td>
				<td>${pageScope.dto.hit}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    
	    <li class="page-item ${pager.pre?'':'disabled'}">
	      <a class="page-link" href="./list?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a>
	    </li>
	    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	    <li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
	   </c:forEach>
	    <li class="page-item ${pager.next?'':'disabled'}">
	      <a class="page-link" href="./list?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a>
	    </li>
	  </ul>
	</nav>
	
	</div>
	<div class="mb-3">
		<a href="./add" class="btn btn-outline-danger">새 글 작성하기</a>
	</div>
    </section>

  </main><!-- End #main -->

  
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  

<script>
	const kinds = document.querySelectorAll(".kinds")
	let k = '${pager.kind}';
	
		for(let i = 0; i<kinds.length ; i++){
			if(kinds[i].value == k){
				kinds[i].selected = true;
				break;
			}
		}
</script>


</body>

</html>