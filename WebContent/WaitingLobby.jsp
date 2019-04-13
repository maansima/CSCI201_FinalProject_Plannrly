<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- CAN BE ACCESSED BY ALL GROUP MEMBERS, REDIRECT TO VOTE FROM HERE AND SHOW 
ONLINE MEMBERS IE. NETWORKING PORTION -->
<head>
<meta charset="UTF-8">
<title>Waiting Lobby</title>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID") %>
	if(userID == 0){
		document.getElementById("SignOut").style.display = "none";
		document.getElementById("Profile").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
	}
}
</script>
</head>
<body>

</body>
</html>