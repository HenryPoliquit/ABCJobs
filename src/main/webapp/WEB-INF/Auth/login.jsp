<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Login" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<div class="align-center error-popup">
		<span class="material-icons"></span>
		<p class="pFont error-text">${error_msg}</p>
		<button class="btnAnimation icon material-icons"
			onclick="closeFormError()">close</button>
	</div>

	<a href="dashboard"
		class="align-center login-popup btnAnimation text-deco-none text-align-center">
		<span class="material-icons">login</span>
		<p class="pFont login-text">${success_msg}</p>
	</a>

<sec:authorize access="!isAuthenticated()">
	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Login</h3>

		<c:url var="post_url" value="/login"></c:url>

		<form class="align-center flex-col form" action="${post_url}"
			method="post">
			
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				
			<div class="input-group">
				<input required="true" type="text" name="username" id="userName"
					autocomplete="off" class="input" /> <label class="user-label">Username</label>
			</div>
			
			<div class="input-group">
				<input required="true" type="password" name="password" id="password"
					autocomplete="off" class="input" /> <label class="user-label">Password</label>
			</div>
			
			<input type="submit" class="submit-btn btnAnimation" value="Submit"></input>
		</form>
		
		<hr class="formDivider">
		<a href="identify_account" class="altFormLink pFont text-deco-none">Forgot Password?</a>
		<a href="register" class="altFormLink pFont text-deco-none">Don't
			have an account?</a>
			
	</section>
</sec:authorize>
<sec:authorize access="isAuthenticated()">

</sec:authorize>
</main>

<jsp:include page="../footer.jsp"></jsp:include>