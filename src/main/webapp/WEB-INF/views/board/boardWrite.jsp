<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j('#extend').click(function() {
			  var trCnt = $j('.tr_s').length + 1;
			  
			  var list = '';
			  if (trCnt < 10) {
    			
				  list += '<tbody"><tr name="type" class="tr_s"><td>Type</td>'
    				   + '<td><select name="boardVoList[' + trCnt + '].boardType" id="type-select">'
    				   + '<c:forEach var="code" items="${comCodeList }" varStatus="status">'
    				   + '<option value="${code.codeId }">${code.codeName }</option>'
    				   + '</c:forEach></select><button type="button" id="row_delete">삭제</button></td></tr>'
    				   + '<tr name="title"><td width="120" align="center">Title</td>'
    				   + '<td width="400"><input name="boardVoList[' + trCnt + '].boardTitle" type="text" size="50" ></td></tr>'
    				   + '<tr name="comment"><td height="300" align="center">Comment</td>'
    				   + '<td valign="top"><textarea name="boardVoList[' + trCnt + '].boardComment"  rows="20" cols="55"></textarea></td></tr></tbody>';
    				   
      			  var tr = $j("thead[class=table_head]:last");
        		  tr.after(list);
        		    
			  }else{
			 
	   			  alert('최대 10개 까지만 추가할수 있습니다.');
			 
			  }
			  
		   	
		     $j('#row_delete').on('click', function(){
		  	   
		    	 var tbody = $j(this).parent().parent().parent();
		  	     tbody.remove();
		    	 trCnt -= 1;
		     });
		    
		});
		
		
		$j("#submit").on("click",function(){
			
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
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
<form class="boardWrite">
	<input type="hidden" name="creator" id="userName" value="${memberVo.userName }">

	<table align="center">
		<tr>
			<td align="right">
              <input type="button" id="extend" value="추가">
			  <input type="button" id="submit" value="작성">
			</td>
		</tr>
    
		<tr>
			<td>
				<table border ="1" name="table_1" id="tables">
                  <thead class="table_head" id="ttt">
                    <tr name="type">
						<td>
							Type
						</td>
						<td>
							<select name="boardVoList[0].boardType" id="type-select">
								<c:forEach var="code" items="${comCodeList }" varStatus="status">
								    <option value="${code.codeId }">${code.codeName }</option>
								</c:forEach>
							</select>
						</td>
					</tr> 
					<tr name="title">
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						  <input name="boardVoList[0].boardTitle" type="text" size="50" > 
						</td>
					</tr>
					<tr name="comment">
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						  <textarea name="boardVoList[0].boardComment"  rows="20" cols="55"></textarea>
						</td>
					</tr>
                </thead>
                
                <tfoot class="table_foot">
                    <tr>
    					<td align="center" width="120">
    					Writer
    					</td>
    					<td align="center" width="461">
    						${memberVo.userName }
    					</td>
                    </tr>
                </tfoot>
                 </table>
			</td>
		</tr>
    
    
    
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>