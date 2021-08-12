<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j(".checks").on("click", "#checkAll", function () {
			  var checked = $j(this).is(":checked");

			  if(checked){
			  	$j(this).parents(".checks").find('input').prop("checked", true);
			  } else {
			  	$j(this).parents(".checks").find('input').prop("checked", false);
			  }
		});
		
		
		$j(".checks").on("click", ".check", function() {
		    var is_checked = true;
		    
		    $j(".checks .check").each(function(){
		        is_checked = is_checked && $j(this).is(":checked");
		    });
		    
		    $j("#checkAll").prop("checked", is_checked);
		});
		
	});
	
</script>
<body>
	<table  align="center">
    <c:if test="${not empty sessionScope.userId }">
      <tr>
        <td align="left">
            name : ${memberVo.userName }
        </td>
    </tr>
    </c:if>
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td class="output">
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
		</td>
	</tr>
	<tr>
		<c:if test="${not empty sessionScope.userId }">
			<td align="right">
				<a href ="/board/boardWrite.do">글쓰기</a>
			</td>
			<td align="left">
				<a href="/board/logout.do">로그아웃</a>
			</td>
		</c:if>
		<c:if test="${empty sessionScope.userId }">
			<td align="right">
				<a href="/board/register.do">회원가입</a>
			</td>
			<td align="left">
				<a href="/board/login.do">로그인</a>
			</td>
		</c:if>
		
	</tr>
</table>


<br>
<div class="checks" style="text-align: center;">
	<input type="checkbox" id="checkAll" value="all">전체
	<c:forEach var="code" items="${comCodeList}" varStatus="status">
		<input type="checkbox" class="check" name="codeId" id="checkId${code.codeId }" value="${code.codeId }">${code.codeName }</>
	</c:forEach>
	<button type="button" class="searchBtn">조회</button>
</div>

<script type="text/javascript">
	$j(document).ready(()=>{
		$j('.searchBtn').on('click', function(){
			
			var codeId = [];
			  
		    $j('input[type="checkbox"]:checked').each(function (i) {
		        codeId.push($j(this).val());
		    });
		    
		    console.log(codeId);
		    
			$j.ajax({
			    url : "/board/boardListSearch.do",
			    dataType: "html",
			    type: "POST",
			    data : {
			    	"codeId" : codeId
			    },
			    success: function(result)
			    { 
							 
					$j('.output').html(result);
			    	
			    },
			    error: function (result)
			    {
			    	alert("실패");
			    }
			});
			
			
			
			
		}); // end of onclick
	}); // end of document

</script>



</body>
</html>