    // Comment MODAL
    const commentModal = document.querySelector("#createCommentModal");
    const openCommentModal = document.querySelector("#createComment");
    const closeCommentModal = document.querySelector("#closeCreateComment");
        
    openCommentModal.addEventListener("click", () => {
          commentModal.showModal();
        });

    closeCommentModal.addEventListener("click", () => {
          commentModal.close();
        });