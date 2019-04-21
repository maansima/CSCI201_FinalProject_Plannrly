<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

<%@page import="Test.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="Test.Business,Test.Category,Test.Center, Test.Coordinates,Test.FinalYelpObj, 
Test.Location,Test.Region,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="VotingCss.css" />
<title>Lets Vote!</title>
<script>
function hover(element) {
	  element.setAttribute('src', 'plannrlyPink.png');
	}

	function unhover(element) {
	  element.setAttribute('src', 'plannrly.jpg');
	}
</script>
</head>
<body>
    <%
			ArrayList<FinalYelpObj> activitiesList = (ArrayList<FinalYelpObj>) request.getAttribute("resultList");
    		int z = 1;
			for (FinalYelpObj i : activitiesList) {
				for (int j=0; j<5; j++) {
				%>
				<div id="mydiv">
				<div id="mydivheader"><img id="pic<%=z%>" src="<%=i.getBusinesses().get(j).getImageUrl()%>" style="z-index:<%=z%>"></img></div>
					<span id="placeName<%=z%>" style="z-index:<%=z%>"><%=activitiesList.get(0).getBusinesses().get(j).getName() %> </span>
				</div>	
			 <%
			 z++;
				}
			}
		%>

<script>
var jsArray = [<% for (int i = 0; i < 5; i++) { %>"<%= activitiesList.get(0).getBusinesses().get(i).getName() %>"<%= i + 1 < 5 ? ",":"" %><% } %>];
var index = <%=z%>-1;
function noClicked(){
	document.getElementById("pic"+index).style.display="none";
	document.getElementById("placeName"+index).style.display="none";
	index--;
	jsArray.splice(index,1);
	alert(jsArray);
}
function yesClicked(){
	document.getElementById("pic"+index).style.display="none";
	document.getElementById("placeName"+index).style.display="none";
	index--;
}

</script>
<div id="buttons">
  <button id="but-nope" onclick="noClicked()" >X</button>
  <button id="but-yay" onclick="yesClicked()">✔</button>
 </div>
</body>
</html>