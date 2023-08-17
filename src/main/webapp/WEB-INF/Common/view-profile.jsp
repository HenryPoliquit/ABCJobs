<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>

<main class="bg3 align-center flex-col">
	<c:forEach items="${user}" var="u">

	<div id="profile-card" class="align-center flex-col pFont">
		<c:if test="${u.gender == 'Male'}">
			<img src="images/Profile-male.svg" alt="profile picture" width="300"
				height="300" />
		</c:if>
		<c:if test="${u.gender == 'Female'}">
			<img src="images/Profile-female.svg" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<c:if test="${u.gender == 'Prefer not to say'}">
			<img src="images/Profile-wildcard.png" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<c:if test="${u.gender == null}">
			<img src="images/Profile-wildcard.png" alt="profile picture"
				width="300" height="300" />
		</c:if>
		<h4>${u.name}</h4>
		<ul id="user-details" class="flex-col list-style-none">
			<c:if test="${ (u.gender == null) }">
				<li><label>Gender:</label>Not specified</li>
			</c:if>
			<c:if test="${ (u.gender != null) }">
				<li><label>Gender:</label>${u.gender}</li>
			</c:if>
			<li><label>Username:</label>${u.userName}</li>
			<c:if test="${ (u.address == null) }">
				<li><label>Address:</label>Not specified</li>
			</c:if>
			<c:if test="${ (u.address != null) }">
				<li><label>Address:</label>${u.address}</li>
			</c:if>
			<c:if test="${ (u.mobile == null) }">
				<li><label>Mobile No.:</label>Not specified</li>
			</c:if>
			<c:if test="${ (u.mobile != null) }">
				<li><label>Mobile No.:</label>${u.mobile}</li>
			</c:if>
		</ul>
	</div>
	</c:forEach>
</main>

<jsp:include page="../footer.jsp"></jsp:include>