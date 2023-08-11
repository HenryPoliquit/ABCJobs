<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Verify" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center justify-center">

	<section class="align-center flex-col form-card">
		<h3 class="form-heading">Enter email of account</h3>
		<sf:form action="identify" method="post"
			class="align-center flex-col form" onsubmit="">
			<div class="input-group">
				<input required="true" type="text" name="email"
					autocomplete="off" id="email" class="input"
					onkeyup="validateEmail()" />
				<label class="user-label">Email</label>
			</div>
			<button type="submit" class="submit-btn">Submit</button>
		</sf:form>
	</section>

</main>

<jsp:include page="../footer.jsp"></jsp:include>