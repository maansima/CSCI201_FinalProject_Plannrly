<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- CAN ONLY BE ACCESSED BY GROUP LEADER TO ADD MEMBERS AND CREATE GROUP NAME -->
<head>
<meta charset="UTF-8">
<title>Group Creating Page</title>
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

<form> 
<input type="text">Group Name 
<input type="text">Member Names
</form>

</body>
</html>