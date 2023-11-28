      document.addEventListener("DOMContentLoaded", function () {
        // Function to validate the password
        function validatePassword() {
            var passwordInput = document.getElementById("password");
            var passwordError = document.getElementById("passwordError");

            // Your password criteria
            var minLength = 8;
            var hasNumber = /\d/;
            var hasLetter = /[a-zA-Z]/;

            // Reset the error message
            passwordError.textContent = "";

            // Check if the password meets the criteria
            if (passwordInput.value.length < minLength) {
                passwordError.textContent = "Password must be at least " + minLength + " characters long";
                return false;
            }

            if (!hasNumber.test(passwordInput.value)) {
                passwordError.textContent = "Password must contain at least one number";
                return false;
            }

            if (!hasLetter.test(passwordInput.value)) {
                passwordError.textContent = "Password must contain at least one letter";
                return false;
            }

            return true; // Password is valid
        }

        // Validate the password on form submission
        document.querySelector("form").addEventListener("submit", function (event) {
            if (!validatePassword()) {
                event.preventDefault(); // Prevent form submission if the password is not valid
            }
        });

        // Validate the password on input change
        document.getElementById("password").addEventListener("input", validatePassword);
    });
    
    