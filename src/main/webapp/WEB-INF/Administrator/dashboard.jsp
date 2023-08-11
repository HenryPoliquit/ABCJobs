<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Administrator" name="HTMLtitle" />
</jsp:include>

<main class="bg2 align-center flex-col">
	<h2 class="dashboard-heading hFont">Admin Dashboard</h2>
	<div class="flex"
		style="width: 80vw; height: 600px; border: black 1px solid; gap: 2vw;">
		<div class="flex-col" style="gap: 20px;">
			<div class="justify-center center"
				style="width: 20vw; height: 80px; border: black 1px solid; padding: 1vw; border-radius: 10px; gap: 10px;">
				<div
					style="width: 75px; height: 75px; border-radius: 50%; background-color: white;">
				</div>
				<div class="">
					<h3>Paul Henry V. Poliquit</h3>
					<p>Negros Oriental, Philippines</p>
				</div>
			</div>
		</div>
		<div class="flex-col" style="gap: 20px;">
			<div>
				<div class="flex"
					style="width: 54vw; height: 80px; border: black 1px solid; padding: 1vw; border-radius: 10px; gap: 10px;">
					<div class="align-start"
						style="width: 75px; height: 75px; border-radius: 50%; background-color: white;">
					</div>
					<div class="flex-col center">
						<h3>Paul Henry V. Poliquit</h3>
						<p>Negros Oriental, Philippines</p>
					</div>
					<div style="width: 20vw;"></div>
					<div class="flex center">
						<button id="createPost" class="post-btn">Create Job Post</button>
					</div>
				</div>
			</div>

			<!-- Post Modal -->

			<dialog id="createPostModal" class="modal">

			<div class="align-center error-popup">
				<span class="material-icons">error</span>
				<p id="error-text" class="pFont error-text"></p>
				<button class="btnAnimation icon material-icons"
					onclick="closeFormError()">close</button>
			</div>

			<h3 class="modal-heading">Create Post</h3>
			<sf:form id="createPostForm" class="align-center flex-col form"
				onsubmit="validateCreatePost(event)" action="create_post"
				method="post" modelAttribute="post" enctype="multipart/form-data">
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
				<div class="input-group">
					<input type="file" class="input" name="fileImage" id="photo"
						accept="image/png, image/jpeg" required="true" /> <label
						class="user-label">Photo</label>
				</div>
				<div class="input-group"
					style="height: 300px; width: 300px; margin: auto;">
					<img id="imgPreview" src="#" alt="image preview"
						style="width: inherit;" />
				</div>

				<button class="submit-btn btnAnimation"
					style="background-color: var(--success);" type="submit">Save</button>
			</sf:form>
			<button id="closeCreatePost" class="material-icons modal-close">close</button>
			</dialog>
			<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>

			<!-- Posts -->
			<div class="flex-col"
				style="width: 54vw; height: fit-content; border: black 1px solid; padding: 1vw; border-radius: 10px; gap: 10px;">
				<div class="flex" style="gap: 10px;">
					<div class="align-start"
						style="width: 75px; height: 75px; border-radius: 50%; background-color: white;">
					</div>
					<div class="flex-col center">
						<h3>Paul Henry V. Poliquit</h3>
						<p>Negros Oriental, Philippines</p>
					</div>
				</div>
				<div class="flex">
					<div>
						<p>Ullamco dolore reprehenderit ullamco esse deserunt.
							Exercitation et officia nisi proident. Occaecat laborum duis
							proident nisi mollit deserunt pariatur ad nostrud non. Proident
							excepteur occaecat sunt do incididunt duis proident dolore eu ea
							duis excepteur excepteur deserunt. Cupidatat exercitation eiusmod
							mollit cillum aliqua magna occaecat labore veniam est cupidatat
							laboris.</p>
					</div>
				</div>
				<div class="flex">
					<div style="width: 100%; height: 200px; background-color: white;">
					</div>
				</div>
				<div class="flex center"
					style="gap: 25px; padding-top: 1vw; border-top: 1px solid black;">
					<button class="share-btn">Like</button>
					<button class="share-btn">Comment</button>
					<button class="share-btn">Share</button>
					<button class="share-btn">Delete</button>
				</div>
			</div>
		</div>
	</div>
</main>

<jsp:include page="../footer.jsp"></jsp:include>