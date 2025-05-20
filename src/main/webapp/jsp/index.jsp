<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Meowverse</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloIndx.css">
</head>

<body>
    <div class="container">

        <div class="design">
            <div class="pill-1 rotate-45"></div>
            <div class="pill-2 rotate-45"></div>
            <div class="pill-3 rotate-45"></div>
            <div class="pill-4 rotate-45"></div>
        </div>
        <div class="login">
        <form action="../SvLogin" method="get">    
            <h3 class="title">¡Bienvenido!</h3>
            <div class="text-input">
                <i class="ri-user-fill"></i>
                <input type="text" name="username" placeholder="Nombre de usuario">
            </div>
            <div class="text-input">
                <i class="ri-lock-fill"></i>
                <input type="password" name="password" placeholder="Contraseña" id="passwordInput">
                <i class="ri-eye-line toggle-password" id="togglePassword"></i>
            </div>
            <button class="login-btn" type="submit">Login</button>
        </form>      
            <div class="create">
                <a href="registro.jsp">Crear una cuenta</a>
                <i class="ri-arrow-right-fill"></i>
            </div>
        </div>
    </div>
    <!--script src="${pageContext.request.contextPath}/js/index.js"></script-->
</body>

</html>