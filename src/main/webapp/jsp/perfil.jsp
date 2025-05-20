<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Perfil</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloP.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
</head>

<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:1000; height: 1000px;"></iframe>
    <Section class="seccion-perfil-usuario">
        <div class="perfil-usuario-header">
            <div class="perfil-usuario-portada">
                <div class="perfil-usuario-avatar">
                    <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="Usuario" class="profile-pic" id="avatar-usuario">
                    <button type="button" class="boton-avatar" id="btn-cambiar-avatar">
                        <i class="far fa-image"></i>
                    </button>
                </div> 
            </div>
        </div>
        <div class="perfil-usuario-body">
            <div class="perfil-usuario-bio">
                <h3 class="titulo">Nombre Usuario</h3>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li><i class="icono fas fa-user"></i> Nombre: <span id="nombre-usuario">Usuario Ejemplo</span></li> 
                    <li><i class="icono fas fa-user-alt"></i> Apellido: <span id="apellido-usuario">Apellido Ejemplo</span></li> 
                    <li><i class="icono fas fa-birthday-cake"></i> Fecha nacimiento: <span id="fecha-nacimiento">01/01/2000</span></li> 
                    <li><i class="icono fas fa-calendar-day"></i> Edad: <span id="edad-usuario">23</span></li> 
                    <li><i class="icono fas fa-envelope"></i> Correo electrónico: <span id="correo-usuario">ejemplo@meowverse.com</span></li> 
                    <li><i class="icono fas fa-key"></i> Contraseña: <span id="contrasena-usuario">????????</span></li> 
                </ul> 
                <button class="btn" id="btn-editar">Editar</button>
                <button class="btn" id="btn-cerrar-sesion">Cerrar sesión</button>
            </div>
        </div>
    </section>
    
    <!-- Modal de edición de perfil -->
    <div class="modal" id="modal-editar">
        <span class="cerrar-modal" id="cerrar-modal-editar">&times;</span>
        <div class="contenido-modal">
            <h2>Editar Perfil</h2>
            <form class="formulario-editar" id="formulario-editar">
                <label for="edit-nombre">Nombre:</label>
                <input type="text" id="edit-nombre" name="nombre" required>
                
                <label for="edit-apellido">Apellido:</label>
                <input type="text" id="edit-apellido" name="apellido" required>
                
                <label for="edit-fecha-nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="edit-fecha-nacimiento" name="fecha-nacimiento" required>
                
                <label for="edit-correo">Correo Electrónico:</label>
                <input type="email" id="edit-correo" name="correo" required>
                
                <label for="edit-contrasena">Contraseña:</label>
                <input type="password" id="edit-contrasena" name="contrasena" required>
                
                <div class="botones-formulario">
                    <button type="button" class="cancelar" id="btn-cancelar-editar">Cancelar</button>
                    <button type="submit" class="guardar">Guardar Cambios</button>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Modal para cambiar imagen -->
    <div class="modal" id="modal-imagen">
        <span class="cerrar-modal" id="cerrar-modal-imagen">&times;</span>
        <div class="contenido-modal">
            <h2 id="titulo-modal-imagen">Cambiar Imagen</h2>
            <div class="opciones-imagen">
                <div class="opcion-imagen" id="opcion-subir">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <span>Subir nueva imagen</span>
                    <input type="file" id="input-imagen" class="subir-imagen" accept="image/*">
                    <img id="preview-imagen" class="preview-imagen" alt="Vista previa">
                </div>
            </div>
            <div class="botones-formulario" style="margin-top: 20px;">
                <button type="button" class="cancelar" id="btn-cancelar-imagen">Cancelar</button>
                <button type="button" class="guardar" id="btn-guardar-imagen" disabled>Guardar Cambios</button>
            </div>
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
    
    <script>
        // Funcionalidad para el botón Editar
        document.addEventListener('DOMContentLoaded', function() {
            // Variables para el modal de edición
            const btnEditar = document.getElementById('btn-editar');
            const modalEditar = document.getElementById('modal-editar');
            const btnCerrarModalEditar = document.getElementById('cerrar-modal-editar');
            const btnCancelarEditar = document.getElementById('btn-cancelar-editar');
            const formularioEditar = document.getElementById('formulario-editar');
            
            // Variables para el modal de imagen
            const btnCambiarAvatar = document.getElementById('btn-cambiar-avatar');
            const modalImagen = document.getElementById('modal-imagen');
            const btnCerrarModalImagen = document.getElementById('cerrar-modal-imagen');
            const btnCancelarImagen = document.getElementById('btn-cancelar-imagen');
            const btnGuardarImagen = document.getElementById('btn-guardar-imagen');
            const tituloModalImagen = document.getElementById('titulo-modal-imagen');
            const inputImagen = document.getElementById('input-imagen');
            const previewImagen = document.getElementById('preview-imagen');
            const opcionSubir = document.getElementById('opcion-subir');
            
            // Elementos del perfil
            const nombreUsuario = document.getElementById('nombre-usuario');
            const apellidoUsuario = document.getElementById('apellido-usuario');
            const fechaNacimiento = document.getElementById('fecha-nacimiento');
            const edadUsuario = document.getElementById('edad-usuario');
            const correoUsuario = document.getElementById('correo-usuario');
            const contrasenaUsuario = document.getElementById('contrasena-usuario');
            const avatarUsuario = document.getElementById('avatar-usuario');
            
            // Variable para controlar qué imagen se está cambiando (avatar o portada)
            let tipoImagenActual = ''; // 'avatar' o 'portada'
            
            // Mostrar modal de edición al hacer clic en Editar
            btnEditar.addEventListener('click', function() {
                // Llenar el formulario con los datos actuales
                document.getElementById('edit-nombre').value = nombreUsuario.textContent;
                document.getElementById('edit-apellido').value = apellidoUsuario.textContent;
                document.getElementById('edit-correo').value = correoUsuario.textContent;
                document.getElementById('edit-contrasena').value = ''; // No mostramos la contraseña real por seguridad
                
                // Convertir fecha de nacimiento al formato YYYY-MM-DD para el input date
                if(fechaNacimiento.textContent) {
                    const partesFecha = fechaNacimiento.textContent.split('/');
                    if(partesFecha.length === 3) {
                        const fechaFormateada = `${partesFecha[2]}-${partesFecha[1].padStart(2, '0')}-${partesFecha[0].padStart(2, '0')}`;
                        document.getElementById('edit-fecha-nacimiento').value = fechaFormateada;
                    }
                }
                
                modalEditar.style.display = 'flex';
            });
            
            // Cerrar modal de edición
            btnCerrarModalEditar.addEventListener('click', function() {
                modalEditar.style.display = 'none';
            });
            
            btnCancelarEditar.addEventListener('click', function() {
                modalEditar.style.display = 'none';
            });
            
            modalEditar.addEventListener('click', function(e) {
                if(e.target === modalEditar) {
                    modalEditar.style.display = 'none';
                }
            });
            
            // Manejar el envío del formulario de edición
            formularioEditar.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Obtener valores del formulario
                const nuevoNombre = document.getElementById('edit-nombre').value;
                const nuevoApellido = document.getElementById('edit-apellido').value;
                const nuevaFechaNacimiento = document.getElementById('edit-fecha-nacimiento').value;
                const nuevoCorreo = document.getElementById('edit-correo').value;
                const nuevaContrasena = document.getElementById('edit-contrasena').value;
                
                // Actualizar los datos en el perfil
                nombreUsuario.textContent = nuevoNombre;
                apellidoUsuario.textContent = nuevoApellido;
                correoUsuario.textContent = nuevoCorreo;
                
                // Formatear fecha de nacimiento (de YYYY-MM-DD a DD/MM/YYYY)
                if(nuevaFechaNacimiento) {
                    const partesFecha = nuevaFechaNacimiento.split('-');
                    const fechaFormateada = `${partesFecha[2]}/${partesFecha[1]}/${partesFecha[0]}`;
                    fechaNacimiento.textContent = fechaFormateada;
                    
                    // Calcular y actualizar la edad
                    const fechaNac = new Date(nuevaFechaNacimiento);
                    const hoy = new Date();
                    let edad = hoy.getFullYear() - fechaNac.getFullYear();
                    const mes = hoy.getMonth() - fechaNac.getMonth();
                    if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNac.getDate())) {
                        edad--;
                    }
                    edadUsuario.textContent = edad;
                }
                
                // Si se cambió la contraseña, mostrar asteriscos
                if(nuevaContrasena) {
                    contrasenaUsuario.textContent = '????????';
                }
                
                // Cerrar el modal
                modalEditar.style.display = 'none';
                
                console.log('Datos actualizados:', {
                    nombre: nuevoNombre,
                    apellido: nuevoApellido,
                    fechaNacimiento: nuevaFechaNacimiento,
                    correo: nuevoCorreo,
                    contrasena: nuevaContrasena
                });
                
                alert('Perfil actualizado correctamente');
            });
            
            // Funcionalidad para el modal de imagen 
            btnCambiarAvatar.addEventListener('click', function() {
                tipoImagenActual = 'avatar';
                tituloModalImagen.textContent = 'Cambiar Avatar';
                resetModalImagen();
                modalImagen.style.display = 'flex';
            });
            
            // Cerrar modal de imagen
            btnCerrarModalImagen.addEventListener('click', function() {
                modalImagen.style.display = 'none';
            });
            
            btnCancelarImagen.addEventListener('click', function() {
                modalImagen.style.display = 'none';
            });
            
            modalImagen.addEventListener('click', function(e) {
                if(e.target === modalImagen) {
                    modalImagen.style.display = 'none';
                }
            });
            
            // Funcionalidad para subir imagen
            opcionSubir.addEventListener('click', function() {
                inputImagen.click();
            });
            
            inputImagen.addEventListener('change', function(e) {
                if(e.target.files && e.target.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(event) {
                        previewImagen.src = event.target.result;
                        previewImagen.style.display = 'block';
                        btnGuardarImagen.disabled = false;
                    };
                    
                    reader.readAsDataURL(e.target.files[0]);
                }
            });
            
            // Guardar cambios de imagen
            btnGuardarImagen.addEventListener('click', function() {
                if(tipoImagenActual === 'avatar') {
                    // Cambiar el avatar
                    avatarUsuario.src = previewImagen.src;
                    alert('Avatar cambiado correctamente');
                } else {
                    // Cambiar la portada (aquí deberías implementar la lógica real)
                    alert('Portada cambiada correctamente (en una aplicación real, aquí se cambiaría el fondo)');
                }
                
                modalImagen.style.display = 'none';
            });
            
            // Función para resetear el modal de imagen
            function resetModalImagen() {
                previewImagen.style.display = 'none';
                inputImagen.value = '';
                btnGuardarImagen.disabled = true;
            }
            
            // Funcionalidad para el botón Cerrar sesión
            document.getElementById('btn-cerrar-sesion').addEventListener('click', function() {
                alert('Sesión cerrada');
                window.location.href = 'index.html';
            });
        });
    </script>
</body>

</html>