<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ABC Jobs | <%=request.getParameter("HTMLtitle") != null ? request.getParameter("HTMLtitle") : "ABC Jobs"%></title>

<link rel="icon" href="images/Logo.png" type="image/png">

<link rel="stylesheet" href="css/styles.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
</head>

<body>
	<header class="align-center justify-between hFont">
		<div id="headerL" class="align-center">
			<sec:authorize access="!isAuthenticated()">
				<a href="home" class="align-center text-deco-none"> <img
					src="images/Logo.png" alt="Logo" width="75" />
					<h1>ABC Jobs</h1>
				</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="dashboard" class="align-center text-deco-none"> <img
					src="images/Logo.png" alt="Logo" width="75" />
					<h1>ABC Jobs</h1>
				</a>
			</sec:authorize>

		</div>

		<div id="headerR" class="align-center">
			<ul id="navLinks" class="align-center list-style-none">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="home">Home</a></li>
					<li><a href="register">Sign Up</a></li>
					<li><a href="login">Login</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="dashboard">Dashboard</a></li>
					<li><a href="profile">Profile</a></li>
					<form action="logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" name="Logout"
							value="Logout" class="btnAnimation logoutBtn alt"></input>
					</form>
				</sec:authorize>
			</ul>

			<button id="headerMenuBtn" class="icon material-icons"
				onclick="toggleNavMenu()">menu</button>
		</div>

		<aside id="navMenu" class="justify-center">
			<ul id="navMenuLinks" class="flex-col align-center list-style-none">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="home">Home</a></li>
					<li><a href="register">Sign Up</a></li>
					<li><a href="login">Login</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li><a href="dashboard">Dashboard</a></li>
					<li><a href="profile">Profile</a></li>
					<form action="logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit" name="Logout"
							value="Logout" class="btnAnimation logoutBtn alt"></input>
					</form>
				</sec:authorize>
			</ul>
		</aside>
	</header>