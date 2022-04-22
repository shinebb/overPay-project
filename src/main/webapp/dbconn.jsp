<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try{
		//String url = "jdbc:oracle:thin:@localhost:1521/WebMarketDB";
		String url = "jdbc:oracle:thin:@localhost:1521/xe";
		String user = "scott";
		String password = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		Class.forName(driver);
		//Class.forName("com.oracle.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		System.out.println("DB에 연결되었습니다.");
	}
	catch(SQLException e) {
		System.out.println("데이터베이스 연결이 실패되었습니다.<br>");
		//out.println("SQLException : " + ex.getMessage());
		e.printStackTrace();
	}
%>
