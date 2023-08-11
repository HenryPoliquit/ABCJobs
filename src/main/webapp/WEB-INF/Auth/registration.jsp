<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="../header.jsp">
	<jsp:param value="Registration" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<div class="align-center error-popup">
		<span class="material-icons">error</span>
		<p id="error-text" class="pFont error-text">${error_msg}</p>
		<button class="btnAnimation icon material-icons"
			onclick="closeFormError()">close</button>
	</div>

	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Sign up</h3>
		<sf:form action="register_user" method="post" id="registration"
			class="align-center flex-col form"
			onsubmit="validateRegistration(event)" modelAttribute="user">
			<div class="input-group">
				<sf:input required="true" type="text" name="name" path="name"
					autocomplete="off" id="fullname" class="input"
					onkeyup="validateFullname()" />
				<label class="user-label">Name</label>
			</div>
			<div class="input-group">
				<sf:input required="required" type="text" name="userName"
					path="userName" autocomplete="off" id="username" class="input"
					onkeyup="validateUsername()" />
				<label class="user-label">Username</label>
			</div>
			<div class="input-group">
				<sf:input required="true" type="text" name="email" path="email"
					autocomplete="off" id="email" class="input"
					onkeyup="validateEmail()" />
				<label class="user-label">Email</label>
			</div>
			<div class="input-group">
				<sf:input required="required" type="password" name="password"
					path="password" autocomplete="off" id="password" class="input"
					onkeyup="validatePassword()" />
				<label class="user-label">Password</label>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</sf:form>
		<hr class="formDivider">
		<a href="login" class="altFormLink pFont text-deco-none">Already
			have an account?</a>
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>