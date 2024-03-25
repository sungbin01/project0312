<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	String pass=request.getParameter("pass");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email")+"@"+request.getParameter("email2");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String address=request.getParameter("address");
	String sql="insert into member0312 values(?,?,?,?,?,?,?)";
	PreparedStatement pstmt=null;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,name);
	pstmt.setString(3,password);
	pstmt.setString(4,gender);
	pstmt.setString(5,email);
	pstmt.setString(6,phone);
	pstmt.setString(7,address);
	pstmt.executeUpdate();
%>
<script>
alert("입력이 완료 되었습니다.")
location.href="memberList.jsp"
</script>
아이디 : <%=id %><br>
성명:<%=name %><br>
비밀번호:<%=password %><br>
비밀번호 확인:<%=pass %><br>
성별:<%=gender %><br>
이메일:<%=email %><br>
연락처:<%=phone %><br>
주소:<%=address %><br>
</body>
</html>