console.log("js connected");

//  ERROR MESSAGE TAG
const errorText = document.getElementById("error-text");

//  COLORS
const error = "#f65151";
const success = "#5cb85c";

// FIELD TAGS
const regForm = document.getElementById("registration");
const editProfile = document.getElementById("editProfileForm");
const codeForm = document.getElementById("codeForm");
const fullname = document.getElementById("fullname");
const username = document.getElementById("username");
const email = document.getElementById("email");
const password = document.getElementById("password");
const gender = document.getElementById("gender");
const mobile = document.getElementById("mobile");
const code = document.getElementById("code");

// REGEX
var numberRegex = /\d/;
var alphanumericRegex = /^([a-z]*\d[a-z0-9]*|[a-z]+\d+[a-z0-9]*){50,}$/i;
var alphabeticRegex = /^[A-Za-z\s]+$/;
var emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-]+)(\.[a-zA-Z]{2,5}){1,2}$/;

//  SHOW ERROR MESSAGE
let errorMessage = "";
function showErrorPopup() {
    errorText.innerText = errorMessage;
    $(".error-popup").css("visibility", "visible");
    $(".error-popup").fadeIn("fast");
    setTimeout(function () {
        $(".error-popup").fadeOut("fast");
    }, 15000);
}

// FORM SUBMIT VALIDATION
function validateRegistration(event) {
    // STOP FORM FROM BEING SUBMITTED
    event.preventDefault();

    // FULLNAME
    if (fullname.value.length < 3) {
        fullname.style.borderColor = error;
        errorMessage = "You name cannot be shorter than 3 characters";
        showErrorPopup();
        fullname.focus();
        return false;
    } else if (numberRegex.test(fullname.value)) {
        fullname.style.borderColor = error;
        errorMessage = "Your name cannot contain a number";
        showErrorPopup();
        fullname.focus();
        return false;
    }
    // USERNAME
    else if (username.value.length < 3) {
        username.style.borderColor = error;
        errorMessage = "Username cannot be shorter than 3 characters";
        showErrorPopup();
        username.focus();
        return false;
    }
    // EMAIL
    else if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
        errorMessage = "Please enter a valid email address";
        showErrorPopup();
        email.focus();
        return false;
    } 
    // PASSWORD
    else if (password.value.length < 5) {
        password.style.borderColor = error;
        errorMessage = "Please enter a password longer than 5 characters";
        showErrorPopup();
        password.focus();
        return false;
    }
    else if (!numberRegex.test(password.value)) {
        password.style.borderColor = error;
        errorMessage = "Please enter a password containing at least one number";
        showErrorPopup();
        password.focus();
        return false;
    }
    // FORM FULLY VALIDATED
    else {
        regForm.submit();
    }
}

//EDIT PROFILE VALIDATION
function validateEditProfile(event) {
    // STOP FORM FROM BEING SUBMITTED
    event.preventDefault();

    // FULLNAME
    if (fullname.value.length < 3) {
        fullname.style.borderColor = error;
        errorMessage = "Your name cannot be shorter than 3 characters";
        showErrorPopup();
        fullname.focus();
        return false;
    } else if (numberRegex.test(fullname.value)) {
        fullname.style.borderColor = error;
        errorMessage = "Your name cannot contain a number";
        showErrorPopup();
        fullname.focus();
        return false;
    } // GENDER SELECTION
    else if (gender.value === "") {
        gender.style.borderColor = error;
        errorMessage = "Please select a gender";
        aler("error");
        showErrorPopup();
        gender.focus();
    }
    else {
    	editProfile.submit();
    	}
    }

// EDIT CODE VALIDATION
function validateCode(e) {
    // STOP FORM FROM BEING SUBMITTED
    e.preventDefault();
	
	//CODE
	if (code.value.length != 6) {
		code.style.borderColor = error;
		errorMessage = "Code must be 6-digits";
		showErrorPopup();
		code.focus();
		return false;
	} else if (alphabeticRegex.test(code.value)) {
        code.style.borderColor = error;
        errorMessage = "Your name cannot contain a letter";
        showErrorPopup();
        code.focus();
        return false;
    }
	else {
		codeForm.submit();
		}
	}

/*----------  ON CHANGE VALIDATION  ----------*/

// FULLNAME
function validateFullname() {
        if (fullname.value.length < 3) {
            fullname.style.borderColor = error;
        } else if (numberRegex.test(fullname.value)) {
            fullname.style.borderColor = error;
        } else {
            fullname.style.borderColor = success;
        }
}
// USERNAME
function validateUsername() {
    if (username.value.length < 3) {
        username.style.borderColor = error;
    } else {
        username.style.borderColor = success;
    }
}
// EMAIL
function validateEmail() {
    if (!emailRegex.test(email.value)) {
        email.style.borderColor = error;
    } else {
        email.style.borderColor = success;
    }
}
// PASSWORD
function validatePassword() {
    if (password.value.length < 5) {
        password.style.borderColor = error;
    }
    else if (!numberRegex.test(password.value)) {
        password.style.borderColor = error;
    }
    else {
        password.style.borderColor = success
    }
}

// CODE
function validateCode() {
    if (code.value.length != 6) {
        code.style.borderColor = error;
    } else {
        code.style.borderColor = success;
    }
}


