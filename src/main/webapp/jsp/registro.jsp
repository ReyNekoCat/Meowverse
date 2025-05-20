<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Meowverse</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloR.css">
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
            <h3 class="title">¡Regí­strate!</h3>
            
            <form action="../SvReg" method="post">
            <!-- Imagen -->
            <div class="profile-picture">
                <label for="profile-img" class="custom-file-upload">
                    <img id="preview-img" src="${pageContext.request.contextPath}/images/avatar2.png" alt="Imagen de perfil">
                    <input type="file" name="profile-img" accept="image/*">
                </label>
            </div>            
            
            <!-- Campos de registro -->
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" name="username" placeholder="Nombre de usuario">
                <div id="username-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" name="first-name" placeholder="Nombre(s)">
                <div id="first-name-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" name="last-name" placeholder="Apellidos">
                <div id="last-name-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-calendar-fill"></i>
                <input type="date" name="birth">
                <div id="birthdate-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-mail-fill"></i>
                <input type="email" name="email" placeholder="Correo electrónico">
                <div id="email-error" class="error-message"></div>
            </div>
            <div class="text-input">
                <i class="ri-lock-fill"></i>
                <input type="password" name="password" placeholder="Contraseña">
                <i class="ri-eye-line toggle-password" data-field="password"></i>
                <div id="password-error" class="error-message"></div>
            </div> 
            
            <div class="text-input">
                <i class="ri-lock-fill"></i>
                <input type="password" name="confirm-password" placeholder="Confirmar contraseña">
                <i class="ri-eye-line toggle-password" data-field="confirm-password"></i>
                <div id="confirm-password-error" class="error-message"></div>
            </div>
            
            <button id="register-btn" class="login-btn" type="submit">Crear cuenta</button>
            </form>
             <!-- Modal de éxito -->
            <div class="success-modal" id="success-modal">
                <div class="modal-content">
                    <i class="ri-checkbox-circle-fill"></i>
                    <h3>¡Cuenta creada con éxito!</h3>
                    <p>Tu cuenta ha sido registrada correctamente. Ahora puedes iniciar sesión.</p>
                    <button id="modal-close-btn">Aceptar</button>
                </div>
            </div>
            <div class="create">
                <a href="${pageContext.request.contextPath}/jsp/index.jsp">¿Ya tienes cuenta? Inicia sesión</a>
                <i class="ri-arrow-right-fill"></i>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/registroUsu.js"></script>
</body>
</html>
