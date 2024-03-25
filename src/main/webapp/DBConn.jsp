<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    Connection conn=null;
    try{
    	String jdbcDriver="oracle.jdbc.OracleDriver";
    	String jdbcurl ="jdbc:oracle:thin:@ //localhost:1521/xe";
    	String user = "system";
    	String pwd = "1234";
    	Class.forName(jdbcDriver);
    	conn = DriverManager.getConnection(jdbcurl,user,pwd);
    	System.out.println("데이터베이스 연결성공");
    	} catch(Exception e){
    	System.out.println("데이터베이스 연결실패");
    	e.printStackTrace();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>