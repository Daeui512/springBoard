<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
          '<tr><td>Type</td>'
          '<td><select name="boardType" id="type-select">'
                
                <c:forEach var="code" items="${comCodeList }" varStatus="status">
                    <option value="${code.codeId }">${code.codeName }</option>
                </c:forEach>
          
          '</select></td></tr>' 
          
          '<tr><td width="120" align="center">Title</td>'
          '<td width="400"><input name="boardTitle" type="text" size="50" ></td></tr>'
          '<tr><td height="300" align="center">Comment</td>'
          '<td valign="top"><textarea name="boardComment"  rows="20" cols="55"></textarea></td></tr>'
          
</body>
</html>