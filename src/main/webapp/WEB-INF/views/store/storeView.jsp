<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <c:set var="path" value="${pageContext.request.contextPath}"/> --%>


<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 가게 정보를 찾을 수 없습니다.");
			history.back();
		</script>
	</c:when>	
<c:otherwise>	
	
		
	<!DOCTYPE html>
	<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Pocha</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
	
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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	
	<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	
	
	<style>
	table {
		width: 80%;
		text-align: left;
	}
	table, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	td {padding: 5px 10px}
	#left {width: 30%; background-color: AntiqueWhite;}
	#right {width: 50%;}
	</style>
	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
	</style>
	
	</head>
	
	
	
	<script>
	//가게정보 삭제
	$(document).ready(function(){
	
		function chkDelete(suid){
			var r = confirm("등록된 가게 정보를 삭제하시겠습니까?");
			
			if(r){
				var r1 = confirm("등록된 가게 정보를 정말 삭제하시겠습니까?");
				if(r1){
					location.href = 'deleteOk?suid=' + suid;
				}
			}
		} // chkDelete
			
		//댓글 작성	
		    var formObj = $("form[name='replyForm']");
		    $(".replyWriteBtn").on("click", function(){
		      
		        alert ("댓글등록완료!");
		        formObj.attr("action", "replyWrite");
		        formObj.submit();
		
		    	});
			})
			function fn_valiChk(){
			var regForm = $("form[name='answerForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}	
	    }
		
		$(".replyDeleteBtn").on("click", function(){
			var formObj = $("form[name=deleteForm]");
			var msg = confirm("댓글을 삭제합니다.");
			if(msg == true) {
				// this 의 data-a_uid 값을 읽어와서
				// formObj 의 a_uid value 로 세팅한뒤 submit 하기
			 	var val = $(this).attr("data-c_uid");
				 formObj.find("[name='c_uid']").val(val);
				 formObj.attr("action", "replyDelete");
			     formObj.attr("method", "post");
			     formObj.submit(); 
			}
	});
		
		})
		
	</script>
	
	<body>
	<!-- Preloader Start -->
	<!--  <div id="preloader-active"> -->
	<!--      <div class="preloader d-flex align-items-center justify-content-center"> -->
	<!--          <div class="preloader-inner position-relative"> -->
	<!--              <div class="preloader-circle"></div> -->
	<!--              <div class="preloader-img pere-text"> -->
	<!--                  <img src="assets/img/logo/logoOne.jpg" alt=""> -->
	<!--              </div> -->
	<!--          </div> -->
	<!--      </div> -->
	<!--  </div> -->
	<!-- Preloader End --> 
	
	<!-- header Start -->
	<%@include file="../nav/nav.jsp"  %>
	<!-- header End -->
	
	
	
	<main>
	
	 <!-- Hero Start-->
	 <div class="hero-area2  slider-height2 hero-overly2 d-flex align-items-center ">
	     <div class="container">
	         <div class="row">
	             <div class="col-xl-12">
	                 <div class="hero-cap text-center pt-50">
	                     <h2>${list[0].sname }</h2>
	                 </div>
	             </div>
	         </div>
	     </div>
	 </div>
	 <!--Hero End -->
	
	<!-- Main Start -->
	
		<div>	
			<h2>${list[0].sname }</h2>
			<div class="box-main">
				<div class="box-store">
					<table>
						<tr><td id="left">포차 이름</td>
							<td id="right">${list[0].sname }</td></tr>
						<tr><td id="left">사업자 등록 번호</td>
							<td id="right">${list[0].sbiznum }</td></tr>
						<tr><td id="left">포차 주소</td>
							<td id="right">${list[0].saddr }</td></tr>
						<tr><td id="left">사장님의 한마디</td>
							<td id="right">${list[0].scomt }</td></tr>
						<tr><td id="left">영업 시간</td>
							<td id="right">${list[0].sopinfo }</td></tr>
						<tr><td id="left">위도</td>
							<td id="right">${list[0].slat }</td></tr>
						<tr><td id="left">경도</td>
							<td id="right">${list[0].slng }</td></tr>
						<tr><td id="left">가게 대표 사진</td>
							<td id="right">
								<img src="<c:url value='/store/file/display/img?fuid=${list[0].spic}' />" style="width: 400px;height: 300px;"/> 
							</td></tr>
						<tr><td id="left">썸네일</td>
							<td id="right" style="min-height: 100px">
								<c:forEach var="th" items="${thList}">
									<img src="<c:url value='/store/file/display/img?fuid=${th.f_uid}' />" style="width: 200px;height: 100px;"/> 
								</c:forEach>
							</td>
						</tr>			
					</table>
					
					<%--업로드 파일 정보 영역--%>
	<!--                 <div class="box-footer uploadFiles"> -->
	<!--                     <ul class="mailbox-attachments clearfix uploadedFileList"></ul> -->
	<!--                 </div>				 -->
					
				</div>
				
			
				<div class="box-footer">
			    	<form role="form" method="post">
						<input type="hidden" name="suid" value="${dto.suid}">
	<%-- 		            <input type="hidden" name="page" value="${searchCriteria.page}"> --%>
	<%-- 		            <input type="hidden" name="perPageNum" value="${searchCriteria.perPageNum}"> --%>
	<%-- 		            <input type="hidden" name="searchType" value="${searchCriteria.searchType}"> --%>
	<%-- 		            <input type="hidden" name="keyword" value="${searchCriteria.keyword}"> --%>
			        </form>
			        
			        <button onclick="location.href='list'" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
			        <!-- <c:if test="${t_user.u_id == dto.u_id}"> -->
						<!-- login.userID 가 t_user.u_id 로 변형...  -->
			          	<div class="pull-right">
			               	<button onclick="location.href='update?suid=${list[0].suid }'" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 정보 수정</button>
			                <button onclick="chkDelete(${list[0].suid })" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 포차 삭제</button>  
			           	</div>
			       	<!--</c:if>-->
				</div>			
			</div>
			
			
			
			<!-- 댓글 -->
	
						
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="s_uid" name="s_uid" value="${list[0].suid}" />
				
			
					<div class="form-group">
						<label for="u_id" class="col-sm-2 control-label">후기 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="u_id" name="u_id" class="chk form-control" title="작성자를 입력하세요" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="c_content" class="col-sm-2 control-label">댓글 내용</label>
						<div class="col-sm-10">
							<input type="text" id="c_content" name="c_content" class="chk form-control" title="내용을 입력하세요"/>
						</div>
					</div>
					<div>
						<label for="c_content" class="col-sm-2 control-label">평점</label>
						<table class="table table-boardered" style: width="40%">
							<tr>
								<td>
									<select id="c_point" name="c_point" class="chk form-control">
										<option value="5"> 5 </option>
										<option value="4"> 4 </option>
										<option value="3"> 3 </option>
										<option value="2"> 2 </option>
										<option value="1"> 1 </option>								
									</select>
								</td>
							</tr>
						</table>
					</div>							
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
				
				
				
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<ul>
								<p>
								작성자 : ${replyList.u_id}<br />
								작성 날짜 :<fmt:formatDate value="${replyList.c_regdate}" pattern="yyyy-MM-dd HH:mm"/>
								</p>
								<p>${replyList.c_content}</p>
								<p>평점 : ${replyList.c_point}</p>
								<div>
									<button type="submit" class="replyDeleteBtn btn btn-danger" data-c_uid="${replyList.c_uid}">삭제</button>
								</div>
							</ul>
						</c:forEach>   
					</ol>
					
				</div>
				
				
				<form name="deleteForm" role="form" method="post" action="replyDelete">
					<input type="hidden" name="s_uid" value="${list[0].suid}" readonly="readonly"/>
					<input type="hidden" id="c_uid" name="c_uid" value="${replyDelete.c_uid}" />
						
				</form>		
			<hr />
			</div>	
			<div>
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="view${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="view${pageMaker.makeQuery(idx)}&suid=${list[0].suid }">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="view${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div>
			
	
	<!-- Main End -->
	
	</main>
	<!-- footer Start -->
	<%@include file="../nav/footer.jsp" %>
	<!-- footer End -->
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



</c:otherwise>
</c:choose>




