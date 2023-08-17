    // POST MODAL
    const deleteModal = document.querySelector("#deleteModal");
    const openDelete = document.querySelector("#delete");
    const closeDelete = document.querySelector("#closeDelete");
        
    openDelete.addEventListener("click", () => {
          deleteModal.showModal();
        });

    closeDelete.addEventListener("click", () => {
          deleteModal.close();
        });