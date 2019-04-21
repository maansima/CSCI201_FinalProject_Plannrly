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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="tinderCss.css" />
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>
<script>

$.mobile.autoInitializePage = false;
var array = '';
var timesVoted =0;

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

	$(document)
			.ready(
					function() {

						$(".buddy")
								.on(
										"swiperight",
										function() {
											timesVoted++;
											$(this).addClass('rotate-left')
													.delay(700).fadeOut(1);
											$('.buddy').find('.status')
													.remove();
											var index = $(this).index()+1;
											array+=(document.getElementById("placeName"+index).innerText +",");
											document.getElementById('hiddenField').value = array;
											if(timesVoted==5){
												alert("All Done Voting!");
												document.hiddenForm.submit();
											}
											$(this)
													.append(
															'<div class="status like">Like!</div>');
											if ($(this).is(':last-child')) {
												$('.buddy:nth-child(1)')
														.removeClass(
																'rotate-left rotate-right')
														.fadeIn(300);
						
											} else {
												$(this)
														.next()
														.removeClass(
																'rotate-left rotate-right')
														.fadeIn(400);
											}
										});

						$(".buddy")
								.on(
										"swipeleft",
										function() {
											timesVoted++;
											if(timesVoted==5){
												alert("All Done Voting!");
												document.hiddenForm.submit();
											}
											$(this).addClass('rotate-right')
													.delay(700).fadeOut(1);
											$('.buddy').find('.status')
													.remove();
											$(this)
													.append(
															'<div class="status dislike">Dislike!</div>');

											if ($(this).is(':last-child')) {
												$('.buddy:nth-child(1)')
														.removeClass(
																'rotate-left rotate-right')
														.fadeIn(300);
	
											} else {
												$(this)
														.next()
														.removeClass(
																'rotate-left rotate-right')
														.fadeIn(400);
											}
										});

					});
	
	function hover(element) {
		  element.setAttribute('src', 'plannrlyPink.png');
		}

		function unhover(element) {
		  element.setAttribute('src', 'plannrly.jpg');
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
	<div id="container">
		<%
			ArrayList<FinalYelpObj> activitiesList = (ArrayList<FinalYelpObj>) request.getAttribute("resultList");
			int z = 1;
			for (FinalYelpObj i : activitiesList) {
				for (int j = 0; j < 5; j++) {
		%>
		<div class="buddy" style="display: block;">
			<div class="avatar"
				style="display: block; background-image: url(<%=i.getBusinesses().get(j).getImageUrl()%>);">
				<span id="placeName<%=z%>" style="z-index:<%=z%>"><%=activitiesList.get(0).getBusinesses().get(j).getName()%>
				</span>

			</div>
		</div>
		<%
			z++;
				}
			}
		%>
	</div>

<form name="hiddenForm" action="VotingServlet" method="GET" style="display:none;" >
<input type="text" name="hiddenField" id="hiddenField" value="" />
<input type="text" name="groupName" id="hiddenField" value="<%=request.getAttribute("groupName")%>" />
<input type="submit" id="button" value="Submit form">
</form>
</body>
</html>