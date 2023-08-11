<jsp:include page="../header.jsp">
	<jsp:param value="Home" name="HTMLtitle" />
</jsp:include>

<main class="bg1 home">
	<section id="landingSection" class="align-start justify-evenly">

		<a href="login" id="logoutPopup"
			class="align-center login-popup btnAnimation text-deco-none text-align-center">
			<span class="material-icons">login</span>
			<p id="logoutText" class="pFont login-text">${success_logout}</p>
		</a>

		<div id="homeCard" class="flex-col justify-center">

			<h2 class="hFont">Welcome to ABC Jobs Portal</h2>
			<p class="pFont">Looking for a new career? Join ABC Jobs, the leading community portal for job seekers and employers.</p>

			<button class="get-started hFont"
				onclick="window.location.href='register';">
				<span class="circle" aria-hidden="true"> <span
					class="icon arrow"></span>
				</span> <span class="button-text">Get Started</span>
			</button>

		</div>

		<div id="blobContainer">
			<img id="blob" src="images/blob.svg" alt="Svg graphic" width="500" />
			<img id="motorcycle" src="images/Motorcycle.svg"
				alt="Motorcycle graphic" width="500" />
		</div>
	</section>
</main>

<jsp:include page="../footer.jsp"></jsp:include>