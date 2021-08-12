<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		var idFlag = false;
		
		$j('#userId').blur(()=>{
			
			var regex = /^[0-9a-z]{6,15}$/g;
			
			var userId = $j('#userId').val();
			var list = '';
			if (userId == "") {
		        list += '<p style="color:red; font-size: 10px;">필수 정보입니다.</p>';
		    }else if(!regex.test(userId)) {
	            list += '<p style="color:red; font-size: 10px;">아이디는 숫자나 영문 6~15자 여야합니다</p>';
	        }
	        $j('.idCheck_output').html(list);
			idFlag = false;
		})// end of userId.blur
		
		$j('#userId').keyup(()=>{
			
			var regex = /^[0-9a-z]{6,15}$/g;
			
			var userId = $j('#userId').val();
			var list = '';
			
			if(!regex.test(userId)) {
	            list += '<p style="color:red; font-size: 10px;">아이디는 숫자나 영문 6~15자 여야합니다</p>';
	        }
	        $j('.idCheck_output').html(list);
			idFlag = false;
			
		});// end of id keyup
		
		$j('#userPw').keyup(()=>{
			
			var password = $j('#userPw');
			var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,12}/;

			var list = '';
			
	 		if (!regex.test(password.val())) {
	             list += '<p style="color:red; font-size: 10px;">비밀번호는 6~12자리, 대문자, 소문자, 숫자, 특수문자를 하나이상 포함해주세요</p>';
	 		}
			$j('.pwMessage_output').html(list);
			
		});//end of pw.keyup
		
		$j('#password_check').keyup(()=>{
			
			var password = $j('#userPw');
			var password_check = $j('#password_check');
			var pwMsg = $j('.pwMessage_output');
			
			var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,12}/;

			var pwVal = password.val();
			var pwCkVal = password_check.val();
			
			var list = '';
			
			if(!regex.test(pwVal)){
				list += '<p style="color : red; font-size : 10px;">비밀번호는 6~12자리, 대문자, 소문자, 숫자, 특수문자를 하나이상 포함해주세요</p>';
			}else if(!regex.test(pwCkVal)){
				list += '<p style="color : red; font-size : 10px;">비밀번호는 6~12자리, 대문자, 소문자, 숫자, 특수문자를 하나이상 포함해주세요</p>';
			}else if (pwVal == pwCkVal) {
				list += '<p style="color : green; font-size : 10px;">비밀번호가 일치합니다.</p>';
			}else if(pwVal != pwCkVal){
				list += '<p style="color : red; font-size : 10px;">비밀번호가 일치하지 않습니다.</p>';
			}else if(pwVal == ''){
				list += '<p style="color : red; font-size : 10px;">비밀번호를 입력해주세요</p>';
				
			}
			
			pwMsg.html(list);
		}); // end of pw check. keyup
		
		$j('#userName').keyup(()=>{

			var userName = $j('#userName');
			var nameVal = userName.val();
			var name = '';
			
			var regex = /[^ㄱ-ㅣ가-힣a-zA-Z]/gi;
				
			var list = '';
			var nameMsg = $j('.nameMessage_output');
			
			if (nameVal.length <= 5) {
				name = nameVal;
			}else{
				name += nameVal.substr(0,5); 
			}
			userName.val(name);
			
			
			if (regex.test(nameVal) || nameVal == '') {
				list += '<p style="color : red; font-size : 10px;">한글 또는 영문 이름을 작성하세요</p>';	
				userName.focus();
			}else{
				list += '<p style="color : green; font-size : 10px;">올바른 이름입니다.</p>';		
			}
			nameMsg.html(list);
		});// end of name.keyup
		
		$j('#userPhone2').keyup(()=>{
			var userPhone = $j('#userPhone2');
			var phoneMsg = $j('.phoneMessage_output');
			var phoneVal = userPhone.val();
			
			var regex = /^\d{4}/;
			var list = '';
			
			if (!regex.test(phoneVal)) {
				list += '<p style="color : red; font-size : 10px;">4자리 숫자를 입력해주세요.</p>';			
			}
			phoneMsg.html(list);
			
		});
		
		$j('#userPhone3').keyup(()=>{
			var userPhone2 = $j('#userPhone2');
			var userPhone3 = $j('#userPhone3');
			
			var phoneMsg = $j('.phoneMessage_output');
			
	        var phoneVal2 = userPhone2.val();
			var phoneVal3 = userPhone3.val();

			var regex2 = /^\d{4}/;
			var regex3 = /^\d{4}/;
			
			var preCheck = regex2.test(phoneVal2);
			var subCheck = regex3.test(phoneVal3);
			
			var list = '';
			
			if (preCheck && subCheck && phoneVal2 != '' && phoneVal3 != '') {
				// 올바른 전화번호
				list += '<p style="color : green; font-size : 10px;">올바른 전화번호입니다.</p>';	
			}else{
				list += '<p style="color : red; font-size : 10px;">4자리 숫자를 입력해주세요</p>';			
			}
			phoneMsg.html(list);
		});// end of phone3 blur
		
		
		$j('#userAddr1').keyup(function() {
	        var userAddr1 = $j('#userAddr1');
	        var addrVal = userAddr1.val();

	        var address = addrVal.replace(/[^0-9]/g, "");
	        var postNo = '';
	        
	        if(address.length < 4){
	        	postNo = address;
	        }else if(address.length < 7){
	        	postNo += address.substr(0,3);
	        	postNo += '-';
	        	postNo += address.substr(3);
	        }
	        userAddr1.val(postNo);
	        
	        
	    }); // end of address.blur
		
		
		$j("#nested_check").on("click",function(){
			var regex = /^[0-9a-z]{6,15}$/g;
			var userId = $j('#userId').val();
			
			var list = '';
			if(userId == ''){
				alert('아이디를 입력해주세요');
				$j('#userId').focus();
	            
			}else if (!regex.test(userId)) {
				alert('아이디는 숫자나 영문 6~15자 여야합니다. 아이디를 변경해주세요');
	            $j('#userId').focus();
	            
			}else{
				$j.ajax({
				    url : "/board/userid_check.do",
				    dataType: "json",
				    type: "POST",
				    data : {
				    	"userId" : userId
				    },
				    success: function(data, textStatus, jqXHR)
				    {
				    	if (data.success == 'Y') {

				    		alert("중복되는 아이디가 있습니다. 아이디를 변경해주세요");
				    		$j('#userId').focus();
				    		
						}else{
							alert("아이디 " + userId + " 를 사용하셔도 좋습니다.");
					        $j('.idCheck_output').html('');
							idFlag = true;
						}
				    	
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
						alert('중복되는 아이디가 있습니다. 아이디를 변경해주세요');
						$j('#userId').focus();
				    }
				});	
			}
		});
		
		
		$j("#submit").on("click",function(){
			var $frm = $j('.memberRegister :input');
			var param = $frm.serialize();
			
			var pwRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,12}/;
			var idRegex = /^[0-9a-z]{6,15}$/g;
			var addrRegex = /^\d{3}-\d{3}$/;

			var userId = $j('#userId').val();
			var userPw = $j('#userPw').val();
			var userPwCk = $j('#password_check').val();
			var userName = $j('#userName').val();
			var userPhone1 = $j('#userPhone2').val();
			var userPhone2 = $j('#userPhone3').val();
			var userAddr = $j('#userAddr1').val();
			
			
			var addrFlag = true;
			var list = '';
			
			if (userAddr.length > 0) {
				if(!addrRegex.test(userAddr)){
					alert('123-456 형식으로 6자리 우편번호를 작성해 주세요');
					$j('#userAddr1').focus();
					addrFlag = false;
				}
			}else{
				addrFlag = true;
			}
			
			
			if (userId == '') {
  				alert('아이디를 입력해주세요');
  				$j('#userId').focus();
  				
  				list += '<p style="color:red; font-size: 10px;">필수 정보입니다.</p>';
  		        $j('.idCheck_output').html(list);
			}else if(!idRegex.test(userId)) {
				alert('아이디의 형식을 확인해주세요');
  				$j('#userId').focus();

			}else if(idFlag != true){
				alert('아이디 중복확인을 해주세요');
				$j('#userId').focus();
				
			}else if (userPw == '') {
				alert('비밀번호를 입력해주세요');
				$j('#userPw').focus();
				
			}else if(!pwRegex.test(userPw)){
				alert('비밀번호는 6~12자리, 대문자, 소문자, 숫자, 특수문자를 하나이상 포함해주세요');
				$j('#userPw').focus();

			}else if (userPwCk == '') {
				alert('비밀번호를 확인해주세요');
				$j('#password_check').focus();
				
			}else if(!pwRegex.test(userPwCk)){
				alert('비밀번호를 형식에 맞지 않습니다. 확인해주세요');
				$j('#password_check').focus();
			
			}else if(userPw != userPwCk){
				alert('비밀번호가 일치하지 않습니다. 확인해주세요');
				$j('#password_check').focus();
			
			}else if (userName == '') {
				alert('이름을 입력해주세요');
				$j('#userName').focus();
				
			}else if (userPhone1 == '') {
				alert('전화번호를 입력해주세요.');
				$j('#userPhone2').focus();
				
			}else if(userPhone1.length != 4){
				alert('4자리 숫자를 입력해주세요.');
				$j('#userPhone2').focus();
				
			}else if(userPhone2 == ''){
				alert('전화번호를 입력해주세요.');
				$j('#userPhone3').focus();
				
			}else if (userPhone2.length != 4) {
				alert('4자리 숫자를 입력해주세요.')
				$j('#userPhone3').focus();
			
			}else if(addrFlag = true){
				
				$j.ajax({
				    url : "/board/registerAction.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
						alert("회원 가입 성공");
						
						alert("메시지 : " + data.success);
						
						location.href = "/board/boardList.do?pageNo=1";
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert('회원가입 실패');
				    	console.log(data.success);
				    	console.log(textStatus);
				    	console.log(jqXHR);
				    }
				});	
			}
			
			
		});
		
		$j("input:text[numberOnly]").on("keyup", function() {
		      $j(this).val($j(this).val().replace(/[^0-9]/g,""));
		});
		
		$j("input:text[nameOnly]").on("keyup", function() {
		      $j(this).val($j(this).val().replace(/[^ㄱ-ㅣ가-힣a-zA-Z]+$/g,""));
		});
		
		$j("input:text[idOnly]").on("keyup", function() {
		      $j(this).val($j(this).val().replace(/[^0-9a-z]+$/g,""));
		});
		
	

	});

</script>

<body>


<form action="/board/registerAction.do" method="post" class="memberRegister">
<table align="center">
	<tr>
		<td>
			<a href="/board/boardList.do?pageNo=1" >List</a>
		</td>
	</tr>
	<tr>
		<td>
			<table border = "1">
				<tr>
					<td> ID </td>
					<td>
						<input type="text" name="userId" id="userId" maxlength="15" idOnly>
						<button type="button" id="nested_check">중복체크</button>
                        <p style="font-size:10px">숫자나 소문자로 시작하는 15자 아이디.</p>
						<div class="idCheck_output"></div>
					</td>
				</tr>
				<tr>
					<td> PASSWORD </td>
					<td>
						<input type="password" name="userPw" id="userPw" maxlength="12">
                        <p style="font-size:10px">대소문자/숫자/특수문자를 모두 하나이상 포함하는 6~12 자리 비밀번호.</p>
            
					</td>
				</tr>
				<tr>
					<td> PASSWORD CHECK </td>
					<td>
						<input type="password" id="password_check" maxlength="12">
						<div class="pwMessage_output"></div>
					</td>
				</tr>
				<tr>
					<td> NAME </td>
					<td>
						<input type="text" name="userName" id="userName" maxlength="5" nameOnly>
						<div class="nameMessage_output"></div>
					</td>
				</tr>
				<tr>
					<td> PHONE </td>
					<td>
						<select name="userPhone1" id="phone-select">
								<c:forEach var="code" items="${comCodeList }" varStatus="status">
								    <option value="${code.codeId }">${code.codeName }</option>
								</c:forEach>
						</select> -
  						<input type="text" name="userPhone2" id="userPhone2" maxlength="4" numberOnly> -
  						<input type="text" name="userPhone3" id="userPhone3" maxlength="4" numberOnly>
						<div class="phoneMessage_output"></div>
					</td>
				</tr>
				<tr>
					<td> POST No </td>
					<td>
						<input type="text" name="userAddr1" id="userAddr1" maxlength="7">
						<div class="addrMessage_output"></div>
					</td>
				</tr>
				<tr>		
					<td> ADDRESS </td>
					<td>
						<input type="text" name="userAddr2" id="userAddr2" maxlength="50">
						
					</td>
				</tr>
				<tr>
					<td> COMPANY </td>
					<td>
						<input type="text" name="userCompany" maxlength="20">
					</td>
				</tr>
				
			</table>
			<br>
			<input type="button" id="submit" value="회원가입">
		</td>
	</tr>
</table>

</form>
</body>
</html>