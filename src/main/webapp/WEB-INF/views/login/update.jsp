<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정-${list[0].id}</title>
</head>
<script>
function chkSubmit() {
	join = document.forms['join'];

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
	//if(document.join.name.value == ""){
	//	alert("이름은 반드시 입력해주세요");
		//document.join.name.focus();
		//return false;
	//}
	 // if(document.join.name.value.length < 2){
        //  alert("이름을 2자 이상 입력해주십시오.")
         // document.join.name.focus();
         // return false;
     // }
     
	if(document.join.addr.value == ''){
		alert("주소는 반드시 입력해주세요");
		document.join.addr.focus();
		return false;
	}
	if(document.join.addr2.value == ''){
		alert("상세주소를 입력시켜주세요");
		document.join.addr2.focus();
		return false;
	}
	//if(phone == ''){
		//alert("핸드폰 번호를 확인해주세요");
		//join['phone'].focus();
		//return false;
	//}
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
	//if(document.join.email_sel.value == ''){
		//alert("이메일을 확인해주세요");
		//document.join.email2.focus();
		//return false;
	//}
	return true;
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

<h2>수정</h2>
<form name="join" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="id" value="${list[0].id }"/>
ID : ${list[0].id }<br> <%-- 작성자 이름은 변경 불가 --%>
비밀번호: <br>
<input type="text" name="pw" id="pw" value="${list[0].pw }"/> (아이디와 중복 안됨, 4 ~ 12자 사이 입력해주세요)<br>
<input type="text" name="pw2" id="pw2"/> 비밀번호 확인<br>
이름 : ${list[0].name} <br>
주소 : 
<input type="text" name="addr" id="addr" value="${list[0].addr }"/><br>
상세주소 : 
<input type="text" name="addr2" id="addr2" value="${list[0].addr2 }"/><br>

<tr>
	<th><em class="point">휴대폰번호:</em></th> <br>
	<td colspan="3">
	<select name="phone" id="phone" style="width:60px" class="mgr8">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
	</select> -
	<input name="phone2" id="phone2" value="${list[0].phone2 }" pattern="[0-9]+" maxlength="4" type="text" style="width:45px"/> -
	<input name="phone3" id="phone3" value="${list[0].phone3 }" pattern="[0-9]+" maxlength="4" type="text" style="width:45px"/>숫자만 입력해주세요^^</td>
</tr> <br>
e-mail : <br>
<input type="text" name="email" id="email" value="${list[0].email }"/> @
<input type="text" name="email2" id="email2" >
<select  name="email2" id="email_sel" onchange="email_change()">

	<option value=''>직접입력</option>
    <option value='naver.com'>네이버</option>
    <option value='hanmail.net'>다음</option>
    <option value='gmail.com'>구글</option>
	<!-- 
	<option value="naver.com">naver.com</option>
	<option value="naver.com">naver.com</option>
	 -->
</select> <br>
<br><br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back();">이전으로</button>
<button onclick="location.href='list.do'">목록보기</button>
<br>
</body>
</html>

	

