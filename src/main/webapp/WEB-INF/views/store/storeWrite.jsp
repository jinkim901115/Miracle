<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>가게 추가</title>
		<style>
			th {background-color: tomato; font-size: 12px; text-align: left; width:20%;}
			#c_type {color: tomato; font-size: 12px; text-align: left;}
			table {width:80%;}
			#td {width:20%;}
			#td1 {width:40%;}
			
			
			.fileDrop{
				width: 100%;
	        	height: 200px;
	        	border: 2px dotted #0b58a2;
			}
			
		</style>
	    
	<link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css">
	
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/bower_components/font-awesome/css/font-awesome.min.css">    
    <!-- Ionicons -->
    <link rel="stylesheet" href="/bower_components/Ionicons/css/ionicons.min.css">    
    <!-- iCheck -->
    <link rel="stylesheet" href="/plugins/iCheck/square/blue.css">    
    <%--lightbox--%>
    <link rel="stylesheet" href="/bower_components/lightbox/css/lightbox.css">    
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/AdminLTE.min.css">    
    <%--fileupload--%>
    <link rel="stylesheet" media="screen" href="/bower_components/fileupload/css/jasny-bootstrap.min.css">
	
	
	</head>

<body>
	<hr>
	<h1>가게 
		<small>추가 페이지</small>
	</h1>
	
	
	<form role="form" id="frm" name="frm" action="writeOk" method="post" enctype="multipart/form-data">	
		<table>
			<tr>
				<th>포차 이름: </th>
				<td id="td1"><input type="text" id="sname" name="sname" value="${sname }" placeholder="20글자 제한"></input></td>
			</tr>
			<tr>
				<th>사업자 등록 번호: </th>
				<td id="td1"><input type="text" id="sbiznum" name="sbiznum" value="${sbiznum }" placeholder="000-00-00000"></input> </td>
			</tr>
			<tr>
				<th>포차 주소: </th>
				<td id="td1"><input type="text" id="saddr" name="saddr" value="${saddr }" placeholder="도로명 주소"/></td>
			</tr>
			<tr>
				<th>사장님의 한마디:</th>
				<td id="td1"><input type="text" id="scomt" name="scomt" value="${scomt }" placeholder="매출 100만원!!!"/></td>
			</tr>
			<tr>
				<th>영업 시간:</th>
				<td id="td1"><textarea id="sopinfo" name="sopinfo" value="${sopinfo }" rows="10" 
							placeholder="월 10:00~22:00     화 12:00~22:00      수~금 10:00~22:00         주말 13:00~20:00" style="resize: none;"></textarea></td>
				<td id="c_type">  </td>
			</tr>
			<tr>
				<th>위도:</th>
				<td id="td1"><input type="text" id="slat" name="slat" value="${slat }" placeholder="3x.xxxxxx"/></td>
			</tr>
			<tr>
				<th>경도:</th>
				<td id="td1"><input type="text" id="slng" name="slng" value="${slng }" placeholder="1xx.xxxxxx"/></td>
			</tr>
			<tr>
				<th>포차 메인 사진:</th>
<%-- 				<td id="td1"><input type="text" id="spic" name="spic" value="${spic }"/></td> --%>
				<td id="td1"><input type="file" name="file0" id="storeMain"></td>
			</tr>
		
<!-- 			<tr>			 -->
<!-- 				<th>넌 누구냐:</th> -->
<%-- 				<td id="td1"><input type="text" id="uid" name="uid" value="${uid }"/></td> --%>
<!-- 			</tr> -->
			
		<tr>
			<th>메뉴 사진: <input type="button" id="addTh" value="추가"></th>
			<td id="td1">
				<div id="thArea">
					<input type="file" name="file1" id="storeThn1">
					<input type="text" name="menu1" id="storeMenu1">
				</div>
			</td>	
		</tr>
		
		</table>
		
				
		<br>
		<input type="submit" value="등록"/>
	</form>

	<hr>
	<div class="box-footer">
		<button type="button" onclick="location.href = 'list'"><i class="fa fa-list"></i>포차 목록</button>
		<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button>
		<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>  <!-- reset 버튼 동작하도록 작업 필요 -->
	</div>




<jsp:include page="/pluginn"/>


<!-- <script id="fileTemplate" type="text/x-handlebars-template"> -->
    <li>
        <span class="mailbox-attachment-icon has-img">
            <img src="{{imgSrc}}" alt="Attachment">
        </span>
        <div class="mailbox-attachment-info">
            <a href="{{originalFileUrl}}" class="mailbox-attachment-name">
                <i class="fa fa-paperclip"></i> {{originalFileName}}
            </a>
            <a href="{{fullName}}" class="btn btn-default btn-xs pull-right delBtn">
                <i class="fa fa-fw fa-remove"></i>
            </a>
        </div>
    </li>
<!-- </script> -->
<!-- <script type="text/javascript" src="/resources/dist/js/article_file_upload.js"></script> -->
<%-- <script type="text/javascript" src="<c:url value='/resources/bower_components/jquery/dist/jquery.min.js'/>"></script> --%>



<script>

    $(document).ready(function () {
    	var thN = 2;
    	$('input#addTh').on('click',function(event){
    		event.preventDefault();
    		$('div#thArea').append('<input type="file" name="file'+(thN++)+'" />');
    		$('div#thArea').append('<input type="text" name="menu'+(thN++)+'" />');
    	})
        // 게시글 저장 버튼 클릭 이벤트 처리
        // 저장버튼 클릭시, article_file_upload.js의 filesSubmit()메소드 호출
        // value에 업로드 파일명 추가. form태그 submit 처리
        $("#writeForm").submit(function (event) {
            event.preventDefault();
            var that = $(this);
            filesSubmit(that);
        });

        // 파일 삭제 버튼 클릭 이벤트
        $(document).on("click", ".delBtn", function (event) {
            event.preventDefault();
            var that = $(this);
            deleteFileWrtPage(that);
        });

        // 목록 버튼 클릭 이벤트 처리
        $(".listBtn").on("click", function () {
            self.location = "/article/paging/search/list?page=${searchCriteria.page}"
                + "&perPageNum=${searchCriteria.perPageNum}"
                + "&searchType=${searchCriteria.searchType}"
                + "&keyword=${searchCriteria.keyword}";
        });

    });

</script>




</body>
</html>



