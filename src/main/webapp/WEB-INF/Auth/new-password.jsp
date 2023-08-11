<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Verify" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Enter New Password</h3>
		<sf:form action="change-password" method="post"
			class="align-center flex-col form" onsubmit="">
			<div class="input-group">
				<input required="true" type="hidden" name="email" autocomplete="off"
					id="email" class="input" value="${email}" /> <input
					required="required" type="password" name="password" path="password"
					autocomplete="off" id="password" class="input"
					onkeyup="validatePassword()" /> <label class="user-label">Password</label>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</sf:form>
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>