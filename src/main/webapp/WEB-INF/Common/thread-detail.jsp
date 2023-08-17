<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<jsp:include page="../header.jsp">
	<jsp:param value="User" name="HTMLtitle" />
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
	<h2 class="dashboard-heading hFont">Thread Detail</h2>
	<div class="flex dashboard">
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
						<a href="search"><button class="submit-btn">Search</button></a> 
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
		<div class="flex-col gap-20">
			<!-- Thread -->
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
				</div>
			</c:forEach>

			<!-- Create Comment -->
			<div class="flex-col center gap-20">
			<div>
				<div class="flex dashboard-right-column-comment">
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
					<div style="width: 5vw;"></div>
					<div class="flex center">
						<button id="createComment" class="post-btn">Create Comment</button>
					</div>
				</div>
			</div>
			
			<!-- Comment Modal -->

			<dialog id="createCommentModal" class="modal">

			<div class="align-center error-popup">
				<span class="material-icons">error</span>
				<p id="error-text" class="pFont error-text"></p>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>

			<h3 class="modal-heading">Comment</h3>
			<sf:form id="createCommentForm" class="align-center flex-col form"
				onsubmit="validateCreateComment(event)" action="create_thread_comment"
				method="post" modelAttribute="comment">
				<div class="input-group">
				<c:forEach items="${thread}" var="r">
					<input required="true" type="hidden" name="threadId"
						path="threadId" autocomplete="off" value="${r.getId()}" />
				</c:forEach>
					<input required="true" type="text" name="description"
						path="description" autocomplete="off" class="input" /> <label
						class="user-label">Comment</label>
				</div>

				<button class="submit-btn btnAnimation"
					style="background-color: var(--success);" type="submit">Save</button>
			</sf:form> 
				<button id="closeCreateComment" class="material-icons modal-close">close</button>
			</dialog>
			
			<!-- Comments -->
			
			<c:forEach items="${comments}" var="c">
				<div class="flex-col dashboard-right-column-comment">
					<div class="flex gap-10">
						<div class="align-start">
							<c:if test="${c.getUser().getGender() == 'Male'}">
								<img src="images/Profile-male.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${c.getUser().getGender() == 'Female'}">
								<img src="images/Profile-female.svg" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${c.getUser().getGender() == 'Prefer not to say'}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>
							<c:if test="${c.getUser().getGender() == null}">
								<img src="images/Profile-wildcard.png" alt="profile picture"
									width="75" height="75" />
							</c:if>						
						</div>
						<div class="flex-col" style="justify-content: center;">
							<c:if test="${c.getUser().getUserName() != uname}">
								<h3><a href="view_profile?uId=${c.getUser().getId()}">${c.getUser().getName()}</a></h3>
							</c:if>
							<c:if test="${c.getUser().getUserName() == uname}">
								<h3><a href="profile">${c.getUser().getName()}</a></h3>
							</c:if>
							<p>${c.getUser().getAddress()}</p>
						</div>
					</div>
					<div class="flex">
						<div>
							<p>${c.getDescription()}</p>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>