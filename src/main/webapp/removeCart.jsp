<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.util.ArrayList" %>
<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("product.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	ArrayList<Product> cartlist = (ArrayList<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for(int i = 0; i < cartlist.size(); i++) { //상품리스트 하나씩 출력하기
		goodsQnt = cartlist.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartlist.remove(goodsQnt);
		}
	}
	response.sendRedirect("cart.jsp");
%>