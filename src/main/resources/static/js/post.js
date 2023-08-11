    // POST MODAL
    const postModal = document.querySelector("#createPostModal");
    const openPostModal = document.querySelector("#createPost");
    const closePostModal = document.querySelector("#closeCreatePost");
        
    openPostModal.addEventListener("click", () => {
          postModal.showModal();
        });

    closePostModal.addEventListener("click", () => {
          postModal.close();
        });