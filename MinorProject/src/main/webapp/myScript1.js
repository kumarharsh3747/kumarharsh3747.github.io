// Function to validate age
function validateAge() {
    var ageInput = document.getElementById('age');
    var ageError = document.getElementById('ageError');

    // Validate if age is a positive integer
    if (!/^\d+$/.test(ageInput.value) || parseInt(ageInput.value) <= 0) {
        ageError.textContent = 'Age must be a positive integer.';
        return false;
    }

    // Validate if age is within a specific range (e.g., between 18 and 99)
    var minAge = 18;
    var maxAge = 99;
    var enteredAge = parseInt(ageInput.value);

    if (enteredAge < minAge || enteredAge > maxAge) {
        window.alert(ageError.textContent = 'Age must be between ' + minAge + ' and ' + maxAge + '.');
        return false;
    }

    // If the age is valid, clear the error message
    ageError.textContent = '';
    return true;
}

// Function to validate the entire form
function validateForm() {
    // You can add more validation functions here if needed
     return validateAge() && validateMobileNumber();
}
