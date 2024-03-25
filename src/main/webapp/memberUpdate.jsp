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
<%@ include file="DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	PreparedStatement pstmt=null ;
	ResultSet rs=null;
	String sql="select * from member0312 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String password=rs.getString("password");
		String gender=rs.getString("gender");
		String phone=rs.getString("phone");
		String email=rs.getString("email");
		String address=rs.getString("address");
		String ph[]=phone.split("-");
		String em[]=email.split("@");
	
%>
<article>
<p>회원 수정 화면</p>
</article>
<form name="form" method="post" action="MemberUpdateProcess.jsp">
<table border="1">
<tr>
<th>아이디</th>
<td><input type="text" name="id" class="d1" value="<%=id %>"></td>
</tr>
<tr>
<th>성명</th>
<td><input type="text" name="name" class="d1" value="<%=name %>"></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type="password" name="password" class="p1" value="<%=password %>"></td>
</tr>
<tr>
<th>비밀번호 확인</th>
<td><input type="password"  name="pass" class="p1" value="<%=password %>"></td>
</tr>
<tr>
<th>성별</th>
<td><input type="radio" name="gender"  value="남성" <%=gender.equals("남성") ? "checked":"" %>>남성
<input type="radio" name="gender"  value="여성" <%=gender.equals("여성") ? "checked":"" %>>여성
</td>
</tr>
<tr>
<th>이메일</th>
<td>
<input type="text" name="email" class="e1" placeholder="이메일" value="<%=em[0] %>"> @
<select name="email2" class="e2" >
<option value="naver.com" <%if (em[1].equals("naver.com")){ %>selected<%} %>>naver.com</option>
<option value="gmail.com"  <%if (em[1].equals("gamil.com")){ %>selected<%} %>>gmail.com</option>
<option value="daum.net"  <%if (em[1].equals("daum.net")){ %>selected<%} %>>daum.net</option>
</select>
</td>
</tr>
<tr>
<th>연락처</th>
<td>
<select name="phone1" class="t1" >
<option value="010" <%if (ph[0].equals("010")){ %>selected<%} %>>010</option>
<option value="011" <%if (ph[0].equals("011")){ %>selected<%} %>>011</option>
<option value="013" <%if (ph[0].equals("013")){ %>selected<%} %>>013</option>
</select> -
<input type="text" name="phone2"  class="t2"  value="<%=ph[1] %>"> -
<input type="text" name="phone3" class="t2"  value="<%=ph[2] %>">
</td>
</tr>
<tr>
<th>주소</th>
<td><input type="text" name="address" class="d1" value="<%=address %>"></td>
</tr>
<tr>
<th  colspan="2"><button type="button" value="수정" onclick="checkField()" id="memli">수정</button><input type="reset" value="취소"  id="memli"></th>
</tr>
<%
	}
%>
</table>
</form>
</Section>
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