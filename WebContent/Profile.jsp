<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="Test.DatabaseHelper" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<% ArrayList<String> DayWeek = (ArrayList<String>)request.getAttribute("weekdays");
%>
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
		  element.setAttribute('src', 'userPink.png');
		}

		function unhover2(element) {
		  element.setAttribute('src', 'user.png');
		}
</script>
<% DatabaseHelper db = new DatabaseHelper();
	ArrayList<String> Groups = db.GetGroups((Integer)session.getAttribute("loginID"));
	String username = db.GetUser((Integer)session.getAttribute("loginID"));
	Integer usernameID = (Integer)session.getAttribute("loginID");
	System.out.println("username: " + usernameID);
%>
</head>
<link rel="stylesheet" type="text/css" href="Profile.css" />
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
<a id="GroupCreation" href = "${pageContext.request.contextPath}/CreateGroup.jsp">Create New Group</a>
	</div>
<div class="wrapper">
<div class ="calendar" style="top:10px";>
<div class = "groups" id = "groups" style="visibility: hidden; position:relative;height: 10%;">
  		<h3>Group's you are a member of:</h3>
  		<div class="member">
  		<div class ="listI">
  		<%if (Groups!=null){ %>
  		<%for(int i = 0; i<Groups.size();i++){ %>
  			<a href="/Plannrly/WaitingLobby?groupName=<%=Groups.get(i)%>"><%=Groups.get(i) %></a> <br>
  		<%}} %>
  		</div>
 		 </div>
 	 </div>
<!--  <div class = "notifications" id = "notifications" style="visibility: hidden; position:absolute;top: 15%;">
  		<p>Pending Notifications:</p>
  		<div class="member">
  			<div>Notification 1</div> 
  			<div>Notification 2</div>
  			<div>Notification 3</div>
 		 </div>
 	 </div> -->
  <main>
    <div class="toolbar" id = "toolbar" style="position:absolute; top: 20%;">
      <div id ="toggle" class="toggle">
        <div class="toggle__option toggle__option--selected">APRIL 2019</div>
      </div>
    </div>
    <div class="calendar" id ="calendar" style="top:28%; position:absolute; width: 80%;">
      <div class="calendar__header">
        <div><%=DayWeek.get(0) %></div>
        <div><%=DayWeek.get(1) %></div>
        <div><%=DayWeek.get(2) %></div>
        <div><%=DayWeek.get(3) %></div>
        <div><%=DayWeek.get(4) %></div>
        <div><%=DayWeek.get(5) %></div>
        <div><%=DayWeek.get(6) %></div>
      </div>
     <%for(int i = 0;i<5;i++){%>
      <div class="calendar__week">
      <%for(int j = 1;j<8;j++){ 
      Integer num = j + i*7;
      	if(num<31){
      		if(db.getActivities(usernameID,num).size()>0){%>	
      			<div class="calendar__day day" style="background-color: #ffb3b3;"><%=num %>
      			<%for(int k = 0;k<db.getActivities(usernameID,num).size();k++){ %>
      				<%if(db.getActivityGroup(db.getActivities(usernameID,num).get(k)) == -1){
      					String Time = "Morning";
      					if(db.getActivityTime(db.getActivities(usernameID,num).get(k)) == 2){Time = "Afternoon";}
      					else if(db.getActivityTime(db.getActivities(usernameID,num).get(k)) == 3){Time = "Night";}				
      				String ActivityName = db.getActivityName(db.getActivities(usernameID,num).get(k));%>
      					<br><a style="color:grey;"><%=ActivityName %></a> (Time: <%=Time%>)
      				<%} %>
      			<%} %></div>
      		<%}
      		else{%>	
        	<div class="calendar__day day"><%=num %></div>
        	<%}%>
        <%}
      	if(num>=31){ num = num-30;%>
        <div class="calendar__day day"><%=num%></div>
        <%}}%>
      </div>
      <%} %>
      
    </div>
  </main>
  </div>
  <sidebar>
    <div class="logo"></div>
    <div class="avatar">
      <div class="avatar__img">
        <img src="user.png" style= "width:130px;" alt="avatar" onmouseover="hover2(this);" onmouseout="unhover2(this);">
      </div>
      <div class="avatar__name"><%= username %></div>
    </div>
    <nav class="menu">
          <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;background-color:none;font-family: Futura; font-size:16px;" class="menu__text" onclick="Calendar()">Calendar</button>
      </div>
      <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;background-color:none;font-family: Futura; font-size:16px;" class="menu__text" onclick="Groups()">Groups</button>
      </div>
     <!--  <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;background-color:none;font-family: Futura; font-size:16px;"class="menu__text" onclick="Notifications()">Notifications</button>
      </div> -->
    </nav>
  </sidebar>
  <script>
  	function Groups(){
          document.getElementById('groups').style.visibility = 'visible';
          document.getElementById('calendar').style.visibility = 'hidden';
          document.getElementById('toolbar').style.visibility = 'hidden';
          document.getElementById('notifications').style.visibility = 'hidden';

      } 
  	function Calendar(){
        document.getElementById('groups').style.visibility = 'hidden';
        document.getElementById('calendar').style.visibility = 'visible';
        document.getElementById('toolbar').style.visibility = 'visible';
        document.getElementById('notifications').style.visibility = 'hidden';

    }
  	function Notifications(){
  		 document.getElementById('notifications').style.visibility = 'visible';
        document.getElementById('groups').style.visibility = 'hidden';
        document.getElementById('calendar').style.visibility = 'hidden';
        document.getElementById('toolbar').style.visibility = 'hidden';

    }
  </script>
</div>
</body> 
</html>
