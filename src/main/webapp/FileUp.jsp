<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cos.jar 멀티파티 업로드</title>
</head>
<body>
	<h2>파일 업로드</h2>
	<!-- 서버에 데이터 전송 -->
	<form action="FileUploadProc.jsp" method="post" enctype="multipart/form-data"> 
		<table width="350" border="1">
			<tr>
				<td width="150">이름</td>
				<td width="200">
					<input type="text" name="name" />
				</td>
			</tr>
			<tr>
				<td width="150">파일 선택</td>
				<td width="200">
					<input type="file" name="fieldata" />
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="파일 업로드" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>