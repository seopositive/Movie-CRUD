<%@page import="java.io.PrintWriter"%>
<%@page import="vo.GhblListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// 검색 조건 = 제목, 내용 selct 옵션으로 넘오오기 떄문에 넘어오는 곧의 name을 DB 컬럼명과 맞춰줘야한다 
	String serachField = (String)request.getParameter("searchCondition");
	// 검색어 문자열
	String searchText = (String)request.getParameter("searchWord");
	
	GhblRentDAO dao = new GhblRentDAO();
	
	ArrayList<GhblListVO> list = dao.getSearchMovie(serachField, searchText);
	// 검색결과 없을때 경고창 = 자바스크립트
	if(list.size() == 0) {
		
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('검색결과가 없습니다')");
		// 정보값 그대로 가지고 뒤로 이동
		script.println("history.back()");
		script.println("</script>");
	}
	
%>

	<h2>Ghibli Studio Search Movies</h2>
	<div class="list">
		<ul>
<%
	for(int i=0; i<list.size(); i++){
		GhblListVO bean = list.get(i);
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
