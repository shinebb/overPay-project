<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%
	request.setCharacterEncoding("UTF-8");
// 3/17 추가
//멀티파트로 절대 경로사용할 때만 사용 -> 상대경로 사용시에는 주석처리할 것
//com.oreilly, util도 이거 사용할 때 필요한 임포트

String filename = "";
	String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


String productId = multi.getParameter("productId"); //제품번호
String name = multi.getParameter("name"); //제품명
String unitPrice = multi.getParameter("unitPrice"); //가격
String description = multi.getParameter("description"); //제품설명
String manufacturer = multi.getParameter("manufacturer"); //제조사
String category = multi.getParameter("category"); //분류
String unitsInStock = multi.getParameter("unitsInStock"); //재고 수
String condition = multi.getParameter("condition"); //신상품or중고품or재생품

/*
//상대 경로 시 사용
	String productId = request.getParameter("productId"); //제품번호
	String name = request.getParameter("name"); //제품명
	String unitPrice = request.getParameter("unitPrice"); //가격
	String description = request.getParameter("description"); //제품설명
	String manufacturer = request.getParameter("manufacturer"); //제조사
	String category = request.getParameter("category"); //분류
	String unitsInStock = request.getParameter("unitsInStock"); //재고 수
	String condition = request.getParameter("condition"); //신상품or중고품or재생품
	String fileName = request.getParameter("productImage");  //파일이름
	*/
	Integer price;
	
	if(unitPrice.isEmpty()) {
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()) {
		stock = 0;
	} else {
		stock = Long.valueOf(unitsInStock);
	}
	
	//3/17 추가(이것도 멀티) 절대경로 사용시 사용됨-> 아니면 주석처리할것
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	//홈페이지에서 전송되어 서버에 업로드된 파일을 가져오록 MultipartRequest 객체타입의 getFilesystemName()메소드를 작성
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct);
	
	response.sendRedirect("products.jsp");
	//잠시 이 페이지로 돌려놓겠습니다하는 메소드
%>
