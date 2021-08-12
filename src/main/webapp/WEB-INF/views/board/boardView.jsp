<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){		
		
		$j("#deleteBtn").on("click",function(){
			
			var boardType = $j('#boardType').val();
			var boardNum = $j('#boardNum').val();
			
			console.log(boardType + ' , ' + boardNum);
			
			
			$j.ajax({
			    url : "/board/boardDelete.do",
			    dataType: "json",
			    type: "POST",
			    data : {
			    	"boardType" : boardType,
			    	"boardNum" : boardNum
			    },
			    success: function(data, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>

<body>

<input name="boardType" id="boardType" type="hidden" value="${boardType }">
<input name="boardNum" id="boardNum" type="hidden" value="${boardNum }">

<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.creator }
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		</td>
		<td>
			<a href="/board/boardUpdate.do?boardType=${boardType }&boardNum=${boardNum}">Update</a>
		</td>
		<td>
			<button id="deleteBtn">Delete</button>
		</td>
	</tr>
</table>
</body>
</html>