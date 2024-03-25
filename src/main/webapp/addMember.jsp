<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<Section>
<article>
<p>회원 가입 등록 화면</p>
</article>
<form name="form" method="post" action="MemberProcess.jsp">
<table border="1" id="am">
<tr>
<th>아이디</th>
<td><input type="text" name="id" class="d1"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name" class="d1"></td>
</tr>
<tr>
<th>비밀번호</th>
<td>&nbsp;<input type="password" name="password" class="p1"></td>
</tr>
<tr>
<th>비밀번호 확인</th>
<td>&nbsp;<input type="password"  name="pass" class="p1"></td>
</tr>
<tr>
<th>성별</th>
<td>&nbsp;<input type="radio" name="gender"  value="남성">남성
<input type="radio" name="gender"  value="여성">여성
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type="text" name="email" class="e1" placeholder="이메일"> @
<select name="email2" class="e2">
<option value="naver.com">naver.com</option>
<option value="gmail.com">gmail.com</option>
<option value="daum.net">daum.net</option>
</select>
</td>
</tr>
<tr>
<th>연락처</th>
<td>
&nbsp;<select name="phone1" class="t1">
<option value="010">010</option>
<option value="011">011</option>
<option value="013">013</option>
</select> -
<input type="text" name="phone2"  class="t2"> -
<input type="text" name="phone3" class="t2">
</td>
</tr>
<tr>
<th>주소</th>
<td><input type="text" name="address" class="d1"></td>
</tr>
<tr>
<th  colspan="2"><button type="button" value="등록" onclick="checkField()" class="b2" >등록</button><input type="reset" value="취소" class="b1"></th>
</tr>
</table>
</form>
</Section>
<%@ include file="footer.jsp" %>
<script>
		function checkField(){
			let input = document.form;
			if(input.id.value.length==0){	
				alert("아이디를 입력하세요");
				document.form.id.focus();
				return false;	
			}
			if(input.name.value.length==0){	
				alert("성명을 입력하세요.");
				document.form.name.focus();
				return false;
			}
			if(input.password.value.length==0){
				alert("비밀번호를 입력하세요.");
				document.form.password.focus();
				return false;
			}		
			if(input.pass.value.length==0){
				alert("확인비밀번호를 확인하세요.");
				document.form.pass.focus();
				return false;
			}
			if(input.password.value!=input.pass.value){
				alert("비밀번호가 일치하지않습니다.")
				document.form.password.focus();
				document.form.pass.focus();
				return false;
			}
			let cnt=0;
			let rdo=document.getElementsByName("gender")
			for(let i=0;i<rdo.length;i++){
				if(rdo[i].checked==true){
					cnt++;
					break;
				}
			}
			if(cnt==0){
				alert("성별을 체크하세요.");
				return false;
			}
			if(input.email.value.length==0){
				alert("이메일을 입력하세요.");
				document.form.email.focus();
				return false;
			}
			if(input.phone2.value.length !=4 || isNaN(document.form.phone2.value)){
				alert("연락처 4자리를 입력하세요.");
				document.form.phone2.focus();
				return false;
			}
			if(input.phone3.value.length !=4 || isNaN(document.form.phone3.value)){
				alert("연락처 4자리를 입력하세요.");
				document.form.phone3.focus();
				return false;
			}
			if(input.address.value.length==0){
				alert("주소를 입력하세요.");
				document.form.address.focus();
				return false;
			}
				document.form.submit();
		
		}
	</script>
<%@ include file="footer.jsp" %>
</body>
</html>