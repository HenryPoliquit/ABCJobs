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
	<h2 class="dashboard-heading hFont">Admin Dashboard</h2>
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
				<a href="manage_users"><button class="submit-btn">All Users</button></a> 
				<a href="manage_post"><button class="submit-btn">All Posts</button></a> 
				<a href="manage_threads"><button class="submit-btn">All Threads</button></a> 
				<a href="manage_comment"><button class="submit-btn">All Comments</button></a> 
				<a><button class="submit-btn">All Messages</button></a>
			</div>
		</div>
		<!-- 2nd Column -->
		<div class="flex-col gap-20">
			<!-- Post table -->
			<div class="flex-col dashboard-right-column-content dashboard-panel">
				<table class="dashboard-table">
			<thead class="hFont">
				<tr>
					<th>Post No.</th>
					<th>Description</th>
					<th>Date Posted</th>
					<th>Posted By</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody class="pFont">
				<c:if test="${not empty comments}">
					<c:forEach items="${comments}" var="p" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${p.description}</td>
							<td>${p.date}</td>
							<td>${p.user.getName()}</td>
							<td>
								<div class="flex center gap-10">
									<!-- Update -->
									<button id="createComment" class="btnAnimation material-icons">edit</button>
			<!-- Post Modal -->
			<dialog id="createCommentModal" class="modal">

			<div class="align-center error-popup">
				<span class="material-icons">error</span>
				<p id="error-text" class="pFont error-text"></p>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>

			<h3 class="modal-heading">Edit Comment</h3>
			<sf:form id="createThreadForm" class="align-center flex-col form"
				onsubmit="validateCreateThread(event)" action="edit_comment?cId=${p.id}"
				method="post" modelAttribute="comment">
				<div class="input-group">
					<input required="true" type="text" name="description"
						path="description" autocomplete="off" class="input" /> <label
						class="user-label">Description</label>
				</div>

				<button class="submit-btn btnAnimation"
					style="background-color: var(--success);" type="submit">Save</button>
			</sf:form> 
				<button id="closeCreateComment" class="material-icons modal-close">close</button>
			</dialog>						        
									<!-- Delete -->
									<button id="delete" class="btnAnimation material-icons">delete</button>
			<!-- Delete Modal -->
			<dialog id="deleteModal" class="modal">
				<h3 class="modal-heading">Delete Thread</h3>
				<a href="/delete_comment?cId=${p.id}"><button class="submit-btn btnAnimation" style="background-color: var(--error);" type="submit">Delete</button></a>
				<button id="closeDelete" class="material-icons modal-close">close</button>
			</dialog>
								</div>
							</td>							
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty comments}">
					<tr>
						<td colspan="6">No comments made yet</td>
					</tr>
				</c:if>
			</tbody>
				</table>			
			</div>
		</div>
	</div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>