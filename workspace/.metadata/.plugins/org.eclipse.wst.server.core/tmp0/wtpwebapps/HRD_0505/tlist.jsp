<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tlist</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: gray">
<h2 style="text-align: center">강사조회</h2>
	<form style="display: flex; align-items: center; justify-content: center; text-align: center">
		<table border="1">
			<tr>
				<td style="width: 150px">강사코드</td>
				<td style="width: 150px">강사명</td>
				<td style="width: 150px">강의명</td>
				<td style="width: 150px">수강료</td>
				<td style="width: 150px">강사자격취득일</td>
			</tr>
			<% 
			request.setCharacterEncoding("UTF-8"); // 한글인코딩
			
			
			try{
				String sql = "select * from tbl_teacher_202201 order by teacher_code";
				PreparedStatement pstmt = con.prepareStatement(sql); // sql생성
				ResultSet rs = pstmt.executeQuery(); //결과집합 생성
				while(rs.next()){
					int class_price = rs.getInt(4);
					// 숫자의 형식을 변경: DecimalFormat 변수 = new DecimalFormat("바꿀 형식");
					DecimalFormat transformat = new DecimalFormat("￦ ###, ###, ###"); 
					String price = transformat.format(class_price);
					
					String teacher_regist_date = rs.getString(5);
					// 글자추출 : 변수.substring(시작 인덱스, 끝+1 인덱스)
					String date = teacher_regist_date.substring(0,4) + "년" + teacher_regist_date.substring(4,6) + "월" + teacher_regist_date.substring(6, 8) + "일"; 
					%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=price %></td>
						<td><%=date %></td>
					</tr>
					<%
				}
				
			}
			
			catch(Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>