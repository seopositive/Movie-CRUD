<%@page import="vo.GhblListVO"%>
<%@page import="dao.GhblRentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

	<!-- 모든 넘어오는 값을 편하게 받아옴 -->
	<jsp:useBean id="rbean" class="vo.GhblReserveVO">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>
	
<%
	GhblRentDAO dao = new GhblRentDAO();
	
	GhblListVO bean = dao.getOneMovie(rbean.getNo());
	
	// 총 금액
	int totalmovie = bean.getPrice() * rbean.getQty() * rbean.getDday();
	
	// 옵션 금액
	int usein = 0;
	if(rbean.getUsein()==10000){
		usein = 10000;
	}
	int useblue = 0;
	if(rbean.getUseblue()==10000){
		useblue = 10000;
	}
	int usepop = 0;
	if(rbean.getUsepop()==10000){
		usepop = 10000;
	}
	int usecola = 0;
	if(rbean.getUsecola()==10000){
		usecola = 10000;
	}
	
	// 옵션 금액 계산
	int totaloption = (usein + useblue + usepop + usecola);

	
%>	

	<h2>Ghibli Studio Movies Result</h2>
		<div class="info">
			<ul>
				<li>
					<a href="#">
						<img src="./images/<%=bean.getImg() %>" alt="이미지" />
					</a>
				</li>
			</ul>
			<ul class="movie_info">
				<li>
					영화 기본 대여 금액 : &nbsp;&nbsp;&nbsp;
					<%=totalmovie %> 원
				</li>
				<li>
					옵션 추가 금액 : &nbsp;&nbsp;&nbsp;
					<%=totaloption %> 원
				</li>
				<li>
					총 납부 금액 : &nbsp;&nbsp;&nbsp;
					<%=totalmovie + totaloption %> 원
				</li>
			</ul>
		</div>