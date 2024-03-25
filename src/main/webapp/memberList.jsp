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
<section >
<h2>회원 목록</h2>
<table border=1 class="list">
<tr>
<th class="id1">id</th>
<th class="id1">성명</th>
<th class="id1">비밀번호</th>
<th>성별</th>
<th>이메일</th>
<th>연락처</th>
<th>주소</th>
<th>구분</th>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from member0312";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");		
		String name=rs.getString("name");		
		String password=rs.getString("password");		
		String gender=rs.getString("gender");		
		String email=rs.getString("email");		
		String phone=rs.getString("phone");		
		String address=rs.getString("address");		
%>	
<tr>
<td><%=id %></td>
<td><%=name %></td>
<td><%=password %></td>
<td><%=gender %></td>
<td><%=email %></td>
<td><%=phone %></td>
<td><%=address %></td>
<td><a href="memberUpdate.jsp?id=<%=id %>">수정</a> /
		<a href="memberDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하겠습니까?'))return false;">삭제</a></td>
</tr>
<%
	}
%>

</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>