<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Verify" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<div class="align-center error-popup">
		<span class="material-icons">error</span>
		<p id="error-text" class="pFont error-text">${error_msg}</p>
		<button class="btnAnimation icon material-icons"
			onclick="closeFormError()">close</button>
	</div>
	
	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Verify your account</h3>
		<sf:form action="verify-account" method="post" id="codeForm"
			class="align-center flex-col form" onsubmit="validateCode(event)">
			<div class="input-group">
				<input type="hidden" name="email" autocomplete="off"
					id="email" class="input" value="${email}" /> <input required="true" type="text"
					name="code" autocomplete="off" id="code" class="input" onkeyup="validateCode()" /> <label
					class="user-label">Enter Code</label>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</sf:form>
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>