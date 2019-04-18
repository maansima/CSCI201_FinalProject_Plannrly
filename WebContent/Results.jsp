<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Test.DatabaseHelper, java.util.ArrayList"%>
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
	var userID = <%= session.getAttribute("loginID") %>;
	var Voted = <%=session.getAttribute("voting")%>;
	if(Voted ==0){
		document.getElementById("novoting").style.display = "none";
		 document.getElementById("novoting1").style.display = "none";
	}
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
</script>
<% 	DatabaseHelper db = new DatabaseHelper();
	String GroupName = (String)request.getAttribute("Groupname");
	System.out.println("GROUP NAME:"+GroupName);
	ArrayList<Integer> MembersID = db.GetGroupMembers(GroupName);
	String voting = (String)request.getAttribute("Groupname");
	String Image =(String) request.getAttribute("ImageURL");
 String Phone = (String)request.getAttribute("PhoneNum");
 String URL = (String)request.getAttribute("YelpURL");
 Double Latitude = (Double)request.getAttribute("Latitude");
 Double Longitude = (Double)request.getAttribute("Longitude");
 String Price = (String)request.getAttribute("Price");
 Double Rating = (Double)request.getAttribute("Rating");
 String Name = (String)request.getAttribute("Name");
 String Name2 = ((String)request.getAttribute("Name")).replace(" ", "*");
 String Location = (String)request.getAttribute("Location");
 request.setAttribute("Name", Name); 
%>
</head>
<style>
.container{
display:flex;
}
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
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 425px;
      }
      /* Optional: Makes the sample page fill the window. */
      htmlmap, bodymap {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
     form #dateHolder{
		height: 30px;
	}
}
</style>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>

	</div>
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
<header class="w3-container w3-center w3-padding-32" style="visibility:none;" id = "header"> 
  <% if(GroupName!=null){%>
  <h1><<b>The results of <span style="visibility:none;" class="w3-tag"><%=GroupName%></span>'s vote is...</b></h1>
      <%} %>
        <% if(GroupName==null){%>
  <h1><b> <span style="visibility:none;" class="w3-tag"><%=Name%></span></b></h1>
      <%} %>
</header>
<!-- Grid -->
<div class="w3-row">
<!-- Activities -->
<div class="w3-col l8 s12">
  <!-- Activity Info  -->
  <div class="w3-card-4 w3-margin w3-white">
    <div class="container" style="display:in-line;">
   <span><img src="<%=Image%>" alt="ActivityPic" style="width:400px; max-height:400px;"> 
    <div id="map" style="width:400px;max-height:400px;position:absolute; right: 37%; top:30%;"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: <%=Latitude%>, lng: <%=Longitude%>};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHJyoIlrEsW-fR_x3YfRpwAUqpUAvqs6k&callback=initMap">
    </script></span> </div>
    <div class="w3-container">
      <h3><b><%=Name %></b></h3>
      <h5><span class="w3-opacity"><pre><%=Price %></pre></span></h5>
    </div>
    <div class="w3-container">
      <p>Rating: <%=Rating%></p>
      <p><%=Location%></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><button class="w3-button w3-padding-large w3-white w3-border" onclick="window.location.href='<%=URL%>'"><b>READ MORE &raquo;</b></button></p>
        </div>
        <div class="w3-col m4 w3-hide-small">
        <form method="GET" action="AddActivity" id ="add">
        	<input id="dateHolder" type="date" style="width:200px;"id="start" name="activitystart"
      			 placeholder="2019-04-16"
       			min="2019-04-16" max="2019-04-31"><br>
       			<span></span><input type=radio name="time" value="Morning">Morning <input type=radio name="time" value="Afternoon">Afternoon <input type=radio name="time" value="Night">Night </span>
       			<input name="Name" type=radio style="visibility:hidden" value=<%=Name2%> checked>
          <p><span class="w3-padding-large w3-right"><button type="submit" form="add" style="border:none; background-color:white;">ADD TO CALENDAR &nbsp;</button></span></p>
          </form>
          </div>
        </div>
      </div>
    </div>
  <hr>
<!-- END ACTIVITY INFO -->
</div>

<!-- Group Members menu -->
<% if(GroupName!=null){%>
<div class="w3-col l4" id ="groups">
  <!-- About Card -->
  <div class="w3-card w3-margin w3-margin-top">
    <div class="w3-container w3-white">
      <h4><b><%=GroupName %></b></h4>
      <p>Group Members</p>
      <%for(int i = 0; i<MembersID.size();i++){
    	  String MemberName = db.GetUser(MembersID.get(i));%>
      <p><%=MemberName %></p>
	<%} %>
    </div>
  </div>
<!-- END Introduction Menu -->
</div>
<%} %>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>

</body>
</html>
