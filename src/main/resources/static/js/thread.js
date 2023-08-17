    // Thread MODAL
    const threadModal = document.querySelector("#createThreadModal");
    const openThreadModal = document.querySelector("#createThread");
    const closeThreadModal = document.querySelector("#closeCreateThread");
        
    openThreadModal.addEventListener("click", () => {
          threadModal.showModal();
        });

    closeThreadModal.addEventListener("click", () => {
          threadModal.close();
        });