<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mypage</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">

.testimonial-img {
  border-radius: 50%;
  border: 4px solid #fff;
  margin: 0 auto;
}

#pf{
  display: inline-block;
  font-size: larger;
  font-weight: bold;
  margin-top: 20px;
  margin-left: 40px;
}

#minpf{
  display: inline-block;
  font-size: smaller;
  color: dimgrey;
}

.col-xs-6{
  display: inline-block;
  width: 300px;
  margin: 0px;
}

.jg{
  margin-left: 25%;
}
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= mypage Section ======= -->

<section id="contact" class="contact">
  <div class="container" data-aos="fade-up">

    <div class="section-header">
      <h2>JOIN</h2>
      <p>What Role? <span></span></p>
    </div>
</div>
</section>
    <section id="why-us" class="why-us section-bg">
      <div class="container" data-aos="fade-up">




      
              <form action="./join" id="frm">
                <div class="jg">
              <div class="col-xs-6" data-aos="fade-up" data-aos-delay="200" id="btn1">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-person"></i>
                  <input type="radio" class="role" name="roleNum" value="2" id="rd1">
                  <h4>개인 회원가입</h4>
                  <p>-</p>
                </div>
              </div><!-- End Icon Box -->

              <div class="col-xs-6" data-aos="fade-up" data-aos-delay="300" id="btn2">
                <div class="icon-box d-flex flex-column justify-content-center align-items-center">
                  <i class="bi bi-box2-heart"></i>
                  <input type="radio" class="role" name="roleNum" value="1" id="rd2">
                  <h4>사업자 회원가입</h4>
                  <p>-</p>
                </div>
              </div><!-- End Icon Box -->
            </div>
            </form>
        
            
              </div>
              </section>

  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

</body>
<script src="/resources/JS/role.js"></script>
</html>