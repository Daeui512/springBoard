<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table id="boardTable" border = "1">
		<tr>
			<td width="80" align="center">
				Type
			</td>
			<td width="40" align="center">
				No
			</td>
			<td width="300" align="center">
				Title
			</td>
		</tr>
			<c:forEach items="${boardList}" var="list">
				<tr>
					<td align="center">
						${list.codeName}
					</td>
					<td>
						${list.boardNum}
					</td>
					<td>
						<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
					</td>
				</tr>	
			</c:forEach>
	</table>
</body>
</html>