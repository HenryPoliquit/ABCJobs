<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Administrator" name="HTMLtitle" />
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
	<h2 class="dashboard-heading hFont">User Dashboard</h2>
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
			<div class="flex-col center dashboard-left-column-links">
				<a><button class="submit-btn">Messages</button></a> 
				<a href="all_threads"><button class="submit-btn">Threads</button></a> 
				<a href="all_posts"><button class="submit-btn">Posts</button></a> 
				<a href="search"><button class="submit-btn">Search</button></a> 
			</div>
		</div>
		<!-- 2nd Column -->
		<div class="flex-col gap-20">
					<div>
				<div class="flex dashboard-right-column-profile">
					<div class="align-start">
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
					<div class="flex-col" style="justify-content: center;">
						<h3><a href="profile">${name}</a></h3>
						<p>${address}</p>
					</div>
					<div style="width: 20vw;"></div>
					<div class="flex center">
						<button id="createThread" class="post-btn">Create Threads</button>
					</div>
				</div>
			</div>

			<!-- Thread Modal -->

			<dialog id="createThreadModal" class="modal">

			<div class="align-center error-popup">
				<span class="material-icons">error</span>
				<p id="error-text" class="pFont error-text"></p>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>

			<h3 class="modal-heading">Thread</h3>
			<sf:form id="createThreadForm" class="align-center flex-col form"
				onsubmit="validateCreateThread(event)" action="create_thread"
				method="post" modelAttribute="thread">
				<div class="input-group">
					<input required="true" type="text" name="name" path="name"
						autocomplete="off" id="fullname" class="input"
						onkeyup="validateFullname()" /> <label class="user-label">Name</label>
				</div>
				<div class="input-group">
					<input required="true" type="text" name="description"
						path="description" autocomplete="off" class="input" /> <label
						class="user-label">Description</label>
				</div>

				<button class="submit-btn btnAnimation"
					style="background-color: var(--success);" type="submit">Save</button>
			</sf:form> 
				<button id="closeCreateThread" class="material-icons modal-close">close</button>
			</dialog>
		
			<!-- Threads -->
			<c:if test="${empty thread}">
				<div class="flex-col dashboard-right-column-content">
						<h4 class="">No threads found</h4>
				</div>
			</c:if>
			<c:if test="${not empty thread}">
			<c:forEach items="${thread}" var="r">
				<div class="flex-col dashboard-right-column-content">
					<div class="flex gap-10">
						<div class="align-start">
							<c:if test="${r.getUser().getGender() == 'Male'}">
								<img src="images/Profile-male.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${r.getUser().getGender() == 'Female'}">
								<img src="images/Profile-female.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${r.getUser().getGender() == 'Prefer not to say'}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${r.getUser().getGender() == null}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>
						</div>
						<div class="flex-col" style="justify-content: center;">
							<c:if test="${r.getUser().getUserName() != uname}">
								<h3><a href="view_profile?uId=${r.getUser().getId()}">${r.getUser().getName()}</a></h3>
							</c:if>
							<c:if test="${r.getUser().getUserName() == uname}">
								<h3><a href="profile">${r.getUser().getName()}</a></h3>
							</c:if>
							<p>${r.getUser().getAddress()}</p>
						</div>
					</div>
					<div class="flex">
						<div>
							<h4>${r.getName()}</h4>
							<p>${r.getDescription()}</p>
						</div>
					</div>
					<div class="flex center"
						style="gap: 25px; padding-top: 1vw; border-top: 1px solid black;">
						<button class="share-btn">Like</button>
						<a href="/thread_detail?tId=${r.getId()}"><button
								class="share-btn">Comment</button></a>
						<button class="share-btn">Share</button>
					</div>
				</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>