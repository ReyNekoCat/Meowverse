<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Miowverse</title>
    <link rel="icon" type="image/png" href="images/meowverseSL.png">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="Styles/estiloR.css">
</head>
<body>
    <div class="container"> 
        <div class="design">
            <div class="pill-1 rotate-45"></div>
            <div class="pill-2 rotate-45"></div>
            <div class="pill-3 rotate-45"></div>
            <div class="pill-4 rotate-45"></div>
        </div>

        <div class="registro">
            <h3 class="title">¡Regístrate!</h3>
            
            <!-- Imagen -->
            <div class="profile-picture">
                <label for="profile-img" class="custom-file-upload">
                    <img id="preview-img" src="images/avatar2.png" alt="Imagen de perfil">
                    <input type="file" id="profile-img" accept="image/*">
                </label>
            </div>            
            
            <!-- Campos de registro -->
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" id="username" placeholder="Nombre de usuario">
                <div id="username-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" id="first-name" placeholder="Nombre(s)">
                <div id="first-name-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" id="last-name" placeholder="Apellidos">
                <div id="last-name-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-calendar-fill"></i>
                <input type="date" id="birthdate">
                <div id="birthdate-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-mail-fill"></i>
                <input type="email" id="email" placeholder="Correo electrónico">
                <div id="email-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-lock-fill"></i>
                <input type="password" id="password" placeholder="Contraseña">
                <i class="ri-eye-line toggle-password" data-field="password"></i>
                <div id="password-error" class="error-message"></div>
            </div> 
            
            <div class="text-input">
                <i class="ri-lock-fill"></i>
                <input type="password" id="confirm-password" placeholder="Confirmar contraseña">
                <i class="ri-eye-line toggle-password" data-field="confirm-password"></i>
                <div id="confirm-password-error" class="error-message"></div>
            </div>
            
            <button id="register-btn" class="login-btn">Crear cuenta</button>
            
            <div class="create">
                <a href="index.html">¿Ya tienes cuenta? Inicia sesión</a>
                <i class="ri-arrow-right-fill"></i>
        </div>
    </div>
    <script src="Java Script/registroUsu.js"></script>
</body>
</html>
