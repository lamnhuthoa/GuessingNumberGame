<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.GameNumber" %>

<% 
	//input
	String userGuessStr = request.getParameter("guess");
	GameNumber guess = new GameNumber(Integer.parseInt(userGuessStr));
	
	String minGuessStr = request.getParameter("minimum");
	GameNumber minimum = new GameNumber(Integer.parseInt(minGuessStr));

	String maxGuessStr = request.getParameter("maximum");
	GameNumber maximum = new GameNumber(Integer.parseInt(maxGuessStr));

	String targetStr = request.getParameter("target");
	GameNumber target = new GameNumber(Integer.parseInt(targetStr));
	
	GameNumber guesses = new GameNumber(Integer.parseInt(request.getParameter("guesses")));

	String alert = "";
	
	if(guess.getValue() == target.getValue()){
		//user đoán đúng
		alert = "Chúc mừng bạn đã đoán đúng sau " + guesses.getValue() + " lần đoán";
	} else {
		guesses.increment();
		if(guess.getValue() < target.getValue()){
			alert = "Số vừa đoán nhỏ hơn đáp án";
		} else {
			alert = "Số vừa đoán lớn hơn đáp án";
		}
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Game</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link href="./assets/css/style.css" rel="stylesheet" />
	</head>
	<body>
		<div class="container game_container">
			<div class="game_card">
				<h1>Game Đoán Số</h1>
				
				<p class="text_alert_ketqua"><%= alert %></p>
				
				<% 
					if(guess.getValue() == target.getValue()){
				%>	
					<p class="answer_of_target">Số ngẫu nhiên là <%= target.getValue() %></p>
					<div class="text-center">
						<a href="index.jsp" class="play_again_action btn btn-warning">Play again!?</a>
					</div>
				<%
					} else {
				%>
				
					<form method="post" action="guess.jsp" name="guessForm">
						<label class="label_input">Lần đoán <%= guesses.getValue() %>:</label>
						
						<input type="text" name="guess" class="input" value="0"/>
						<br/>
						<button type="submit" name="guessButton" class="btn btn-success btn_doanSo">Go</button>
						
						<input type="hidden" name="minimum" value="<%= minimum.getValue() %>" />
						<input type="hidden" name="maximum" value="<%= maximum.getValue() %>" />
						<input type="hidden" name="target" value="<%= target.getValue() %>" />
						<input type="hidden" name="guesses" value="<%= guesses.getValue() %>" />
					</form>
				<%
					}
				%>
			</div>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	</body>
</html>