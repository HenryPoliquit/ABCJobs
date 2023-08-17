<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="custom-shape-divider-bottom-1686717423">
	<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg"
		viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path
			d="M600,112.77C268.63,112.77,0,65.52,0,7.23V120H1200V7.23C1200,65.52,931.37,112.77,600,112.77Z"
			class="shape-fill"></path>
        </svg>
</div>

<footer class="justify-center flex-col">

	<div id="footerTop" class="hFont">
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

	<div id="footerMid" class="align-start justify-between">
		<div id="footerMidL">

			<ul id="footLinks" class="align-start flex-col list-style-none">
				<h5 class="footerSubHeader">Company</h5>
				<li><a href="/about-us">About Us</a></li>
				<li><a href="/contact-us">Contact Us</a></li>
			</ul>

			<ul id="footLinks" class="align-start flex-col list-style-none">
				
				<sec:authorize access="!isAuthenticated()">
				<h5 class="footerSubHeader">Account</h5>
					<li><a href="login">Login</a></li>
					<li><a href="register">Sign Up</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('Users')">
				<h5 class="footerSubHeader">Meals</h5>
					<li><a href="order">Order a Meal</a></li>
					<li><a href="ongoing-orders">View Pending Orders</a></li>
					<li><a href="profile">View Order History</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('Administrator')">
				<h5 class="footerSubHeader">Donation</h5>
					<li><a href="donation">Donate</a></li>
					<li><a href="profile">View Donation History</a></li>
				</sec:authorize>
				
			</ul>
		</div>

		<div id="footerMidR">
			<div id="contactBlock" class="align-end flex-col pFont">
				<h5 class="hFont">Contact Us</h5>
				<p>+1-800-123-4567</p>
				<p>info@abcjobs.com</p>
				<p>123 Main Street, Suite 456, NY</p>
			</div>
		</div>
	</div>

	<div id="footerBot" class="align-center justify-between pFont">
		<div id="footerBotL">
			<p>Lithan Academy &#169;2023</p>
		</div>

		<div id="footerBotR" class="align-center">
			<ul id="botLinks" class="align-center list-style-none">
				<li><a href="/privacy-policy">Privacy Policy</a></li>
				<li><a href="/terms-and-conditions">Terms & Conditions</a></li>
			</ul>
		</div>
	</div>

</footer>
</body>
<script type="text/javascript" src="js/form-validation.js"></script>
<script type="text/javascript" src="js/nav-menu.js"></script>
<script type="text/javascript" src="js/post.js"></script>
<script type="text/javascript" src="js/thread.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
<script type="text/javascript" src="js/delete.js"></script>
</html>