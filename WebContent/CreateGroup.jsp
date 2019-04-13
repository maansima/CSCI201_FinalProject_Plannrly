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
<link rel="stylesheet" type="text/css" href="CreateGroup.css" />
<body>
<div id = "header"> 
<img id="logo" src = "plannrly.jpg"></img> 
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>
<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>

<form onsubmit="groupCreation"> 
<input type="text" name="name">Group Name 
<input type="text" name="members">Member Names
<input type="submit">Submit
</form>

</body>
</html>