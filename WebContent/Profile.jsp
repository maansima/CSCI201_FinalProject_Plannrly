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
</script>
<% DatabaseHelper db = new DatabaseHelper();
	String username = db.GetUser((Integer)session.getAttribute("loginID"));
%>
</head>
<link rel="stylesheet" type="text/css" href="Profile.css" />
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
	</div>
<div class="wrapper">
<div class ="calendar" style="top:10px";>
<div class = "groups" id = "groups" style="visibility: hidden; position:relative;height: 10%;">
  		<p>Group's you are a member of:</p>
  		<div class="member">
  			<div>Group 1</div> 
  			<div>Group 2</div>
  			<div>Group 3</div>
 		 </div>
 	 </div>
 <div class = "notifications" id = "notifications" style="visibility: hidden; position:absolute;top: 15%;">
  		<p>Pending Notifications:</p>
  		<div class="member">
  			<div>Notification 1</div> 
  			<div>Notification 2</div>
  			<div>Notification 3</div>
 		 </div>
 	 </div>
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
      <div class="calendar__week">
        <div class="calendar__day day">1</div>
        <div class="calendar__day day">2</div>
        <div class="calendar__day day">3</div>
        <div class="calendar__day day">4</div>
        <div class="calendar__day day">5</div>
        <div class="calendar__day day">6</div>
        <div class="calendar__day day">7</div>
      </div>
      <div class="calendar__week">
        <div class="calendar__day day">8</div>
        <div class="calendar__day day">9</div>
        <div class="calendar__day day">10</div>
        <div class="calendar__day day">11</div>
        <div class="calendar__day day">12</div>
        <div class="calendar__day day">13</div>
        <div class="calendar__day day">14</div>        
      </div>
      <div class="calendar__week">
        <div class="calendar__day day">15</div>
        <div class="calendar__day day">16</div>
        <div class="calendar__day day">17</div>
        <div class="calendar__day day">18</div>
        <div class="calendar__day day">19</div>
        <div class="calendar__day day">20</div>
        <div class="calendar__day day">21</div>    
      </div>
      <div class="calendar__week">
        <div class="calendar__day day">22</div>
        <div class="calendar__day day">23</div>
        <div class="calendar__day day">24</div>
        <div class="calendar__day day">25</div>
        <div class="calendar__day day">26</div> 
        <div class="calendar__day day">27</div> 
        <div class="calendar__day day">28</div> 
      </div>
      <div class="calendar__week">
        <div class="calendar__day day">29</div>
        <div class="calendar__day day">30</div>
        <div class="calendar__day day">31</div>
        <div class="calendar__day day"></div>
        <div class="calendar__day day"></div>
        <div class="calendar__day day"></div>
        <div class="calendar__day day"></div>
      </div>
    </div>
  </main>
  </div>
  <sidebar>
    <div class="logo"></div>
    <div class="avatar">
      <div class="avatar__img">
        <img src="Ico.png" style= "width:130px;" alt="avatar">
      </div>
      <div class="avatar__name"><%= username %></div>
    </div>
    <nav class="menu">
          <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;color:gray;background-color:none;font-family: Montserrat;font-size:16px;" class="menu__text" onclick="Calendar()">Calendar</button>
      </div>
      <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;color:gray;background-color:none;font-family: Montserrat;font-size:16px;" class="menu__text" onclick="Groups()">Groups</button>
      </div>
      <div class="menu__item menu__item--active">
        <button id="button" style="border:none;background-color:white;color:gray;background-color:none;font-family: Montserrat;font-size:16px;"class="menu__text" onclick="Notifications()">Notifications</button>
      </div>
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