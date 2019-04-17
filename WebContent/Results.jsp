<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
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
</script>
</head>
<style>
body  {
	height: 100%; 
	width: 100%;
	font-family: Futura,Trebuchet MS,Arial,sans-serif; 
}

#header #logo {
	height: 100px; 
	width: auto;
}

#Profile {
	float: right;
	padding: 10px;
	padding-right: 30px;
}

#SignOut {
	float: right;
	padding: 10px;
}

#Login{
	float: right;
	padding: 10px;
}

#SignUp{
	float: right;
	padding: 10px;
	padding-right: 30px;
}

a{
	text-decoration: none;
	color: black; 
}
</style>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
	</div>
<!-- w3-content defines a container for fixed size centered content, 
and is wrapped around the whole page content, except for the footer in this example -->
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
<header class="w3-container w3-center w3-padding-32"> 
  <h1><b>The results of <span class="w3-tag">Group's Name</span> vote is...</b></h1>
</header>
<!-- Grid -->
<div class="w3-row">
<!-- Blog entries -->
<div class="w3-col l8 s12">
  <!-- Blog entry -->
  <div class="w3-card-4 w3-margin w3-white">
    <img src="/w3images/woods.jpg" alt="ActivityPic" style="width:60%; positionn:absolute;"> <span><img src="/w3images/woods.jpg" alt="GoogleMapsPic" style="width:25%;position:absolute;"></span>
    <div class="w3-container">
      <h3><b>ACTIVITY NAME</b></h3>
      <h5><span class="w3-opacity"><pre>Type of Activity  $$</pre></span>
    </div>

    <div class="w3-container">
      <p>Description of the activity</p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><button class="w3-button w3-padding-large w3-white w3-border"><b>READ MORE &raquo;</b></button></p>
        </div>
        <div class="w3-col m4 w3-hide-small">
          <p><span class="w3-padding-large w3-right"><b>ADD TO CALENDAR &nbsp;</b></span></p>
        </div>
      </div>
    </div>
  </div>
  <hr>
<!-- END BLOG ENTRIES -->
</div>

<!-- Introduction menu -->
<div class="w3-col l4">
  <!-- About Card -->
  <div class="w3-card w3-margin w3-margin-top">
    <div class="w3-container w3-white">
      <h4><b>Group Name</b></h4>
      <p>Group Members</p>
      <p>Member 1</p>
      <p>Member 2</p>
      <p>member 3</p>
      <p>Member 4</p>
    </div>
  </div>
<!-- END Introduction Menu -->
</div>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>

</body>
</html>
