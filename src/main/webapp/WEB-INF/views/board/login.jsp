<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>login</title>
</head>

<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
    		var userId = $j('#userId');
    		var userPw = $j('#userPw');
    		
    		$j.ajax({
			    url : "/board/userid_check.do",
			    dataType: "json",
			    type: "POST",
			    data : {
			    	"userId" : userId.val()
			    },
			    success: function(data, textStatus, jqXHR)
			    {
			    	
			    	if(userId.val() == ''){
		    			alert('아이디를 입력해주세요');
		    			userId.focus();
			    		
			    	}else if (data.success != 'Y') {
			    		alert('회원가입되어진 아이디가 없습니다. 아이디를 확인해주세요');
			    		userId.focus();
		    			
		    		}else if(userPw.val() == ''){
		    			alert('비밀번호를 입력해주세요');
		    			userPw.focus();
		    			
		    		}else if(userPw.val() != data.users.userPw){
		    			alert('비밀번호가 틀렸습니다. 확인해주세요');
		    			userPw.focus();
		    		}else{
		    			var $frm = $j('#login :input');
		    			var param = $frm.serialize();
		    			
		    			$j.ajax({
		    			    url : "/board/loginAction.do",
		    			    dataType: "json",
		    			    type: "POST",
		    			    data : param,
		    			    success: function(data, textStatus, jqXHR)
		    			    {
		    					alert("로그인 성공");
		    					
		    					alert("메세지:"+data.success);
		    					
		    					location.href = "/board/boardList.do?pageNo=1";
		    			    },
		    			    error: function (jqXHR, textStatus, errorThrown)
		    			    {
		    			    	alert("로그인 실패");
		    			    }
		    			});
		    		}
			    	
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
					console.log(jqXHR);	
			    }
			});
    		
    		
    		
    		
		});
	});

</script>
<body>
	<form action="/board/loginAction.do" id="login" method="post">
		<table align="center">
			<tr>
				<td align="left">
					<a href="/board/boardList.do">List</a>
				</td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td>
								ID
							</td>
							<td>
								<input type="text" name="userId" id="userId">
							</td>
						</tr>
						<tr>
							<td>
								PASSWORD
							</td>
							<td>
								<input type="password" name="userPw" id="userPw">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="button" id="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>