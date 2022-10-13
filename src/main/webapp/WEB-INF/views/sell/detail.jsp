<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>${sellItemDTO.itemName}</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  <!-- kakao Map -->
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e46b315f965ac58fabe9c3e350d385de&libraries=services"></script>

  <style>
    .crq{
        justify-content: center;
        text-align: center;
        margin-top: 20px;
      }
    
      .mainSection{
        display: flex;
        flex-direction: column;
        align-items: center;
        
      }

      .mainContents{
        display: flex;
        width: 80%;
      }  

      .outerBox{
          display: flex;
          justify-content: space-between;
          align-items:center;
          padding: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: gainsboro;
          border-radius: 10px;
        }

        .innerBox{
          display: flex;
          justify-content: space-between;
          align-items:center;
          padding: 10px;
          border-width: 1px;
          border-style: solid;
          border-color: gainsboro;
          border-radius: 10px;
        }

         .buttonBox{
          display:flex;
          justify-content: space-between;
          align-items:center;
          padding:10px;
          writing-mode: horizontal-tb;
        }

        .textAre{
          display: flex;
          flex-direction: column;
        }

        .modalC{
          display: flex;
          flex-direction: column;
        }
        .checked {
          color: orange;
        }
        
        #rvBtnFrmP{
          writing-mode: horizontal-tb;
        }

        .crqSection{
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        .item_container{
          display: flex;
          justify-content: center;
          margin-top: 30px;
        }

        .itemBox{
          padding: 5px;
          margin: 15px;
          border: 2px; 
          border-style: solid;
          border-color: #ec2727;
          border-radius: 10px;
          align-items: stretch; 
          justify-content: center; 
          flex-direction: column;
          width: 250px;
        }

        .titleBox{
          margin-top: 15px;
        }

        .imgSide{
          margin-bottom: 50px;
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        .imgTable{
          margin-top: 15px;
          margin-bottom: 15px;
          border: 5px solid transparent;
          border-radius: 20px;
          background-image: linear-gradient(#444444, #444444), linear-gradient(to right, #fbfcb9be, #ffcdcdaa, #ffa365aa);
          background-origin: border-box;
          background-clip: content-box, border-box;
          width: 80%;
          overflow: hidden;
        }



  </style>
</head>
<body>
<div>
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
</div>

<div align="right" style="width:80%; margin-top: 150px; margin-left: auto; margin-right: auto;">  
  <c:choose>
    <c:when test="${sessionScope.member.userId eq sellItemDTO.userId}">
     <a href="./update?itemNum=${sellItemDTO.itemNum}"><button class="btn btn-danger">수정</button></a>
     <a href="./delete?itemNum=${sellItemDTO.itemNum}"><button class="btn btn-danger" id="deleteItem">삭제</button></a>
     </c:when>
     <c:when test="${sessionScope.dto.roleNum =='0'}">
       <a href="./update?itemNum=${sellItemDTO.itemNum}"><button class="btn btn-danger">수정</button></a>
       <a href="./delete?itemNum=${sellItemDTO.itemNum}"><button class="btn btn-danger" id="deleteItem">삭제</button></a>
       </c:when> 
    <c:otherwise>
    </c:otherwise>
  </c:choose>
</div>


 <div>
  <!-- Button trigger modal -->
  <button type="button" id= "full" style="display: none;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">
    Launch demo modal
    </button>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <img src="" id="fullimage">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        </div>
        </div>
    </div>
    </div>
</div>



<!-- main contents -->
<form action="payments" method="post" id="rvFrm">
<section class="mainSection">
  <div class="mainContents row gy-1">
      <!-- image 영역 -->
      <div class="col-lg-6 col-md-6 d-flex">
        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width:100%; height:100%; display: block;">
            <div class="carousel-inner">
                <div class="carousel-item active">
                  <c:forEach items="${sellItemDTO.fileDTOs}" var="ar" end="0">
                                <img width="100%" height="100%" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
                  </c:forEach>  
                </div>  
                    <c:forEach items="${sellItemDTO.fileDTOs}" var="ar" begin="1">
                            <div class="carousel-item">
                                <img width="100%" height="100%" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
                            </div>
                    </c:forEach>  
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
      </div>
    <!-- text 영역 -->
    <div class="textAre col-lg-6 col-md-6 d-flex">
      <input type="hidden" id="itemNum" name="itemNum" value="${sellItemDTO.itemNum}">
      <input type="hidden" id="itemCatg" name="itemCatg" value="${sellItemDTO.itemCatg}">
      <input type="hidden" id="itemPrice" name="itemPrice" value="${sellItemDTO.itemPrice}">
      <input type="hidden" id="itemName" name="itemName" value="${sellItemDTO.itemName}">
      <input type="hidden" id="itemAddress" name="itemAddress" value="${sellItemDTO.itemAddress}">
      <input type="hidden" id="itemDeAddress" name="itemDeAddress" value="${sellItemDTO.itemDeAddress}">
      <input type="hidden" id="buyer_email" value="${sessionScope.member.email}">
      <input type="hidden" id="buyer_name" value="${sessionScope.member.userName}">
      <input type="hidden" id="buyer_tel" value="${sessionScope.member.phone}">
      <input type="hidden" id="userId" value="${sessionScope.member.userId}">

      <div>
        <table class="table table-striped">
          <tbody>
            <tr>
              <td>
                <i class="bi bi-shop"></i>
                ${sellItemDTO.userId}</td>
            </tr>
            <tr>
              <td><h1>${sellItemDTO.itemName}</h1></td>
            </tr>
            <tr>
              <td>
                <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>1일 이용 시</strong></span>
                <p style="margin-top: 3px;"><span>${sellItemDTO.itemPrice} 원</span></p></td>
            </tr>
            <tr>
              <td>
                <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>유의사항</strong></span>
                <p style="line-height: 2; text-align: justify;">
                  <span style="color: rgb(0, 0, 0);">
                  <strong><span style="letter-spacing: -0.5px;">☑&nbsp;</span></strong>
                  <span style="letter-spacing: -1px;">반려견 특성에 따라 교육 과정이 변경되거나 다를 수 있습니다.</span></span></p>
              </td>      
            </tr>
            <tr>
              <td>
                <span style="font-size: 15px; color: rgb(0, 0, 0);"><strong>환불규정</strong></span>
                <p style="line-height: 2; text-align: justify;">
                  <span style="color: rgb(0, 0, 0);">
                  <strong><span style="letter-spacing: -0.5px;">☑&nbsp;</span></strong>
                  <span style="letter-spacing: -1px;"> 예약 일자 3일 전까지 환불처리 가능합니다.</span></span></p>
              </td>      
            </tr>
            </tbody>
            </table>
      </div>
      <!-- modal start -->
      <div class="modalC"> 
            <div style="margin-bottom: 10px;">
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
                이용 약관 보기
              </button>
              <!-- Modal -->
                <div class="modal fade" id="modal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이용 약관</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                             제1조 목적<br>
                        <br>
                        본 이용약관은 “WALWAL”(이하 "사이트")의 서비스의 이용조건과 운영에 관한 제반 사항 규정을 목적으로 합니다.<br>
                        <br>
                        제2조 용어의 정의<br>
                        <br>
                        본 약관에서 사용되는 주요한 용어의 정의는 다음과 같습니다.<br>
                        <br>
                        ① 회원 : 사이트의 약관에 동의하고 개인정보를 제공하여 회원등록을 한 자로서, 사이트와의 이용계약을 체결하고 사이트를 이용하는 이용자를 말합니다.<br>
                        ② 이용계약 : 사이트 이용과 관련하여 사이트와 회원간에 체결 하는 계약을 말합니다.<br>
                        ③ 회원 아이디(이하 "ID") : 회원의 식별과 회원의 서비스 이용을 위하여 회원별로 부여하는 고유한 문자와 숫자의 조합을 말합니다.<br>
                        ④ 비밀번호 : 회원이 부여받은 ID와 일치된 회원임을 확인하고 회원의 권익 보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.<br>
                        ⑤ 운영자 : 서비스에 홈페이지를 개설하여 운영하는 운영자를 말합니다.<br>
                        ⑥ 해지 : 회원이 이용계약을 해약하는 것을 말합니다.<br>
                        <br>
                        제3조 약관 외 준칙<br>
                        <br>
                        운영자는 필요한 경우 별도로 운영정책을 공지 안내할 수 있으며, 본 약관과 운영정책이 중첩될 경우 운영정책이 우선 적용됩니다.<br>
                        <br>
                        제4조 이용계약 체결<br>
                        <br>
                        ① 이용계약은 회원으로 등록하여 사이트를 이용하려는 자의 본 약관 내용에 대한 동의와 가입신청에 대하여 운영자의 이용승낙으로 성립합니다.<br>
                        ② 회원으로 등록하여 서비스를 이용하려는 자는 사이트 가입신청 시 본 약관을 읽고 아래에 있는 "동의합니다"를 선택하는 것으로 본 약관에 대한 동의 의사 표시를 합니다.<br>
                        <br>
                        제5조 서비스 이용 신청<br>
                        <br>
                        ① 회원으로 등록하여 사이트를 이용하려는 이용자는 사이트에서 요청하는 제반정보(이용자ID,비밀번호, 닉네임 등)를 제공해야 합니다.<br>
                        ② 타인의 정보를 도용하거나 허위의 정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 사이트 이용과 관련하여 아무런 권리를 주장할 수 없으며, 관계 법령에 따라 처벌받을 수 있습니다.<br>
                        <br>
                        제6조 개인정보처리방침<br>
                        <br>
                        사이트 및 운영자는 회원가입 시 제공한 개인정보 중 비밀번호를 가지고 있지 않으며 이와 관련된 부분은 사이트의 개인정보처리방침을 따릅니다.<br>
                        운영자는 관계 법령이 정하는 바에 따라 회원등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다.<br>
                        <br>
                        회원의 개인정보보호에 관하여 관계법령 및 사이트가 정하는 개인정보처리방침에 정한 바에 따릅니다.<br>
                        <br>
                        단, 회원의 귀책 사유로 인해 노출된 정보에 대해 운영자는 일체의 책임을 지지 않습니다.<br>
                        운영자는 회원이 미풍양속에 저해되거나 국가안보에 위배되는 게시물 등 위법한 게시물을 등록 · 배포할 경우 관련 기관의 요청이 있을 시 회원의 자료를 열람 및 해당 자료를 관련 기관에 제출할 수 있습니다.<br>
                        <br>
                        제7조 운영자의 의무<br>
                        <br>
                        ① 운영자는 이용회원으로부터 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 가급적 빨리 처리하여야 합니다. 다만, 개인적인 사정으로 신속한 처리가 곤란한 경우에는 사후에 공지 또는 이용회원에게 쪽지, 전자우편 등을 보내는 등 최선을 다합니다.<br>
                        ② 운영자는 계속적이고 안정적인 사이트 제공을 위하여 설비에 장애가 생기거나 유실된 때에는 이를 지체 없이 수리 또는 복구할 수 있도록 사이트에 요구할 수 있습니다. 다만, 천재지변 또는 사이트나 운영자에 부득이한 사유가 있는 경우, 사이트 운영을 일시 정지할 수 있습니다.<br>
                        <br>
                        제8조 회원의 의무<br>
                        <br>
                        ① 회원은 본 약관에서 규정하는 사항과 운영자가 정한 제반 규정, 공지사항 및 운영정책 등 사이트가 공지하는 사항 및 관계 법령을 준수하여야 하며, 기타 사이트의 업무에 방해가 되는 행위, 사이트의 명예를 손상하는 행위를 해서는 안 됩니다.<br>
                        ② 회원은 사이트의 명시적 동의가 없는 한 서비스의 이용 권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br>
                        ③ 이용고객은 아이디 및 비밀번호 관리에 상당한 주의를 기울여야 하며, 운영자나 사이트의 동의 없이 제3자에게 아이디를 제공하여 이용하게 할 수 없습니다.<br>
                        ④ 회원은 운영자와 사이트 및 제3자의 지적 재산권을 침해해서는 안 됩니다.<br>
                        <br>
                        제9조 서비스 이용 시간<br>
                        <br>
                        ① 서비스 이용 시간은 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 단, 사이트는 시스템 정기점검, 증설 및 교체를 위해 사이트가 정한 날이나 시간에 서비스를 일시중단 할 수 있으며 예정된 작업으로 인한 서비스 일시 중단은 사이트의 홈페이지에 사전에 공지하오니 수시로 참고하시길 바랍니다.<br>
                        ② 단, 사이트는 다음 경우에 대하여 사전 공지나 예고 없이 서비스를 일시적 혹은 영구적으로 중단할 수 있습니다.<br>
                        - 긴급한 시스템 점검, 증설, 교체, 고장 혹은 오동작을 일으키는 경우<br>
                        - 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우<br>
                        - 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지한 경우<br>
                        - 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>
                        ③ 전항에 의한 서비스 중단의 경우 사이트는 사전에 공지사항 등을 통하여 회원에게 통지합니다. 단, 사이트가 통제할 수 없는 사유로 발생한 서비스의 중단에 대하여 사전공지가 불가능한 경우에는 사후공지로 대신합니다.<br>
                        <br>
                        제10조 서비스 이용 해지<br>
                        <br>
                        ① 회원이 사이트와의 이용계약을 해지하고자 하는 경우에는 회원 본인이 온라인을 통하여 등록해지 신청을 하여야 합니다. 한편, 사이트 이용 해지와 별개로 사이트에 대한 이용계약 해지는 별도로 하셔야 합니다.<br>
                        ② 해지 신청과 동시에 사이트가 제공하는 사이트 관련 프로그램이 회원 관리 화면에서 자동적으로 삭제됨으로 운영자는 더 이상 해지신청자의 정보를 볼 수 없습니다.<br>
                        <br>
                        제11조 서비스 이용 제한<br>
                        <br>
                        회원은 다음 각호에 해당하는 행위를 하여서는 아니 되며 해당 행위를 한 경우에 사이트는 회원의 서비스 이용 제한 및 적법한 조치를 할 수 있으며 이용계약을 해지하거나 기간을 정하여 서비스를 중지할 수 있습니다.<br>
                        ① 회원 가입시 혹은 가입 후 정보 변경 시 허위 내용을 등록하는 행위<br>
                        ② 타인의 사이트 이용을 방해하거나 정보를 도용하는 행위<br>
                        ③ 사이트의 운영진, 직원 또는 관계자를 사칭하는 행위<br>
                        ④ 사이트, 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위<br>
                        ⑤ 다른 회원의 ID를 부정하게 사용하는 행위<br>
                        ⑥ 다른 회원에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위<br>
                        ⑦ 범죄와 결부된다고 객관적으로 판단되는 행위<br>
                        ⑧ 기타 관련 법령에 위배되는 행위<br>
                        <br>
                        제12조 게시물의 관리<br>
                        <br>
                        ① 사이트의 게시물과 자료의 관리 및 운영의 책임은 운영자에게 있습니다. 운영자는 항상 불량 게시물 및 자료에 대하여 모니터링을 하여야 하며, 불량 게시물 및 자료를 발견하거나 신고를 받으면 해당 게시물 및 자료를 삭제하고 이를 등록한 회원에게 주의를 주어야 합니다.<br>
                        한편, 이용회원이 올린 게시물에 대해서는 게시자 본인에게 책임이 있으니 회원 스스로 본 이용약관에서 위배되는 게시물은 게재해서는 안 됩니다.<br>
                        ② 정보통신윤리위원회 등 공공기관의 시정요구가 있는 경우 운영자는 회원의 사전동의 없이 게시물을 삭제하거나 이동 할 수 있습니다.<br>
                        ③ 불량게시물의 판단기준은 다음과 같습니다.<br>
                        - 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상하는 내용인 경우<br>
                        - 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크 시키는 경우<br>
                        - 불법 복제 또는 해킹을 조장하는 내용인 경우<br>
                        - 영리를 목적으로 하는 광고일 경우<br>
                        - 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
                        - 다른 이용자 또는 제3자와 저작권 등 기타 권리를 침해하는 경우<br>
                        - 기타 관계 법령에 위배된다고 판단되는 경우<br>
                        ④ 사이트 및 운영자는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 이를 임시로 게시 중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관련 기관의 결정 등이 이루어져 사이트에 접수된 경우 이에 따릅니다.<br>
                        <br>
                        제13조 게시물의 보관<br>
                        <br>
                        사이트 운영자가 불가피한 사정으로 본 사이트를 중단하게 될 경우, 회원에게 사전 공지를 하고 게시물의 이전이 쉽도록 모든 조치를 하기 위해 노력합니다.<br>
                        <br>
                        제14조 게시물에 대한 저작권<br>
                        <br>
                        ① 회원이 사이트 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 사이트는 게시자의 동의 없이 게시물을 상업적으로 이용할 수 없습니다. 다만 비영리 목적인 경우는 그러하지 아니하며, 또한 서비스 내의 게재권을 갖습니다.<br>
                        ② 회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.<br>
                        ③ 운영자는 회원이 게시하거나 등록하는 사이트 내의 내용물, 게시 내용에 대해 제12조 각호에 해당한다고 판단되는 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부할 수 있습니다.<br>
                        <br>
                        제15조 손해배상<br>
                        <br>
                        ① 본 사이트의 발생한 모든 민, 형법상 책임은 회원 본인에게 1차적으로 있습니다.<br>
                        ② 본 사이트로부터 회원이 받은 손해가 천재지변 등 불가항력적이거나 회원의 고의 또는 과실로 인하여 발생한 때에는 손해배상을 하지 않습니다.<br>
                        <br>
                        제16조 면책<br>
                        <br>
                        ① 운영자는 회원이 사이트의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
                        ② 운영자는 본 사이트의 서비스 기반 및 타 통신업자가 제공하는 전기통신 서비스의 장애로 인한 경우에는 책임이 면제되며 본 사이트의 서비스 기반과 관련되어 발생한 손해에 대해서는 사이트의 이용약관에 준합니다<br>
                        ③ 운영자는 회원이 저장, 게시 또는 전송한 자료와 관련하여 일체의 책임을 지지 않습니다.<br>
                        ④ 운영자는 회원의 귀책 사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임지지 아니합니다.<br>
                        ⑤ 운영자는 회원 상호 간 또는 회원과 제3자 상호 간, 기타 회원의 본 서비스 내외를 불문한 일체의 활동(데이터 전송, 기타 커뮤니티 활동 포함)에 대하여 책임을 지지 않습니다.<br>
                        ⑥ 운영자는 회원이 게시 또는 전송한 자료 및 본 사이트로 회원이 제공받을 수 있는 모든 자료들의 진위, 신뢰도, 정확성 등 그 내용에 대해서는 책임지지 아니합니다.<br>
                        ⑦ 운영자는 회원 상호 간 또는 회원과 제3자 상호 간에 서비스를 매개로 하여 물품거래 등을 한 경우에 그로부터 발생하는 일체의 손해에 대하여 책임지지 아니합니다.<br>
                        ⑧ 운영자는 운영자의 귀책 사유 없이 회원간 또는 회원과 제3자간에 발생한 일체의 분쟁에 대하여 책임지지 아니합니다.<br>
                        ⑨ 운영자는 서버 등 설비의 관리, 점검, 보수, 교체 과정 또는 소프트웨어의 운용 과정에서 고의 또는 고의에 준하는 중대한 과실 없이 발생할 수 있는 시스템의 장애, 제3자의 공격으로 인한 시스템의 장애, 국내외의 저명한 연구기관이나 보안 관련 업체에 의해 대응 방법이 개발되지 아니한 컴퓨터 바이러스 등의 유포나 기타 운영자가 통제할 수 없는 불가항력적 사유로 인한 회원의 손해에 대하여 책임지지 않습니다.<br>
                        <br>
                        부칙<br>
                        <br>
                        이 약관은 &lt;사이트 개설일&gt;부터 시행합니다.
                      </div>
                    </div>
                  </div>
                </div> 
            </div>
                <div>
                   <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal2">
                      개인정보처리방침 보기
                    </button>
                  <!-- Modal -->
                    <div class="modal fade" id="modal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">개인정보처리방침</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            (주)WALWAL(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보 주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립, 공개합니다.<br>
                          <br>
                          <strong>제1조 (개인정보의 처리목적)</strong><br>
                          회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br>
                          <br>
                          1. 홈페이지 회원 가입 및 관리<br>
                          회원 가입 의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만 아동의 개인정보처리 시 법정대리인의 동의 여부 확인, 각종 고지․통지, 고충 처리 등을 목적으로 개인정보를 처리합니다.<br>
                          <br>
                          2. 재화 또는 서비스 제공<br>
                          물품 배송, 서비스 제공, 계약서 및 청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금 결제 및 정산, 채권추심 등을 목적으로 개인정보를 처리합니다.<br>
                          <br>
                          3. 고충 처리<br>
                          민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리 결과 통보 등의 목적으로 개인정보를 처리합니다.<br>
                          <br>
                          <strong>제2조 (개인정보의 처리 및 보유기간)</strong><br>
                          ① 회사는 법령에 따른 개인정보 보유, 이용 기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용 기간 내에서 개인정보를 처리, 보유합니다.<br>
                          ② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>
                          <br>
                          1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴 시까지<br>
                          다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료 시까지<br>
                          1) 관계 법령 위반에 따른 수사, 조사 등이 진행 중인 경우에는 해당 수사, 조사 종료 시까지<br>
                          2) 홈페이지 이용에 따른 채권 및 채무관계 잔존 시에는 해당 채권, 채무 관계 정산 시까지<br>
                          <br>
                          <!-- 쇼핑몰 또는 예약 결제를 받지 않는다면 삭제 --><br>
                          2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료 시까지<br>
                          다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료 시까지<br>
                          1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록<br>
                          - 표시․광고에 관한 기록 : 6월<br>
                          - 계약 또는 청약 철회, 대금결제, 재화 등의 공급기록 : 5년<br>
                          - 소비자 불만 또는 분쟁 처리에 관한 기록 : 3년<br>
                          2) 「통신비밀보호법」 제41조에 따른 통신사실확인자료 보관<br>
                          - 가입자 전기통신일시, 개시․종료 시간, 상대방 가입자 번호, 사용도수, 발신기지국 위치추적자료 : 1년<br>
                          - 컴퓨터 통신, 인터넷 로그 기록자료, 접속지 추적자료 : 3개월<br>
                          <br>
                          <!-- 수정 필요. 개인정보 제3자 제공 사용하지 않는다면 삭제 --><br>
                          <strong>제3조 (개인정보의 제3자 제공)</strong><br>
                          ① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
                          ② 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>
                          - 개인정보를 제공받는 자 : &lt;예) (주) OOO 카드&gt;<br>
                          - 제공받는 자의 개인정보 이용목적 : &lt;예) 이벤트 공동개최 등 업무제휴 및 제휴 신용카드 발급&gt;<br>
                          - 제공하는 개인정보 항목 : &lt;예) 성명, 주소, 전화번호, 이메일주소, 카드결제계좌정보&gt;<br>
                          - 제공받는 자의 보유, 이용기간 : &lt;예) 신용카드 발급계약에 따른 거래기간동안&gt;<br>
                          <br>
                          <!-- 수정 필요. 개인정보처리 위탁 사용하지 않는다면 삭제 --><br>
                          <strong>제4조(개인정보처리의 위탁)</strong><br>
                          ① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br>
                          <br>
                          1. 전화 상담 센터 운영<br>
                          - 위탁받는 자 (수탁자) : OOO CS센터<br>
                          - 위탁하는 업무의 내용 : 전화상담 응대, 부서 및 직원 안내 등<br>
                          <br>
                          2. A/S 센터 운영<br>
                          - 위탁받는 자 (수탁자) : OOO 전자<br>
                          - 위탁하는 업무의 내용 : 고객 대상 제품 A/S 제공<br>
                          <br>
                          ② 회사는 위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br>
                          ③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br>
                          <br>
                          <strong>제5조(이용자 및 법정대리인의 권리와 그 행사 방법)</strong><br>
                          <br>
                          ① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br>
                          1. 개인정보 열람 요구<br>
                          2. 오류 등이 있을 경우 정정 요구<br>
                          3. 삭제요구<br>
                          4. 처리정지 요구<br>
                          ② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.<br>
                          ③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br>
                          ④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>
                          ⑤ 정보주체는 개인정보 보호법 등 관계 법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니 됩니다.<br>
                          <br>
                          <!-- 사이트 운영 환경에 맞게 1항, 2항 수정 필요 --><br>
                          <strong>제6조(처리하는 개인정보 항목)</strong><br>
                          회사는 다음의 개인정보 항목을 처리하고 있습니다.<br>
                          <br>
                          1. 홈페이지 회원 가입 및 관리<br>
                          필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호&gt;<br>
                          선택항목 : &lt;예) 결혼 여부, 관심 분야&gt;<br>
                          <br>
                          2. 재화 또는 서비스 제공<br>
                          필수항목 : &lt;예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보 등 결제정보&gt;<br>
                          선택항목 : &lt;관심분야, 과거 구매내역&gt;<br>
                          <br>
                          3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.<br>
                          IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등<br>
                          <br>
                          <strong>제7조(개인정보의 파기)</strong><br>
                          ① 회사는 개인정보 보유 기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br>
                          ② 정보주체로부터 동의받은 개인정보 보유 기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>
                          ③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>
                          1. 파기 절차<br>
                          회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>
                          2. 파기 방법<br>
                          회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.<br>
                          <br>
                          <strong>제8조(개인정보의 안전성 확보조치)</strong><br>
                          회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 하고 있습니다.<br>
                          1. 관리적 조치 : 내부관리계획 수립 및 시행, 정기적 직원 교육 등<br>
                          2. 기술적 조치 : 개인정보처리시스템 등의 접근 권한 관리, 접근통제시스템 설치, 고유 식별정보<br>
                          등의 암호화, 보안프로그램 설치<br>
                          3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제<br>
                          <br>
                          <strong>제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)</strong><br>
                          ① 회사는 이용자에게 개별적인 맞춤 서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br>
                          ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에 보내는 소량의 정보이며 이용자들의 컴퓨터 내의 하드디스크에 저장되기도 합니다.<br>
                          가. 쿠키의 사용 목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>
                          나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>
                          다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br>
                          <br>
                          <!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
                          <strong>제10조(개인정보 보호책임자)</strong><br>
                          ① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만 처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>
                          <br>
                          ▶ 개인정보 보호책임자<br>
                          성명 : OOO<br>
                          직책 : OOO<br>
                          연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                          ※ 개인정보 보호 담당부서로 연결됩니다.<br>
                          <br>
                          ▶ 개인정보 보호 담당부서<br>
                          부서명 : OOO 팀<br>
                          담당자 : OOO<br>
                          연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                          <br>
                          ② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만 처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.<br>
                          <br>
                          <!-- 사이트 운영 환경에 맞게 수정 필요 --><br>
                          <strong>제11조(개인정보 열람청구)</strong><br>
                          정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람 청구가 신속하게 처리되도록 노력하겠습니다.<br>
                          <br>
                          ▶ 개인정보 열람청구 접수․처리 부서<br>
                          부서명 : OOO<br>
                          담당자 : OOO<br>
                          연락처 : &lt;전화번호&gt;, &lt;이메일&gt;, &lt;팩스번호&gt;<br>
                          <br>
                          <strong>제12조(권익침해 구제 방법)</strong><br>
                          정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.<br>
                          <br>
                          ▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)<br>
                          - 소관 업무 : 개인정보 침해사실 신고, 상담 신청<br>
                          - 홈페이지 : privacy.kisa.or.kr<br>
                          - 전화 : (국번없이) 118<br>
                          - 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터<br>
                          <br>
                          ▶ 개인정보 분쟁조정위원회<br>
                          - 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br>
                          - 홈페이지 : www.kopico.go.kr<br>
                          - 전화 : (국번없이) 1833-6972<br>
                          - 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층<br>
                          <br>
                          ▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)<br>
                          ▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)<br>
                          <br>
                          <!-- 사이트 오픈일에 맞게 수정 필요 --><br>
                          <strong>제13조(개인정보 처리방침 시행 및 변경)</strong><br>
                          이 개인정보 처리방침은 20XX. X. X부터 적용됩니다.
                        </div>
                        </div>
                      </div>
                    </div> 
                </div>
      </div>
               <!-- modal end -->
      </div>
  </div>

<!-- main contents end -->


<!-- reservation section -->
        <div style="width: 80%; margin-top: 50px;">
          <div class="block-32 aos-init aos-animate" data-aos="fade-up" data-aos-offset="-200">
                <div class="outerBox">
                    <div>
                      <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="icon-calendar"></span></div>
                        <input type="date" id="revStartDate" name="revStartDate" class="form-control">
                      </div>
                    </div>
                    <div>
                      <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                      <div class="field-icon-wrap">
                        <div class="icon"><span class="icon-calendar"></span></div>
                        <input type="date" id="revEndDate" name="revEndDate" class="form-control">
                      </div>
                    </div>
                    <div>
                      <div class="row">
                          <label for="adults" class="font-weight-bold text-black">Adults</label>
                          <div class="field-icon-wrap">
                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                            <select id="adultsCount" name="adultsCount" class="form-control">
                              <option value="" selected>-- 인원 수 선택 --</option>
                              <option value="0">1</option>
                              <option value="1">2</option>
                              <option value="2">3</option>
                              <option value="3">4</option>
                            </select>
                          </div>
                      </div>
                    </div>  
                    <div>
                        <div class="row">
                          <label for="Dog" class="font-weight-bold text-black">Dog</label>
                          <div class="field-icon-wrap">
                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                            <select id="dogCount" name="dogCount" class="form-control">
                              <option value="" selected>-- 반려견 수 선택 --</option>
                              <option value="0">1</option>
                              <option value="1">2</option>
                              <option value="2">3</option>
                              <option value="3">4</option>
                            </select>
                          </div>
                        </div>
                    </div>
                    <div>
                      <label for="priceCount" class="font-weight-bold text-black"></label>
                      <div class="field-icon-wrap">
                        <input type="button" id="priceCount" class="btn btn-outline-danger" value="예상 금액 계산">
                      </div>
                    </div>
                </div>
          </div>
        </div>

      <div style="width: 80%; margin-top: 20px;">
          <div class="innerBox">
            <div>
              <label for="priceCount" class="font-weight-bold text-black">예상 금액 확인</label>
              <div class="field-icon-wrap">
                <input type="text" id="totalPrice" readonly class="form-control" value="0">
              </div>
              <c:catch>
              <c:if test="${sessionScope.member ne null}">
              <label for="contents" class="form-label">적용할 쿠폰</label>
              <select class="form-select" id="coupon" name ="couponNum">
                <option value="">선택</option>
                <c:forEach items="${couponList}" var="coupon">
                  <c:choose>
                    <c:when test="${coupon.discountMethod eq '0'}">
                      <option value="${coupon.discountRate}|${coupon.couponNum}|${coupon.discountMethod}"> 쿠폰명 : ${coupon.couponName} ( 할인율 : ${coupon.discountRate} % )</option>
                    </c:when>
                    <c:otherwise>
                      <option value="${coupon.discountPrice}|${coupon.couponNum}|${coupon.discountMethod}"> 쿠폰명 : ${coupon.couponName} ( 할인금액 : ${coupon.discountPrice} 원 )</option>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
              </select>
              </c:if>
              </c:catch>
            </div>
            <div>
            	<button type="button" style="margin-top: 90px; width: 8%; height: 5%; border: 1px solid black; background-color:white; border-radius: 10px; margin-right: 300px;">
            		<c:choose>
            			<c:when test="${ not empty shopcart }">
            				<img src="/resources/images/trolley.png" id="btnShopCartDelete" style="cursor: pointer; width: 70%;" data-item-num="${sellItemDTO.itemNum}" data-id="${member.userId}">
            			</c:when>
            			<c:when test="${empty shopcart and not empty member }">
            				<img src="/resources/images/shopping-cart.png" id="btnShopCartAdd" style="cursor: pointer; width: 70%;" data-item-num="${sellItemDTO.itemNum}">
            			</c:when>
            			<c:when test="${empty member }">
            				<img src="/resources/images/shopping-cart.png" id="btnShopCartFalse" style="cursor: pointer; width: 70%;" data-item-num="${sellItemDTO.itemNum}">
            			</c:when>
            		</c:choose>
            	</button>
            </div>
            <div>
                <!-- Button trigger modal -->
                  <button type="button" class="btn btn-outline-danger" id="rvBtnFrm">
                    예약/결제
                  </button>
            </div>
          </div>  
      </div>  
  </div>
  </section>
</form>    
      <!-- reservation section end -->
<c:if test="${not empty member.userId }">
<div style="text-align: center;">
  <a href="./reviewadd?itemNum=${sellItemDTO.itemNum}&userId=${member.userId}"><button type="button" style="display: inline-block; margin-right: 30px;" class="btn btn-outline-primary">리뷰쓰기</button></a>
  <a href="./sellqnaadd?itemNum=${sellItemDTO.itemNum}&userId=${member.userId}"><button type="button" style="display: inline-block; margin-left: 30px;" class="btn btn-outline-primary">문의쓰기</button></a>
</div>  
</c:if>
      <!-- contents, review, qna -->
      <section class="crqSection">
        
      <div>
        <!-- Button trigger modal -->
        <button type="button" id= "up" style="display:none" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">
          Launch demo modal
          </button>
      
          <!-- Modal -->
          <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel2">댓글 수정</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <input type="hidden" id="rvcNum" value="">
                <input type="hidden" id="rvNum" value="">
                <input type="hidden" id="rvcWriter" value="">
                <textarea class="form-control" id="rvcContents"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >취소</button>
                 <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="btnCheck">수정</button>
              </div>
              </div>
          </div>
          </div>
      </div>
  <div class="crq" style="width: 80%; margin-top: 50px;">
    <ul class="nav nav-tabs nav-fill" role="tablist">
        <li class="nav-item" role="presentation" style="width: 30%;">
          <a class="nav-link active" data-bs-toggle="tab" href="#iContents" aria-selected="true" role="tab">상세 설명</a>
        </li>
        <li class="nav-item" role="presentation" style="width: 30%;">
          <a class="nav-link" data-bs-toggle="tab" href="#rv" id="reviewCheck" onclick="reviewList(); this.onclick=null;" data-item-num="${sellItemDTO.itemNum}" aria-selected="false" role="tab" tabindex="-1">리뷰</a>
        </li>
        <li class="nav-item" role="presentation" style="width: 30%;">
          <a class="nav-link" data-bs-toggle="tab" href="#q" id="qnaCheck" onclick="qnaList(); this.onclick=null;" data-item-num2="${sellItemDTO.itemNum}" aria-selected="false" role="tab" tabindex="-1">문의</a>
        </li>
      </ul>
      <div id="myTabContent" class="tab-content">
        <!-- iContents Tab -->
        <div class="tab-pane fade show active" id="iContents" role="tabpanel">
          <br>
          <button style="display: none;"></button>
          
          <div style="white-space: pre-line;">
            <c:out value="${sellItemDTO.itemContents}"/>
          </div>

          <!-- purchase Table start -->
          <div class="purchaseTable" style="margin-top: 30px;">
            <div class="table-responsive">
              <table class="noBorder _table_responsive table" style="width: 100%;">
                <tbody>
                  <tr style="border-bottom:1px solid #ec2727;">
                    <td style="width: 16.6667%; text-align: center; padding: 17px;">
                    <span style="color: rgb(0, 0, 0);">
                      <strong>
                        <span style="border-color: #ec2727; padding: 12px 20px 10px; border-radius: 100px; border-width: 2px; border-style: solid; font-size: 16px;">&nbsp; &nbsp; &nbsp; &nbsp; 분류&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></strong></span>
                      </td>
                      <td style="width: 34.0295%; text-align: center; padding: 17px;">
                        <span style="color: rgb(0, 0, 0);">
                          <strong>
                            <span style="border-color: #ec2727; padding: 12px 20px 10px; border-radius: 100px; border-width: 2px; border-style: solid; font-size: 16px;">
                              <strong>&nbsp; &nbsp; &nbsp; 이용료&nbsp; &nbsp; &nbsp;&nbsp;</strong></span></strong></span>
                      </td>
                      <td style="width: 33.4152%; text-align: center; padding: 17px;">
                        <span style="color: rgb(0, 0, 0);">
                          <strong>
                            <span style="border-color: #ec2727; padding: 12px 20px 10px; border-radius: 100px; border-width: 2px; border-style: solid; font-size: 16px;">&nbsp; &nbsp; &nbsp; &nbsp; 비고&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>
                          </strong>
                        </span>
                      </td>
                  </tr>
                  <tr style="border-bottom:1px solid #ccc;">
                    <td style="width: 32.5553%; text-align: center; vertical-align: middle; display: table-cell;">
                      <strong>
                        <span style="color: rgb(0, 0, 0); font-size: 16px;">기본 요금(1일)</span></strong>
                    </td>
                    <td style="width: 34.0295%; text-align: center; vertical-align: middle; display: table-cell;">${sellItemDTO.itemPrice} 원</td>
                    <td style="width: 33.4152%; text-align: center;">추가 이용 시<br>추가 요금 발생</td>
                  </tr>
                  <tr style="border-bottom:1px solid #ccc;">
                    <td style="width: 32.5553%; text-align: center; vertical-align: middle; display: table-cell;">
                      <strong>
                        <span style="color: rgb(0, 0, 0); font-size: 16px;">인원 수</span></strong>
                    </td>
                    <td style="width: 34.0295%; text-align: center;">추가 인원당<br>10000원 추가<br>
                    </td>
                    <td style="width: 33.4152%; text-align: center; vertical-align: middle; display: table-cell;">최대 4명까지 가능
                    </td>
                  </tr>
                  <tr style="border-bottom:1px solid #ccc;">
                    <td style="width: 32.5553%; text-align: center; vertical-align: middle; display: table-cell;">
                      <strong>
                        <span style="color: rgb(0, 0, 0); font-size: 16px;">반려견 수</span></strong>
                    </td>
                      <td style="width: 34.0295%; text-align: center;">추가 마리당<br>10000원 추가<br>
                      </td>
                      <td style="width: 33.4152%; text-align: center; vertical-align: middle; display: table-cell;">최대 4마리까지 가능
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>      
          </div>  
          <!-- purchase Table end -->
         
         <!-- contents Side -->
          <div>
            <main style="width: 100%; display: flex; flex-direction: column; margin-bottom: 50px;">
            <div style="border-width: 0px 0px 2px 0px; border-style: solid; border-color: #ec2727; margin-top: 40px;">
              <p style="text-align: center; line-height: 1.15;">
                <strong><span style="font-size: 30px;">${sellItemDTO.itemName}</span></strong>
                <strong><span style="font-size: 30px;">소개 :D</span></strong></p>
              </div>
            <c:choose>
              <%-- hotelling --%>
              <c:when test="${sellItemDTO.itemCatg eq 1}">
                <div class="item_container" style="margin-top: 30px;">
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-building"></i> 넉넉한 넓이의 실내 공간</span></h4>
                        <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 답답한 실내공간이 아닌<br> 넓은 공간에서 <br>놀이 및 배변활동 가능</span></h8>
                        <p><br></p>
                    </div>
                  </div>  
                  <div class="itemBox">
                      <div class="titleBox">
                        <h4><span style="letter-spacing:-1px;"><i class="bi bi-building"></i> 데일리 수의사 회진</span></h4>
                          <p><br></p>
                      </div>
                      <div class="contentsBox">
                        <h8><span style="letter-spacing:-1px;">• 데일리 수의사 회진으로<br> 아이 상태도<br> 꼼꼼하게 체크!</span></h8>
                          <p><br></p>
                      </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-building"></i> 24시간 전문가 상주</span></h4>
                          <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 24시간 전문가 상주를<br> 통한 밀착 안심케어</h8>
                        <p><br></p>
                    </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-building"></i> 안전한 산책 공간</span></h4>
                      <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 안전한 산책 공간을<br> 활용한 <br>야외 배변 활동</h8>
                        <p><br></p>
                  </div>  
                  </div>
                </div>                 
              </c:when>
              <%-- oneday --%>
              <c:when test="${sellItemDTO.itemCatg eq 2}">
                <div class="item_container" style="margin-top: 30px;">
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-pencil-square"></i> 쿠킹 클래스</span></h4>
                        <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 전문가와 함께 하는<br> 반려견 수제간식 쿠킹 클래스!</span></h8>
                        <p><br></p>
                    </div>
                  </div>  
                  <div class="itemBox">
                      <div class="titleBox">
                        <h4><span style="letter-spacing:-1px;"><i class="bi bi-pencil-square"></i> 미용 클래스</span></h4>
                          <p><br></p>
                      </div>
                      <div class="contentsBox">
                        <h8><span style="letter-spacing:-1px;">• 스포팅, 가위컷, 전신클리핑 등<br> 반려견 특성에 맞는 미용</span></h8>
                          <p><br></p>
                      </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-pencil-square"></i> 스파 클래스</span></h4>
                          <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 피부/헤어의 특성을<br> 고려하여 진행</h8>
                        <p><br></p>
                    </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-pencil-square"></i> 최고의 교육 전문가</span></h4>
                      <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 시작부터 끝까지,<br> 교육전문가가 집중 전담 마크하여<br> 보호자의 올바른 학습방향을 
                        <br> 이끕니다.</h8>
                        <p><br></p>
                  </div>  
                  </div>
                </div>                 
              </c:when>
              <%-- training --%>
              <c:when test="${sellItemDTO.itemCatg eq 3}">
                <div class="item_container" style="margin-top: 30px;">
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-controller"></i> 넓은 실내운동장</span></h4>
                        <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 날씨 상관없이 <br>마음껏 뛰어 놀 수 있는 <br>100평 규모의
                        <br>넓은 실내운동장</span></h8>
                        <p><br></p>
                    </div>
                  </div>  
                  <div class="itemBox">
                      <div class="titleBox">
                        <h4><span style="letter-spacing:-1px;"><i class="bi bi-controller"></i> 보호자와 함께</span></h4>
                          <p><br></p>
                      </div>
                      <div class="contentsBox">
                        <h8><span style="letter-spacing:-1px;">• 보호자와 함께 <br>다양한 놀거리로<br> 재미와 추억을 <br>만들 수
                          있어요.</span></h8>
                          <p><br></p>
                      </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-controller"></i> 특수 바닥재</span></h4>
                          <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 반려견의 건강을 생각한 <br>특수 바닥재로 <br>미끄러움 걱정이
                        <br>없어요.</h8>
                        <p><br></p>
                    </div>  
                  </div>
                  <div class="itemBox">
                    <div class="titleBox">
                      <h4><span style="letter-spacing:-1px;"><i class="bi bi-controller"></i> 전문 교육가 상주</span></h4>
                      <p><br></p>
                    </div>
                    <div class="contentsBox">
                      <h8><span style="letter-spacing:-1px;">• 교육 전문가가 상주해 <br>안전하고 유익한 <br>놀이 환경
                        제공해요!</h8>
                        <p><br></p>
                  </div>  
                  </div>
                </div>                 
              </c:when>
            </c:choose>  	
            </main>  
          </div>
          <!-- contents end -->

          <!-- image Side -->
          <div class="imgSide">
            <div style="border-width: 0px 0px 2px 0px; border-style: solid; border-color: #ec2727; margin-top: 40px; margin-bottom: 40px; width: 100%;">
              <p style="text-align: center; line-height: 1.15;">
                <strong><span style="font-size: 30px;">${sellItemDTO.itemName}</span></strong>
                <strong><span style="font-size: 30px;">사진 :D</span></strong></p>
            </div>	
            <c:forEach items="${sellItemDTO.fileDTOs}" var="ar">
              <div class="imgTable">
                <img width="100%" height="100%" src="../resources/upload/sellfile/${ar.fileName}" class="d-block w-100" alt="...">
              </div>
            </c:forEach>
          </div>
          <!-- image end -->
          <!-- map Side -->
          <div style="border-width: 0px 0px 2px 0px; border-style: solid; border-color: #ec2727; margin-top: 40px; margin-bottom: 40px;">
            <p style="text-align: center; line-height: 1.15;">
              <strong><span style="font-size: 30px;">${sellItemDTO.itemName}</span></strong>
              <strong><span style="font-size: 30px;"> 위치 :D</span></strong></p>
          </div>	
          <div id="map" style="width:100%; height:500px; margin-bottom: 30px;">
          </div>
          <!-- map end -->
        </div>    
        <!-- iContents Tab end -->
      <div class="tab-pane fade" role="tabpanel" id="rv">
      <table class="table" id="review">
        
      </table>
      <button id="more" class="btn btn-outline-dark" style="display: none;">더보기</button>
    </div>
  </div>
  	<div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade" id="q" role="tabpanel">
    	<table class="table" id="qna">
      		<th class="th2" style="display: none;" >작성자</th>
      		<th class="th2" style="display: none;" >제목</th>
      		<th class="th2" style="display: none;" >내용</th>
    	</table>
    <button id="moreqna" class="btn btn-outline-dark" style="display: none;">더보기</button>
    </div>
   </div>
  </div>
  </div>
</section>

<section >
  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->
</section>

   <!-- script start -->

<!-- kakao 길 찾기 -->
<script src="/resources/JS/map/map.js"></script>
<script>
  mapMaker();
</script>
  <!--모달 부트스트랩-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  <!-- 리뷰 리스트 js -->
  <script src="/resources/JS/review.js"></script>
  <!-- 결제 api -->
  <script src="/resources/JS/check.js"></script>


 </body>
</html>