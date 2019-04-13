<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- CAN ONLY BE ACCESSED BY GROUP LEADER TO ADD MEMBERS AND CREATE GROUP NAME -->
<head>
<meta charset="UTF-8">
<title>Group Creating Page</title>
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

<form> 
<input type="text">Group Name 
<input type="text">Member Names
<input type="submit">Submit
</form>

</body>
</html>