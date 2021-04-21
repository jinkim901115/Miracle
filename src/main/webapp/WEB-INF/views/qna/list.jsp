<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>QnA</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- CSS here -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slicknav.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/magnific-popup.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/themify-icons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/nice-select.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/alter.css">

<script>
  $(function(){
    $('#searchBtn').click(function() {
      self.location = "qna" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() +
      "&keyword=" + encodeURIComponent($('#keywordInput').val());
    });
  });   
</script>

<style type="text/css">
	li {list-style: none; padding: 6px;}
</style>

</head>
<body>
<!-- Preloader Start -->
 <div id="preloader-active">
     <div class="preloader d-flex align-items-center justify-content-center">
         <div class="preloader-inner position-relative">
             <div class="preloader-circle"></div>
             <div class="preloader-img pere-text">
                 <img src="assets/img/logo/logoOne.jpg" alt="">
             </div>
         </div>
     </div>
 </div>
<!-- Preloader Start -->
<header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="./index"><img src="assets/img/logo/logo.jpg" width=132px height=37px alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="./index">Home</a></li>
                                            <li><a href="./about">About</a></li>
                                            <li><a href="./listmain">List</a></li>
                                            <li><a href="./notice">Community</a>
                                            	<ul class="submenu">
                                            		<li><a href="./notice">공지사항</a></li>
                                            		<li><a href="./faq">자주하는 질문</a></li>
                                            		<li><a href="./qna">질문과 답변</a></li>
                                            	</ul>
                                            </li>
                                            <li class="add-list"><a href="./favorite"><i class="ti-plus"></i> 즐겨찾기</a></li>
                                            <li class="login">
                                            	<sec:authorize access="isAnonymous()">
	                                            	<a href="./login"> Sign In </a>
                                                </sec:authorize>
                                                <sec:authorize access="isAuthenticated()">
                                                	<a href="#"><i class="ti-user"></i><sec:authentication property="principal.username"/></a>
                                                </sec:authorize>
                                            </li>
                                            <li class="login">
                                            	<sec:authorize access="isAuthenticated()">
                                            		<a href=${pageContext.request.contextPath }/logout>로그아웃</a>
                                           		</sec:authorize>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    
<!-- main Start -->
<main>

 <!-- Hero Start-->
 <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
     <div class="container">
         <div class="row">
             <div class="col-xl-12">
                 <div class="hero-cap text-center pt-50">
                     <h2>QnA 질문과 답변</h2>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!--Hero End -->


<br><br>
	
<div id="root">          
	<div>
	    <%@include file="nav.jsp" %>
	</div>
            <hr />
    <section id="container">
        <form role="form" method="get">
            <table class="table table-hover">
                <tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>조회수</th><th>등록일</th></tr>
              
              <!-- qnaController에서 이름을 list로 정한 service.list()를 가져온것 -->
                <c:forEach items="${list}" var = "list">
                    <tr>
                        <td><c:out value="${list.q_uid}" /></td>
                          <td><c:out value="${list.q_category}" /></td>
                        <td>
                            <a href="q_readView?q_uid=${list.q_uid}&
                            page=${scri.page}&
                            perPageNum=${scri.perPageNum}&
                            searchType=${scri.searchType}&
                            keyword=${scri.keyword}">
                            <c:out value="${list.q_subject}" /></a></td>
                        <td><c:out value="${list.u_id}" /></td>
                          <td><c:out value="${list.q_viewcnt}" /></td>
                        <td><fmt:formatDate value="${list.q_regdate}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:forEach>
              </table>
     <div class="search row">
         <div class="col-xs-2 col-sm-2">
		    <select name="searchType" class="form-control">
		      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
		      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
		      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
		      <option value="g"<c:out value="${scri.searchType eq 'g' ? 'selected' : ''}"/>>카테고리</option>
		    </select>
		</div>
			
		<div class="col-xs-10 col-sm-10">
		<div class="input-group">
	    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
		<span class="input-group-btn">
	    <button id="searchBtn" type="button" class="btn btn-default">검색</button>
		</span>
		</div>
 		    </div>
  	</div>
  	<!-- 페이징 with 검색 --> 
                    <div  class="col-md-offset-3">
                      <ul class="pagination">
                        <c:if test="${pageMaker.prev }">
                        <li>
                            <a href='<c:url value="list${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a>
                        </li>
                        </c:if>
                        
                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li>
                            <a href='<c:url value="list${pageMaker.makeSearch(idx) }"/>'>${idx }</a>
                        </li>
                        </c:forEach>
                        
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li <c:out value="${pageMaker.cri.page == pageNum ? 'class=info' : ''}" />>
                            <a href='<c:url value="list${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a>
                        </li>
                       </c:if>
                      </ul>
                    </div> 
                </form>
            </section>
            <hr />
        </div>

<br><br>



</main>
<!-- end main -->

<footer>
      <!-- Footer Start-->
      <div class="footer-area">
          <div class="container">
             <div class="footer-top footer-padding">
                  <div class="row justify-content-between">
                      <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6">
                          <div class="single-footer-caption mb-50">
                              <div class="single-footer-caption mb-30">
                                  <!-- logo -->
                                  <div class="footer-logo">
                                      <a href="./index"><img src="assets/img/logo/logo.jpg" width=132px height=37px alt=""></a>
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6">
                          <div class="single-footer-caption mb-50">
                              <div class="footer-tittle">
                                  <h4>Quick Link</h4>
                                  <ul>
                                      <li><a href="./index">Home</a></li>
                                      <li><a href="./listmain">리스트</a></li>
                                      <li><a href="./favorite">즐겨찾기</a></li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                      <div class="col-xl-2 col-lg-3 col-md-4 col-sm-6">
                          <div class="single-footer-caption mb-50">
                              <div class="footer-tittle">
                                  <h4>이용관련</h4>
                                  <ul>
                                      <li><a href="#">이용약관</a></li>
                                      <li><a href="#">개인정보책임</a></li>
                                      <li><a href="#">찾아오시는길</a></li> 
                                  </ul>
                              </div>
                          </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                          <div class="single-footer-caption mb-50">
                              <div class="footer-tittle">
                                  <h4>Download App</h4>
                                  <ul>
                                      <li class="app-log"><a href="#"><img src="assets/img/gallery/app-logo.png" alt=""></a></li>
                                      <li><a href="#"><img src="assets/img/gallery/app-logo2.png" alt=""></a></li>
                                  </ul>
                              </div>
                          </div>
                      </div>
                  </div>
             </div>
              <div class="footer-bottom">
                  <div class="row d-flex justify-content-between align-items-center">
                      <div class="col-xl-9 col-lg-8">
                          <div class="footer-copy-right">
                              <p>
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | We are Miracle 7 <i class="fa fa-heart" aria-hidden="true"></i> 
							 </p>
                          </div>
                      </div>
                      <div class="col-xl-3 col-lg-4">
                          <!-- Footer Social -->
                          <div class="footer-social f-right">
                              <a href="#"><i class="fab fa-instagram"></i></a>
                          </div>
                      </div>
                  </div>
             </div>
          </div>
      </div>
<!-- Footer End-->
</footer>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- All JS Custom Plugins Link Here here -->
<script src="${pageContext.request.contextPath }/assets/js/vendor/modernizr-3.5.0.min.js"></script>

<!-- Jquery, Popper, Bootstrap -->
<script src="${pageContext.request.contextPath }/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>

<!-- Jquery Mobile Menu -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="${pageContext.request.contextPath }/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/slick.min.js"></script>

<!-- One Page, Animated-HeadLin -->
<script src="${pageContext.request.contextPath }/assets/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/animated.headline.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.magnific-popup.js"></script>

<!-- Nice-select, sticky -->
<script src="${pageContext.request.contextPath }/assets/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.sticky.js"></script>

<!-- contact js -->
<script src="${pageContext.request.contextPath }/assets/js/contact.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="${pageContext.request.contextPath }/assets/js/plugins.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>
</body>
</html>