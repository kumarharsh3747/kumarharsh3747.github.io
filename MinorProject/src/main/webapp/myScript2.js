// Function to validate mobile number
function validateMobileNumber() {
    var mobileInput = document.getElementById('mobileNumber');
    var mobileNumberError = document.getElementById('mobileNumberError');

    // Validate if mobile number is a valid 10-digit number
    var mobileRegex = /^[0-9]{10}$/;

    if (!mobileRegex.test(mobileInput.value)) {
       window.alert( mobileNumberError.textContent = 'Enter a valid 10-digit mobile number.');
        return false;
    }

    // If the mobile number is valid, clear the error message
    mobileNumberError.textContent = '';
    return true;
}

// Function to validate the entire form
function validateForm() {
    // You can add more validation functions here if needed
     return validateAge() && validateMobileNumber();
}
/**
 * 
 */