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
<link rel="stylesheet"
	href="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.4/jquery.mobile-1.4.4.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						$(".buddy")
								.on(
										"swiperight",
										function() {
											$(this).addClass('rotate-left')
													.delay(700).fadeOut(1);
											$('.buddy').find('.status')
													.remove();

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
												alert('OUPS');
											} else {
												$(this)
														.next()
														.removeClass(
																'rotate-left rotate-right')
														.fadeIn(400);
											}
										});

					});
</script>
</head>
<body>
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

</body>
</html>