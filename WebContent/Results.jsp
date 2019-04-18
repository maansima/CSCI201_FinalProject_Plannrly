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
	var userID = <%= session.getAttribute("loginID") %>;
	var Voted = <%=session.getAttribute("voting")%>;
	if(Voted ==0){
		document.getElementById("novoting").style.display = "none";
		 document.getElementById("novoting1").style.display = "none";<
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
<% 	
	Integer voting = (Integer)request.getAttribute("voting");
	String Image =(String) request.getAttribute("ImageURL");
 String Phone = (String)request.getAttribute("PhoneNum");
 String URL = (String)request.getAttribute("YelpURL");
 Double Latitude = (Double)request.getAttribute("Latitude");
 Double Longitude = (Double)request.getAttribute("Longitude");
 String Price = (String)request.getAttribute("Price");
 Double Rating = (Double)request.getAttribute("Rating");
 String Name = (String)request.getAttribute("Name");
 String Location = (String)request.getAttribute("Location");
 
%>
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
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
	</div>
<div class="w3-content" style="max-width:1400px">

<!-- Header -->
<header class="w3-container w3-center w3-padding-32" style="visibility:none;" id = "header"> 
  <% if(voting!=null){%>
  <h1><<b>The results of <span style="visibility:none;" class="w3-tag">Group's Name</span> vote is...</b></h1>
      <%} %>
</header>
<!-- Grid -->
<div class="w3-row">
<!-- Activities -->
<div class="w3-col l8 s12">
  <!-- Activity Info  -->
  <div class="w3-card-4 w3-margin w3-white">
    <img src="<%=Image%>" alt="ActivityPic" style="width:400px; max-height:400px; positionn:absolute;"> <span>
    <div id="floating-panel">
    <b>Mode of Travel: </b>
    <select id="mode">
      <option value="DRIVING">Driving</option>
      <option value="WALKING">Walking</option>
      <option value="BICYCLING">Bicycling</option>
      <option value="TRANSIT">Transit</option>
    </select>
    </div>
    <div id="map"></div>
    <script>
      function initMap() {
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          //change center to vars lat and lng that are in btw star and end address
          center: {lat: 37.77, lng: -122.447}
        });
        directionsDisplay.setMap(map);

        calculateAndDisplayRoute(directionsService, directionsDisplay);
        document.getElementById('mode').addEventListener('change', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        var selectedMode = document.getElementById('mode').value;
        directionsService.route({
        	//var originin and destination need to be passed in as a var
          origin: {lat: 37.77, lng: -122.447},  // Haight.
          destination: {lat: 37.768, lng: -122.511},  // Ocean Beach.
          // Note that Javascript allows us to access the constant
          // using square brackets and a string value as its
          // "property."
          travelMode: google.maps.TravelMode[selectedMode]
        }, function(response, status) {
          if (status == 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCHJyoIlrEsW-fR_x3YfRpwAUqpUAvqs6k&callback=initMap" style="width:25%;position:absolute;">
    </script>
    </span>
    <div class="w3-container">
      <h3><b><%=Name %></b></h3>
      <h5><span class="w3-opacity"><pre><%=Price %></pre></span>
    </div>
    <div class="w3-container">
      <p>Rating: <%=Rating%></p>
      <p><%=Location%></p>
      <div class="w3-row">
        <div class="w3-col m8 s12">
          <p><button class="w3-button w3-padding-large w3-white w3-border" onclick="window.location.href='<%=URL%>'"><b>READ MORE &raquo;</b></button></p>
        </div>
        <div class="w3-col m4 w3-hide-small">
        <%if(voting == null){ %>
        <form type=GET action="/ServletAddActivity">
        	<input type="date" style="width:100px;"id="start" name="trip-start"
      			 placeholder="2019-04-16"
       			min="2019-04-16" max="2019-04-31"></br>
       			<span></span><input type=radio name="time" value="Morning">Morning <input type=radio name="time" value="Afternoon">Afternoon <input type=radio name="morning" value="Night">Night </span>
          <p><span class="w3-padding-large w3-right"><button style="border:none; background-color:white;" onclick="submit">ADD TO CALENDAR &nbsp;</button></span></p>
          </form>
          <%} %>
          </div>
        </div>
      </div>
    </div>
  <hr>
<!-- END ACTIVITY INFO -->
</div>

<!-- Group Members menu -->
<% if(voting!=null){%>
<div class="w3-col l4" id ="groups">
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
<%} %>

<!-- END GRID -->
</div><br>

<!-- END w3-content -->
</div>

</body>
</html>
