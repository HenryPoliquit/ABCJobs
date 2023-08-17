<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Search" name="HTMLtitle" />
</jsp:include>

<main class="bg2 align-center flex-col">
	<c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
		<c:set var="gender" value="${u.gender}"></c:set>
	</c:forEach>
	<h2 class="dashboard-heading hFont">Search</h2>
	<div class="flex dashboard">
		<!-- 1st Column -->
		<div class="flex-col gap-20">
			<div class="justify-center center dashboard-left-column-profile">
				<div>
					<c:if test="${gender == 'Male'}">
						<img src="images/Profile-male.svg" alt="profile picture"
							width="75" height="75" />
					</c:if>
					<c:if test="${gender == 'Female'}">
						<img src="images/Profile-female.svg" alt="profile picture"
							width="75" height="75" />
					</c:if>
					<c:if test="${gender == 'Prefer not to say'}">
						<img src="images/Profile-wildcard.png" alt="profile picture"
							width="75" height="75" />
					</c:if>
					<c:if test="${gender == null}">
						<img src="images/Profile-wildcard.png" alt="profile picture"
							width="75" height="75" />
					</c:if>
				</div>
				<div class="" style="justify-content: center;">
					<h3><a href="profile">${name}</a></h3>
					<p>${address}</p>
				</div>
			</div>
			<!-- Links -->
			<sec:authorize access="hasRole('Users')">
				<div class="flex-col center dashboard-left-column-links">
						<a><button class="submit-btn">Messages</button></a> 
						<a href="all_threads"><button class="submit-btn">Threads</button></a> 
						<a href="all_posts"><button class="submit-btn">Posts</button></a> 
						<a><button class="submit-btn">Search</button></a> 
				</div>
			</sec:authorize>
			<sec:authorize access="hasRole('Administrator')">
				<div class="flex-col center dashboard-left-column-links">
						<a><button class="submit-btn">Messages</button></a> 
						<a href="all_threads"><button class="submit-btn">Threads</button></a> 
						<a href="all_posts"><button class="submit-btn">Posts</button></a> 
						<a href="search"><button class="submit-btn">Search</button></a> 
						<a href="manage_users"><button class="submit-btn">All Users</button></a> 
						<a href="manage_post"><button class="submit-btn">All Posts</button></a> 
						<a href="manage_threads"><button class="submit-btn">All Threads</button></a> 
						<a href="manage_comment"><button class="submit-btn">All Comments</button></a> 
						<a><button class="submit-btn">All Messages</button></a>
				</div>
			</sec:authorize>
		</div>
		<!-- 2nd Column -->
		<div class="flex-col gap-20">
			<!-- Search -->
			<div class="flex-col center dashboard-right-column-search">
				<sf:form class="search-bar" action="search-results" method="get">
					<button class="search-btn material-icons" type="submit">search</button>
					<input class="search-input" placeholder="Search" name="keyword"/>
				</sf:form>
			</div>
			<!-- Search Results -->
	<c:if test="${empty searchUser}">
		<div class="flex-col dashboard-right-column-content">
			<h4 class="">No users found</h4>
		</div>
	</c:if>

	<c:if test="${not empty searchUser}">
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${searchUser}" var="u">
			
			<c:if test="${u.userName ne currentUser && u.isEnabled() == true}">
				<c:set var="count" scope="page" value="${count + 1}" />
				<div class="flex-col dashboard-right-column-content">
					<div class="flex gap-10">
						<div class="align-start">
							<c:if test="${u.getGender() == 'Male'}">
								<img src="images/Profile-male.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${u.getGender() == 'Female'}">
								<img src="images/Profile-female.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${u.getGender() == 'Prefer not to say'}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${u.getGender() == null}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>
						</div>
						<div class="flex-col" style="justify-content: center;">
							<h3><a href="view_profile?uId=${u.getId()}">${u.getName()}</a></h3>
							<p>${u.getAddress()}</p>
						</div>
					</div>
				</div>
			</c:if>

		</c:forEach>
		
		<c:if test="${count == 0}">
			<div class="mini-card">
				<h4 class="mc-heading"
					style="margin-bottom: 0rem; text-align: center;">No users
					found</h4>
			</div>
		</c:if>
	</c:if>			
		</div>
	</div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>