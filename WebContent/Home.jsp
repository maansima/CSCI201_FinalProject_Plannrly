<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="HomeCss.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID")%>
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
<div id = "header"> 
<img id="logo" src = "plannrly.jpg"></img> 
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<a id="Profile" href="Profile.jsp">Profile</a>
<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>
<div>
<form> 
<input type="text" placeholder="What do you want to do?"></input> 
<input type="text" placeholder="Where do you want to go?"></input>
<input type="submit"></input>  
</form>
</div>
</body>
</html>