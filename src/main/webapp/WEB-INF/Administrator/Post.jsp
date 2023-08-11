<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../header.jsp">
	<jsp:param value="Profile" name="HTMLtitle" />
</jsp:include>
<main>
			<h3 class="modal-heading">Create Post</h3>
			<sf:form id="createPostForm" class="align-center flex-col form"
				onsubmit="" action="create_post"
				method="post" modelAttribute="post">
				<div class="input-group">
					<sf:input required="true" type="text" name="name" path="name"
						autocomplete="off" class="input"
						onkeyup="validateFullname()" /> <label class="user-label">Name</label>
				</div>
				<div class="input-group">
					<sf:input required="true" type="text" name="description"
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

</main>

<jsp:include page="../footer.jsp"></jsp:include>						    