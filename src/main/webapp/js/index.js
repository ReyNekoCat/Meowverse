document.addEventListener('DOMContentLoaded', function() {
    // Elementos del DOM
    const loginBtn = document.querySelector('.login-btn');
    const usernameInput = document.querySelector('input[type="text"]');
    const passwordInput = document.getElementById('passwordInput');
    const togglePassword = document.getElementById('togglePassword');

    // Función para mostrar/ocultar contraseña
    if (togglePassword && passwordInput) {
        togglePassword.addEventListener('click', function() {
            const isPassword = passwordInput.type === 'password';
            passwordInput.type = isPassword ? 'text' : 'password';
            this.classList.toggle('ri-eye-line');
            this.classList.toggle('ri-eye-off-line');
            this.style.color = isPassword ? '#421797' : '#686868';
        });
    }

    // Función para mostrar errores
    function showError(message) {
        // Eliminar errores anteriores si existen
        const existingError = document.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
    
        // Crear elemento de error con estilos personalizados
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        
        // Aplicar estilos directamente (puedes mover esto a CSS si prefieres)
        errorDiv.style.cssText = `
            color:rgb(117, 11, 174);
            font-size: 14px;
            font-weight: 500;
            margin: 10px 0;
            padding: 8px 12px;
            background-color:rgb(253, 235, 255);
            border-radius: 6px;
            border-left: 4px solid rgb(170, 49, 218);
            width: 60%;
            text-align: center;
            animation: fadeIn 0.3s ease-out;
        `;
    
        // Insertar el mensaje después del formulario
        const form = document.querySelector('.login');
        form.appendChild(errorDiv);
    
        // Eliminar automáticamente después de 3 segundos
        setTimeout(() => {
            errorDiv.style.animation = 'fadeOut 0.3s ease-out';
            setTimeout(() => errorDiv.remove(), 300);
        }, 3000);
    }
    

    // Validación de login
    if (loginBtn) {
        loginBtn.addEventListener('click', function(e) {
            e.preventDefault();
            
            const username = usernameInput.value.trim();
            const password = passwordInput.value.trim();
            
            // Validar campos vacíos
            if (!username || !password) {
                showError('Por favor complete todos los campos');
                return;
            }

            // Validar credenciales
            if (username === 'Admin12' && password === '12As.111') {
                window.location.href = 'home.html';
            } else {
                showError('Usuario o contraseña incorrectos');
            }
        });
    }

    // Opcional: Validar al presionar Enter
    [usernameInput, passwordInput].forEach(input => {
        if (input) {
            input.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    loginBtn.click();
                }
            });
        }
    });
});