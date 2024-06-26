<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("UTF-8");

// insert페이지에 있는 데이터를 불러와야함 // 외부 데이터 받아오기 request.getParameter("데이터");
String regist_month = request.getParameter("regist_month"); 
String c_no = request.getParameter("c_no"); 
String class_area = request.getParameter("class_area"); 
String tuition = request.getParameter("tuition"); 
String class_name = request.getParameter("class_name"); //class_name로부터 1000을 나눈 값을 teacher_code로 받아옴
int teacher_code = Integer.parseInt(class_name)/1000; //문자 -> 숫자: Integer.parseInt(바꿀 값);

try{
	String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql); //sql생성
	
	//물음표가 있으면 물음표에 뭐 들어가는지 알려줘야함
	pstmt.setString(1, regist_month);
	pstmt.setString(2, c_no);
	pstmt.setString(3, class_area);
	pstmt.setString(4, tuition);
	pstmt.setInt(5, teacher_code);
	
	pstmt.executeUpdate();
}

catch(Exception e){
	e.printStackTrace();
}
%>

<jsp:forward page="index.jsp"></jsp:forward>>