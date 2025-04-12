<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Perfil</title>
    <link rel="icon" type="image/png" href="images/meowverseSL.png">
    <link rel="stylesheet" href="Styles/estiloP.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>

<body>
    <iframe src="navbar.html" width="100%" height="80" style="border:none; position:fixed; top:0; left:0; z-index:1000;"></iframe>
    <Section class="seccion-perfil-usuario">
        <div class="perfil-usuario-header">
            <div class="perfil-usuario-portada">
                <div class="perfil-usuario-avatar">
                    <img src="images/avatar2.png" alt="Usuario" class="profile-pic">
                    <button type="button" class="boton-avatar">
                        <i class="far fa-image"></i>
                    </button>
                </div>
                <button type="button" class="boton-portada">
                    <i class="far fa-image"></i> Cambiar fondo
                </button>
            </div>
        </div>
        <div class="perfil-usuario-body">
            <div class="perfil-usuario-bio">
                <h3 class="titulo">Nombre Usuario</h3>
                <p class="texto">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li><i class="icono fas fa-user"></i> Nombre:</li> 
                    <li><i class="icono fas fa-user-alt"></i> Apellido:</li> 
                    <li><i class="icono fas fa-birthday-cake"></i> Fecha nacimiento:</li> 
                    <li><i class="icono fas fa-calendar-day"></i> Edad:</li> 
                    <li><i class="icono fas fa-envelope"></i> Correo electrónico:</li> 
                    <li><i class="icono fas fa-key"></i> Contraseña:</li> 
                </ul> 
                <button class="btn">Editar</button>
                <button class="btn">Cerrar sesión</button>
            </div>
        </div>
    </section>
    
    <footer style="position: relative; z-index: 10;">
        <div class="footerContainer">
            <div class="footerNav">
                <ul>
                    <li><a href="termC.html" target="_self">Términos y condiciones</a></li>
                    <li><a href="sobreN.html" target="_self">Acerca de nosotros</a></li>
                </ul>
            </div>
        </div>
        <div class="footerBottom">
            <p>Copyright &copy;2025; Designed by <span class="designer">Areli Hernández y Rey Aguirre</span></p>
        </div>
    </footer>
    
</body>

</html>