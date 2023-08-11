<jsp:include page="../header.jsp">
	<jsp:param value="Contact Us" name="HTMLtitle" />
</jsp:include>

<main class="bg1 align-center flex-col">

	<div class="info-container">
		<h2 class="info-heading">Contact Us</h2>
		<p class="pFont info-paragraph">
			At ABC Jobs, we are committed to connecting job seekers and employers in a fast and easy way. Whether you are looking for a new career opportunity, or you want to hire qualified candidates for your business, we have the tools and resources to help you. You can browse thousands of job listings, create a professional profile, upload your resume, and apply online with just a few clicks. You can also access our blog, newsletter, and social media channels for the latest news and tips on the job market. If you have any questions or feedback, please feel free to contact us using the form below. We would love to hear from you and assist you in any way we can.
		</p>
	</div>

	<div class="info-card-container pFont">
		<div class="info-card">
			<img src="images/map.svg" alt="map graphic" width="100" height="100" />
			<h3 class="info-subHeading">Address</h3>
			<p class="info-paragraph">123 Main Street, Suite 456, NY</p>
		</div>
		<div class="info-card">
			<img src="images/email.svg" alt="map graphic" width="100"
				height="100" />
			<h3 class="info-subHeading">Email</h3>
			<p class="info-paragraph">info@abcjobs.com</p>
		</div>
		<div class="info-card">
			<img src="images/call.svg" alt="map graphic" width="100" height="100" />
			<h3 class="info-subHeading">Phone</h3>
			<p class="info-paragraph">+1-800-123-4567</p>
		</div>
	</div>

<!-- 	<section class="align-center flex-col form-card">
		<h3 class="form-heading text-align-center">Send us an Email</h3>
		<form class="align-center flex-col form" method="post">

			<div class="input-group">
				<input required="true" type="text" autocomplete="off" class="input" />
				<label class="user-label">Subject</label>
			</div>

			<div class="input-group">
				<input required="true" type="text" autocomplete="off" class="input" />
				<label class="user-label">Your Email</label>
			</div>

			<div class="input-group">
				<textarea rows="4" required="true" autocomplete="off" class="input"></textarea>
				<label class="user-label">Message</label>
			</div>

			<input type="submit" class="submit-btn btnAnimation" value="Submit"></input>
		</form>
	</section> -->

</main>

<jsp:include page="../footer.jsp"></jsp:include>