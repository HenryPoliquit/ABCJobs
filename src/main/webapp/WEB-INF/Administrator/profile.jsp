<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>

<main class="bg3 align-center flex-col">
	<c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
		<c:set var="gender" value="${u.gender}"></c:set>
	</c:forEach>

	<div class="align-center success-popup">
		<span class="material-icons">done</span>
		<p id="error-text" class="pFont success-text">${success_msg}</p>
		<button class="btnAnimation icon material-icons"
			onclick="closeSuccess()">close</button>
	</div>

	<div id="profile-card" class="align-center flex-col pFont">
		<c:if test="${gender == 'Male'}">
			<img src="images/Profile-male.svg" alt="profile picture" width="300"
				height="300" />
		</c:if>
		<c:if test="${gender == 'Female'}">
			<img src="images/Profile-female.svg" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<c:if test="${gender == 'Prefer not to say'}">
			<img src="images/Profile-wildcard.png" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<c:if test="${gender == null}">
			<img src="images/Profile-wildcard.png" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<h4>${name}</h4>
		<ul id="user-details" class="flex-col list-style-none">
			<c:if test="${ (gender == null) }">
				<li><label>Gender:</label>Not specified</li>
			</c:if>
			<c:if test="${ (gender != null) }">
				<li><label>Gender:</label>${gender}</li>
			</c:if>
			<li><label>Username:</label>${uname}</li>
			<c:if test="${ (address == null) }">
				<li><label>Address:</label>Not specified</li>
			</c:if>
			<c:if test="${ (address != null) }">
				<li><label>Address:</label>${address}</li>
			</c:if>
			<c:if test="${ (mobile == null) }">
				<li><label>Mobile No.:</label>Not specified</li>
			</c:if>
			<c:if test="${ (mobile != null) }">
				<li><label>Mobile No.:</label>${mobile}</li>
			</c:if>
		</ul>

		<button id="editProfile" class="btnAnimation material-icons">edit</button>
	</div>

	<dialog id="editProfileModal" class="modal">

	<div class="align-center error-popup">
		<span class="material-icons">error</span>
		<p id="error-text" class="pFont error-text"></p>
		<button class="btnAnimation icon material-icons"
			onclick="closeFormError()">close</button>
	</div>
	
	<h3 class="modal-heading">Edit Profile</h3>
	<sf:form id="editProfileForm" class="align-center flex-col form"
		onsubmit="validateEditProfile(event)" action="update-profile"
		method="post" modelAttribute="user">
		<div class="input-group">
			<input required="true" type="text" name="name" path="name"
				autocomplete="off" id="fullname" class="input"
				onkeyup="validateFullname()" value="${name}" /> <label
				class="user-label">Name</label>
		</div>
		<div class="input-group">
			<label class="select-label">Gender</label> <select id="gender"
				class="input-select" name="gender" path="gender">
				<option selected disabled hidden>Select gender</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Prefer not to say">Prefer not to say</option>
			</select>
		</div>
		<div class="input-group">
			<input required="true" type="text" name="address" path="address"
				autocomplete="off" class="input" value="${address}" /> <label
				class="user-label">Address</label>
		</div>
		<div class="input-group">
			<input required="true" type="text" name="mobile" path="mobile"
				autocomplete="off" id="mobile" class="input" value="${mobile}" /> <label
				class="user-label">Mobile No.</label>

		</div>

		<button class="submit-btn btnAnimation"
			style="background-color: var(- -success);" type="submit">Save</button>
	</sf:form>
	<button id="closeEditProfile" class="material-icons modal-close">close</button>
	</dialog>

</main>

<jsp:include page="../footer.jsp"></jsp:include>