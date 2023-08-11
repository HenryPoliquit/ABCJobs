   const toggleNavMenu = () => {
        var navMenu = document.getElementById("navMenu");
        var navMenuBtn = document.getElementById("headerMenuBtn");
        navMenuBtn.classList.toggle("opened");
        navMenu.classList.toggle("opened");
    };

    // FORM ERROR
    if ($('.error-text').is(':empty')) {
        // ERROR TEXT HIDDEN BY DEFAULT
        $(".error-popup").css("visibility", "hidden");
    } else {
        $(".error-popup").css("visibility", "visible");
        $(".error-popup").fadeIn("fast");
        setTimeout(function () {
            $(".error-popup").fadeOut("fast");
        }, 15000);
    }
    function closeFormError() {
        $(".error-popup").fadeOut("fast");
    }
    
    // SUCCESS POPUP
    if ($('.success-text').is(':empty')) {
        // ERROR TEXT HIDDEN BY DEFAULT
        $(".success-popup").css("visibility", "hidden");
    } else {
        $(".success-popup").css("visibility", "visible");
        $(".success-popup").fadeIn("fast");
        setTimeout(function () {
            $(".success-popup").fadeOut("fast");
        }, 5000);
    }
    function closeSuccess() {
        $(".success-popup").fadeOut("fast");
    }
    
    // LOGIN POPUP
    if ($('.login-text').is(':empty')) {
        // LOGIN TEXT HIDDEN BY DEFAULT
    	$('.login-text').css("visibility", "hidden");
    } else {
        $(".login-popup").css("visibility", "visible");
    	$(".error-popup").fadeIn("fast");
    }
    
    // LOGOUT POPUP
    if ($('#logoutText').is(':empty')) {
        // ERROR TEXT HIDDEN BY DEFAULT
        $("#logoutPopup").css("visibility", "hidden");
    } else {
        $("#logoutPopup").css("visibility", "visible");
        $("#logoutPopup").fadeIn("fast");
        setTimeout(function () {
            $("#logoutPopup").fadeOut("fast");
        }, 5000);
    }
    

    // PROFILE MODAL
    const modal = document.querySelector("#editProfileModal");
    const openModal = document.querySelector("#editProfile");
    const closeModal = document.querySelector("#closeEditProfile");
    
    openModal.addEventListener("click", () => {
    	  modal.showModal();
    	});

    	closeModal.addEventListener("click", () => {
    	  modal.close();
    	});