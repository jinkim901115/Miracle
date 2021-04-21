<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" >
function chkSubmit() {
	join = document.forms['join'];
	
	//아이디 입력여부 확인 
    if(join.id.value == ''){
    	alert("아이디를 입력해주세요");
    	document.join.id.focus();
    	return false;
    }
	for (var i = 0; i < document.join.id.value.length; i++){
		ch = document.join.id.value.charAt(i)
		if(!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
			alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
			document.join.id.focus();
			document.join.id.select();
			return false;
		}
	}
	//아이디에 공백 사용하지 않기
	if (document.join.id.value.indexOf(" ") >= 0) {
            alert("아이디에 공백을 사용할 수 없습니다.")
            document.join.id.focus();
            document.join.id.select()
            return false;
        }
	// 아이디 길이 체크 (4~12자)
	
	  if (document.join.id.value.length<4 || document.join.id.value.length>12) {
            alert("아이디를 4~12자까지 입력해주세요.")
            document.join.id.focus();
            document.join.id.select();
            return false;
        }
	//비밀번호 입력여부 체크
    if(document.join.pw.value == ""){
    	 alert("패스워드를 입력해주세요");
    	 document.join.pw.focus();
    	 return false;
     }
	 
    if (join.pw.value == join.id.value) {
        alert("아이디와 비밀번호가 같습니다!!! 다르게 입력해주세요!")
        document.join.pw.focus();
        return false;
    }
	//비밀번호 길이 체크(4~12자 까지 허용)
    
	 if (document.join.pw.value.length < 4 || document.join.pw.value.length > 12) {
            alert("비밀번호를 4~12자까지 입력해주세요.")
            document.join.pw.focus();
            document.join.pw.select();
            return false;
        }
    
     //비밀번호와 비밀번호 확인이 맞지 않다면..
     if (document.join.pw.value != document.join.pw2.value) {
         alert("2개의 비밀번호가 일치하지 않습니다.");
         document.join.pw.value = "";
         document.join.pw2.value = "";
         document.join.pw2.focus();
    	 return false;
     }
     //이름
	if(document.join.name.value == ""){
		alert("이름은 반드시 입력해주세요");
		document.join.name.focus();
		return false;
	}
	  if(document.join.name.value.length < 2){
          alert("이름을 2자 이상 입력해주십시오.")
          document.join.name.focus();
          return false;
      }
     
	if(addr == ''){
		alert("주소는 반드시 입력해주세요");
		join['addr'].focus();
		return false;
	}
	if(addr2 == ''){
		alert("상세주소를 입력시켜주세요");
		join['addr2'].focus();
		return false;
	}
	//if(phone == ''){
		//alert("핸드폰 번호를 확인해주세요");
		//join['phone'].focus();
		//return false;
	//}
	/*
	var phone2 = /^[0-9]*$/
	v = $(this).val();
	if( !phone2.test(v) ) {
		alert("숫자만 입력하세요");
	$(this).val(v.replace(phone2,''));
	}
	*/
	if(document.join.phone2.value.length < 3){
		alert("앞자리 번호를 3자리 이상 입력해주세요");
		document.join.phone2.focus();
		return false;
	}
	if(document.join.phone3.value.length < 3){
		alert("뒤자리 번호를 3자리 이상 입력해주세요");
		document.join.phone3.focus();
		return false;
	}
	if(document.join.email.value == ''){
		alert("메일 등록해주세요");
		document.join.email.focus();
		return false;
	}
	//if(document.join.email2.value == 0){
		//alert("이메일을 확인해주세요");
		//document.join.email2.focus();
		//return false;
	//}
	
	var idChkVal = $("#idChk").val();
	if(idChkVal == "N"){
		alert("중복확인 버튼을 눌러주세요.");
		return false;
	}else if(idChkVal == "Y"){
		$("#regForm").submit();
	}

	//function fn_idChk(){
	//	$.ajax({
		//	url : "idChk",
		//	type : "post",
		//	dataType : "json",
		//	data : {"id" : $("#id").val()},
		//	success : function(data){
			//	if(data == 1){
				//	alert("중복된 아이디입니다.");
				//}else if(data == 0){
				//	$("#idChk").attr("value", "Y");
				//	alert("사용가능한 아이디입니다.");
			//	}
		//	}
		//})
	//}
	
	//return true;
}
</script>
  
<body>
<script type="text/javascript">

function email_change(){
    // alert("TEST");
    var email2 = document.getElementById("email2");
    var email_sel = document.getElementById("email_sel");
   // var email2 = document.join.email2.value();
    
    
    //var idx = email_sel.options.value;
//    var idx = email_sel.options.selectedIndex;
    var idx = email_sel.options.selectedIndex;
    // alert(idx);
    
    //if(email_sel.options[idx].value == ''){
    if(idx == 0){
//        email2.disabled = false;
        email2.disabled = false;
    } else {
    	email2.disabled = true;
    }
    
    
    // var val = email_sel.options[1].text;
    var val = email_sel.options[idx].value;
    // alert(val);
    
    email2.value = val;
}
</script>

<script type="text/javascript">


function fn_idChk(){
	var id = $("#id").val();
	var csrfName = $("#csrfName").val();
	var csrfValue = $("#csrfValue").val();
	var param = {"id" : id }
	
	console.log(csrfValue);
	console.log(csrfName);
	param[csrfName] = csrfValue;
	$.ajax({
		url : "idChk",
		type : "post",
		dataType : "json",
		data : param,
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			};
		}
	});
};

/*
var idChkVal = $("#idChk").val();
if(idChkVal == "N"){
	alert("중복확인 버튼을 눌러주세요.");
}else if(idChkVal == "Y"){
	$("#regForm").submit();
};
*/

</script>
 

<h2>GYM 가입란</h2>
<form name="join" action="writeOk.do" method="post" id="regForm" onsubmit="return chkSubmit()" >
가입구분: <br>
<input type="radio" name="auth" value="ROLE_MEMBER" checked/>일반회원
<input type="radio" name="auth" value="ROLE_CEO"/>상인회원
<br><br><br><br>
아이디: <br>
<input type="text" name="id" id="id" /> 영문 대소문자, 숫자만 사용가능! (4 ~ 12글자)<br>

<button name="idChk" class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
비밀번호: <br>
<input type="text" name="pw" id="pw"/>아이디와 동일하면 안됩니다! (4 ~ 12 글자)<br>
비밀번호 확인:<br>
<input type="text" name="pw2" id="pw2"/><br>
이름:<br>
<input type="text" name="name" id="name"/>2글자 이상 입력주세요!<br>
주소:<br>
<input type="text" name="addr" id="addr"/><br>
상세주소:<br>
<input type="text" name="addr2" id="addr2"/><br>
<tr>
	<th><em class="point">휴대폰번호:</em></th> <br>
	<select name="phone" id="phone" style="width:60px" class="mgr8">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
	</select> -
	<input name="phone2" id="phone2" maxlength="4" type="text" pattern="[0-9]+" style="width:45px"/> -
	<input name="phone3" id="phone3" maxlength="4" type="text" pattern="[0-9]+" style="width:45px"/> 숫자만 입력해주세요!!^^</td>
</tr> <br>
e-mail:<br>
<input type="text" name="email" id="email">  @
<input type="text" name="email2" id="email2" >
<select  name="email2" id="email_sel" onchange="email_change()">
	
	<option value=''>직접입력</option>
    <option value='naver.com'>네이버</option>
    <option value='hanmail.net'>다음</option>
    <option value='gmail.com'>구글</option>
</select>
<!-- 
e-mail:<br>
<input type="text" name="email"/> @ 
	<input type="text" name="email2"/>
<select type="text" name="email2" style="width60px">
	<option>naver.com</option>
	<option>daum.net</option>
	<option>google.com</option>
	<option>직접입력</option>
	<!-- 
	<option value="naver.com">naver.com</option>
	<option value="naver.com">naver.com</option>
	 
</select> <br>
 --> 
<br><br>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
<input type="hidden" id="csrfName" name="csrfName" value="${_csrf.parameterName }"/>
<input type="hidden" id="csrfValue" name="csrfValue" value="${_csrf.token }"/>
<input type="submit" value="가입" />
</form>

<br>
<button type="button" onclick="location.href = 'list.do'">목록으로</button>
</body>
</html>
















