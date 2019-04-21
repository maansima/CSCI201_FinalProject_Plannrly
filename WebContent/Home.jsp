<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Home.css" />
<meta charset="UTF-8">
<title>Plannerly Home</title>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID") %>
	if(userID == 0){
		document.getElementById("SignOut").style.display = "none";
		document.getElementById("Profile").style.display = "none";
		document.getElementById("GroupCreation").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
		document.getElementById("GroupCreation").style.display = "initial";
	}
}

function hover(element) {
	  element.setAttribute('src', 'plannrlyPink.png');
	}

	function unhover(element) {
	  element.setAttribute('src', 'plannrly.jpg');
	}
	function hover2(element) {
	  element.setAttribute('src', 'groupPink.png');
	}

	function unhover2(element) {
	  element.setAttribute('src', 'group.png');
	}
</script>
</head>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="SignOut" href = "ServletSignOut">Sign Out</a>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
</div>

<div id="center">
<img id="group" src="group.png" onmouseover="hover2(this);" onmouseout="unhover2(this);">
<div id="form">
<form action="YelpApiTester" method="GET">
<div id="inputs">
<div id="child" >
<input name="cityName" type="text" placeholder="Where do you want to go?"></input>
<select name="activityType">
  <option value="food">Food</option>
  <option value="bars">Bars</option>
  <option value="active">Active</option>
  <option value="arts">Arts</option>
</select>
</div>
</br>
<div id="child">
<div class="submit">
</div>
<input type="submit" id="button" value="Show me activities!"></input>
</div>
</div>
</form>
</div>
</div>
</body>
</html>