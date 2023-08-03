<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Verify" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Verify your account</h3>
		<sf:form action="verify_user" method="post"
			class="align-center flex-col form" onsubmit="">
			<div class="input-group">
				<input required="true" type="hidden" name="username" autocomplete="off"
					id="username" class="input" value="${username}" /> <input required="true" type="text"
					name="code" autocomplete="off" id="code" class="input" /> <label
					class="user-label">Enter Code</label>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</sf:form>
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>