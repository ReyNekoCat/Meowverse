<%@ page import="models.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        return;
    }
    // Calculate age
    java.util.Calendar dob = java.util.Calendar.getInstance();
    dob.setTime(user.getBirthdate());
    java.util.Calendar today = java.util.Calendar.getInstance();
    int age = today.get(java.util.Calendar.YEAR) - dob.get(java.util.Calendar.YEAR);
    if (today.get(java.util.Calendar.DAY_OF_YEAR) < dob.get(java.util.Calendar.DAY_OF_YEAR)) {
        age--;
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Meowverse - Perfil</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloP.css">
</head>

<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:200; height: 200px;"></iframe>
    <section class="seccion-perfil-usuario">
        <div class="perfil-usuario-header">
            <div class="perfil-usuario-portada">
                <div class="perfil-usuario-avatar">
                    <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="Usuario" class="profile-pic" id="avatar-usuario">
                </div>
            </div>
        </div>
        <div class="perfil-usuario-body">
            <div class="perfil-usuario-bio">
                <h3 class="titulo"><%= user.getUsername() %></h3>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li><i class="icono fas fa-user"></i> Nombre: <span id="nombre-usuario"><%= user.getFirstN() %></span></li>
                    <li><i class="icono fas fa-user-alt"></i> Apellido: <span id="apellido-usuario"><%= user.getLastN() %></span></li>
                    <li><i class="icono fas fa-birthday-cake"></i> Fecha nacimiento: <span id="fecha-nacimiento"><%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(user.getBirthdate()) %></span></li>
                    <li><i class="icono fas fa-calendar-day"></i> Edad: <span id="edad-usuario"><%= age %></span></li>
                    <li><i class="icono fas fa-envelope"></i> Correo electrónico: <span id="correo-usuario"><%= user.getEmail() %></span></li>
                    <li><i class="icono fas fa-key"></i> Contraseña: <span id="contrasena-usuario">********</span></li>
                </ul>
                <button class="btn" id="btn-editar" onclick="document.getElementById('modal-editar').style.display='flex';">Editar</button>
                <form action="${pageContext.request.contextPath}/SvLogout" method="post" style="display:inline;">
                    <button class="btn" type="submit" id="btn-cerrar-sesion">Cerrar sesión</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Modal de edición de perfil -->
    <div class="modal" id="modal-editar" style="display:none;">
        <span class="cerrar-modal" onclick="document.getElementById('modal-editar').style.display='none';">&times;</span>
        <div class="contenido-modal">
            <h2>Editar Perfil</h2>
            <form class="formulario-editar" id="formulario-editar"
                  action="${pageContext.request.contextPath}/SvEditUser" method="post">
                <label for="edit-nombre">Nombre:</label>
                <input type="text" id="edit-nombre" name="first_name" required value="<%= user.getFirstN() %>">

                <label for="edit-apellido">Apellido:</label>
                <input type="text" id="edit-apellido" name="last_name" required value="<%= user.getLastN() %>">

                <label for="edit-fecha-nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="edit-fecha-nacimiento" name="birth_date"
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(user.getBirthdate()) %>" required>

                <label for="edit-correo">Correo Electrónico:</label>
                <input type="email" id="edit-correo" name="email" required value="<%= user.getEmail() %>">

                <label for="edit-username">Usuario:</label>
                <input type="text" id="edit-username" name="username" required value="<%= user.getUsername() %>">

                <label for="edit-contrasena">Contraseña:</label>
                <input type="password" id="edit-contrasena" name="password" required value="<%= user.getPass() %>">

                <div class="botones-formulario">
                    <button type="button" class="cancelar" onclick="document.getElementById('modal-editar').style.display='none';">Cancelar</button>
                    <button type="submit" class="guardar">Guardar Cambios</button>
                </div>
            </form>
            <% if (request.getAttribute("MensajeEdicion") != null) { %>
                <div style="color:green; margin-top:10px;"><%= request.getAttribute("MensajeEdicion") %></div>
            <% } %>
        </div>
    </div>

    <footer style="position: relative; z-index: 10;">
        <div class="footerContainer">
            <div class="footerNav">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/jsp/termC.jsp" target="_self">Términos y condiciones</a></li>
                    <li><a href="${pageContext.request.contextPath}/jsp/sobreN.jsp" target="_self">Acerca de nosotros</a></li>
                </ul>
            </div>
        </div>
        <div class="footerBottom">
            <p>Copyright &copy;2025; Designed by <span class="designer">Areli Hernández y Rey Aguirre</span></p>
        </div>
    </footer>
</body>
</html>