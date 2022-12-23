<%@page import="vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	GhblRentDAO dao = new GhblRentDAO();
	ArrayList<GhblListVO> v = dao.getAllMovie();
%>
	<h2>Ghibli Studio Movies</h2>
	<div class = "list">
		<ul>
		
<%
	for(int i = 0; i<v.size(); i++) {
		GhblListVO bean = v.get(i);
%>	
			<li>
				<a href="index.jsp?content=ReserveInfo.jsp?no=<%=bean.getNo()%>">
					<img src="./images/<%=bean.getImg() %>" alt="<%=bean.getName()%>">
				</a>
				<p>영화명 : <%=bean.getName()%></p>
			</li>
<%
	}
%>				
		</ul>
	</div>
	
	<!-- 검색 -->
	<div class="searchText">
		<h3>영화 검색하기</h3>
		<form action="index.jsp?content=SearchTextList.jsp" method="post">
			<div class="search_form">
				<select name="searchCondition">
					<option value="name">제목
					<option value="info">내용
				</select>
				&nbsp;&nbsp;&nbsp;<input type="text" name="searchWord" required>
				<input type="submit" value="검색" name="searchWord" required class="btn btn-primary">
			</div>
		</form>
	</div>
	
	