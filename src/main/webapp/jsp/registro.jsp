<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Meowverse</title>
    <link rel="icon" type="image/png" href="images/meowverseSL.png">
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
                        <img id="preview-img" src="images/avatar2.png" alt="Imagen">
                        <input type="file" name="profile-img" accept="image/*" onchange="previewImage(event)">
                    </label>
                </div>            

                <!-- Datos -->
                <div class="text-input">
                    <i class="ri-user-fill"></i>
                    <input type="text" name="username" placeholder="Nombre de usuario">
                </div>
                <div class="text-input">
                    <i class="ri-user-fill"></i>
                    <input type="text" name="first-name" placeholder="Nombre(s)">
                </div>
                <div class="text-input">
                    <i class="ri-user-fill"></i>
                    <input type="text" name="last-name" placeholder="Apellidos">
                </div>
                <div class="text-input">
                    <i class="ri-calendar-fill"></i>
                    <input type="date" name="birth">
                </div>
                <div class="text-input">
                    <i class="ri-mail-fill"></i>
                    <input type="email" name="email" placeholder="Correo electrÃ³nico">
                </div>
                <div class="text-input">
                    <i class="ri-lock-fill"></i>
                    <input type="password" name="password" placeholder="ContraseÃ±a">
                </div>
                <button class="login-btn" type="submit">Crear cuenta</button>
            </form>
                      
            <div class="create">
                <a href="index.jsp">¿Ya tienes cuenta? Inicia sesión</a>
                <i class="ri-arrow-right-fill"></i>
            </div>
        </div>
    </div>
</body>
</html>
