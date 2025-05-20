document.addEventListener('DOMContentLoaded', function() {
    const registerBtn = document.getElementById('register-btn');
    const profileImgInput = document.getElementById('profile-img');
    const previewImg = document.getElementById('preview-img');
    
    // Expresiones regulares para validaciones
    const regex = {
        username: /^[a-zA-Z0-9_]{4,20}$/, // 4-20 caracteres alfanuméricos y guiones bajos
        name: /^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{2,50}$/, // 2-50 caracteres alfabéticos y espacios
        email: /^[^\s@]+@(gmail\.com|outlook\.com|hotmail\.com|yahoo\.com|icloud\.com|me\.com|mac\.com|mail\.com)$/i,
        password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]).{8,}$/ // Mínimo 8 caracteres, 1 mayúscula, 1 minúscula, 1 número y 1 signo
    };
     
    // Función para mostrar errores 
    function showError(inputId, message) {
        const errorElement = document.getElementById(`${inputId}-error`);
        errorElement.innerHTML = `<span class="tooltip-text">${message}</span>`;
        errorElement.style.display = 'inline-flex';
        
        const inputElement = document.getElementById(inputId);
        inputElement.classList.add('error');
        
        // Mover el icono toggle-password cuando hay error
        const toggleIcon = inputElement.parentElement.querySelector('.toggle-password');
        if (toggleIcon) {
            toggleIcon.style.right = '32px'; // Mover 20px a la izquierda (ajusta según necesites)
        }
    }

    // Función para limpiar errores 
    function clearError(inputId) {
        const errorElement = document.getElementById(`${inputId}-error`);
        errorElement.innerHTML = '';
        errorElement.style.display = 'none';
        
        const inputElement = document.getElementById(inputId);
        inputElement.classList.remove('error');
        
        // Restaurar posición original del icono toggle-password
        const toggleIcon = inputElement.parentElement.querySelector('.toggle-password');
        if (toggleIcon) {
            toggleIcon.style.right = '12px'; // Posición original
        }
    }
    
    // Función para mostrar/ocultar contraseña
    function togglePassword(fieldId) {
        const passwordField = document.getElementById(fieldId);
        const icon = passwordField.parentElement.querySelector('.toggle-password');
        
        if (!passwordField || !icon) return;
        
        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.classList.replace("ri-eye-line", "ri-eye-off-line");
        } else {
            passwordField.type = "password";
            icon.classList.replace("ri-eye-off-line", "ri-eye-line");
        }
    }
    
    // Validaciones individuales
    function validateUsername() {
        const username = document.getElementById('username').value.trim();
        if (!username) {
            showError('username', 'Se requiere usuario');
            return false;
        }
        if (!regex.username.test(username)) {
            showError('username', '4-20 caracteres alfanuméricos y guiones bajos');
            return false;
        }
        clearError('username');
        return true;
    }
    
    function validateFirstName() {
        const firstName = document.getElementById('first-name').value.trim();
        if (!firstName) {
            showError('first-name', 'Se requiere nombre(s)');
            return false;
        }
        if (!regex.name.test(firstName)) {
            showError('first-name', 'Solo letras y espacios (2-50 caracteres)');
            return false;
        }
        clearError('first-name');
        return true;
    }
    
    function validateLastName() {
        const lastName = document.getElementById('last-name').value.trim();
        if (!lastName) {
            showError('last-name', 'Se requiere apellido(s)');
            return false;
        }
        if (!regex.name.test(lastName)) {
            showError('last-name', 'Solo letras y espacios (2-50 caracteres)');
            return false;
        }
        clearError('last-name');
        return true;
    }
    
    function validateBirthdate() {
        const birthdate = document.getElementById('birthdate').value;
        if (!birthdate) {
            showError('birthdate', 'Se requiere fecha');
            return false;
        }
        
        const birthDate = new Date(birthdate);
        const today = new Date();
        let age = today.getFullYear() - birthDate.getFullYear();
        const monthDiff = today.getMonth() - birthDate.getMonth();
        
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        
        if (age < 13) {
            showError('birthdate', 'Debes tener al menos 13 años');
            return false;
        }
        
        clearError('birthdate');
        return true;
    }
    
    function validateEmail() {
        const email = document.getElementById('email').value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const allowedDomains = /@(gmail|outlook|hotmail|yahoo|icloud|me|mac|mail)\.com$/i;
        
        if (!email) {
            showError('email', 'Escribe correo electrónico');
            return false;
        }
        if (!emailRegex.test(email)) {
            showError('email', 'Correo no válido');
            return false;
        }
        if (!allowedDomains.test(email)) {
            showError('email', 'Solo se permiten: gmail, outlook, hotmail, yahoo, icloud, me, mac o mail');
            return false;
        }
        clearError('email');
        return true;
    }
    
    function validatePassword() {
        const password = document.getElementById('password').value;
        if (!password) {
            showError('password', 'Se requiere contraseña');
            return false;
        }
        if (!regex.password.test(password)) {
            showError('password', 'Mínimo 8 caracteres, 1 mayúscula, 1 minúscula, 1 número y 1 signo de puntuación');
            return false;
        }
        clearError('password');
        return true;
    }
    
    function validateConfirmPassword() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm-password').value;
        
        if (!confirmPassword) {
            showError('confirm-password', 'Confirma tu contraseña');
            return false;
        }
        if (password !== confirmPassword) {
            showError('confirm-password', 'Contraseñas no coinciden');
            return false;
        }
        clearError('confirm-password');
        return true;
    }
    
    
    // Función para previsualizar la imagen
    function previewImage(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                previewImg.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }
    
    // Event listeners para validación en tiempo real
    document.getElementById('username').addEventListener('blur', validateUsername);
    document.getElementById('first-name').addEventListener('blur', validateFirstName);
    document.getElementById('last-name').addEventListener('blur', validateLastName);
    document.getElementById('birthdate').addEventListener('blur', validateBirthdate);
    document.getElementById('email').addEventListener('blur', validateEmail);
    document.getElementById('password').addEventListener('blur', validatePassword);
    document.getElementById('confirm-password').addEventListener('blur', validateConfirmPassword);
    
    // Event listeners para los botones de mostrar/ocultar contraseña
    document.querySelectorAll('.toggle-password').forEach(icon => {
        icon.addEventListener('click', function() {
            const fieldId = this.getAttribute('data-field');
            togglePassword(fieldId);
        });
    });
    
    profileImgInput.addEventListener('change', function(event) {
        previewImage(event);
        validateImage();
    });
    
    // Manejar el clic en el botón de registro
    registerBtn.addEventListener('click', function(e) {
        e.preventDefault();
        
        // Ejecutar todas las validaciones
        const isUsernameValid = validateUsername();
        const isFirstNameValid = validateFirstName();
        const isLastNameValid = validateLastName();
        const isBirthdateValid = validateBirthdate();
        const isEmailValid = validateEmail();
        const isPasswordValid = validatePassword();
        const isConfirmPasswordValid = validateConfirmPassword();
        
        // Si todas las validaciones son correctas
        if (isUsernameValid && isFirstNameValid && isLastNameValid && 
            isBirthdateValid && isEmailValid && isPasswordValid && 
            isConfirmPasswordValid) {
            
            // Crear objeto con los datos del usuario
            const userData = {
                username: document.getElementById('username').value.trim(),
                firstName: document.getElementById('first-name').value.trim(),
                lastName: document.getElementById('last-name').value.trim(),
                birthdate: document.getElementById('birthdate').value,
                email: document.getElementById('email').value.trim(),
                password: document.getElementById('password').value,
            };
            
            // Mostrar modal de éxito
            const successModal = document.getElementById('success-modal');
            successModal.style.display = 'flex';
            
            // Cerrar modal al hacer clic en el botón
            document.getElementById('modal-close-btn').addEventListener('click', function() {
                successModal.style.display = 'none';
                // Opcional: redirigir al usuario a la página de inicio de sesión
                window.location.href = 'index.html';
            });
            
            // También puedes cerrar el modal haciendo clic fuera del contenido
            successModal.addEventListener('click', function(e) {
                if (e.target === successModal) {
                    successModal.style.display = 'none';
                    window.location.href = 'index.html';
                }
            });
        }
    });
});