<%@ page import="models.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Crear Publicación</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloMP.css">
</head>
<body>
    <div class="post-container">
        <form action="${pageContext.request.contextPath}/SvPostCreate" method="post" enctype="multipart/form-data">
        <div class="post-header">
            <img src="<%= (user.getPFP() != null && !user.getPFP().isEmpty()) 
                ? (request.getContextPath() + "/" + user.getPFP()) 
                : (request.getContextPath() + "/images/avatar2.png") %>" 
                alt="Usuario" class="profile-pic" id="avatar-usuario">
            <div>
                <p class="user-name"><%= user.getUsername()%></p>
                <select class="post-category" name="category" required>
                    <option value="Funny">funny</option>
                    <option value="Sad">sad</option>
                    <option value="Happy">happy</option>
                </select>
            </div>
        </div>
                
        <input type="text" name="title" placeholder="Título del post" class="post-title-input" required>
        <textarea name="description" placeholder="¿Qué estás pensando?" class="post-text"></textarea>
        <div class="photo-upload-group">
            <!-- Hidden real file input -->
            <input type="file" name="image" id="fileInput" accept="image/*" style="display:none;">
            <!-- Styled button triggers file input -->
            <button type="button" class="photo-btn" onclick="document.getElementById('fileInput').click();">
                <span>Foto</span>
            </button>
            <!-- Optional: show filename -->
            <span id="fileName" class="file-name"></span>
        </div>
        <!-- Image preview area under the input -->
        <div id="imagePreview" class="image-preview"></div>

        <button class="post-btn">Publicar</button>
        </form>
        
        <!-- Área de previsualización de medios -->
        <div class="media-preview">
            <button class="remove-media">×</button>
            <img id="preview-image" style="display: none;">
            <video id="preview-video" controls style="display: none;"></video>
        </div>

        <!--div class="post-options">
            <button class="option-btn">Foto</button>
            <button class="option-btn">? Emoji</button>
            <div class="emoji-picker" id="emojiPicker">
                <div class="emoji-grid">
                    <div class="emoji-option" title="Gato">?</div>
                    <div class="emoji-option" title="Gato negro">???</div>
                    <div class="emoji-option" title="Gato enojado">?</div>
                    <div class="emoji-option" title="Gato llorando">?</div>
                    <div class="emoji-option" title="Gato asustado">?</div>
                    <div class="emoji-option" title="Gato besando">?</div>
                    <div class="emoji-option" title="Gato sonriente">?</div>
                    <div class="emoji-option" title="Gato enamorado">?</div>
                    <div class="emoji-option" title="Gato riendo">?</div>
                    <div class="emoji-option" title="Gato feliz">?</div>
                    <div class="emoji-option" title="Gato sonriendo">?</div>
                    <div class="emoji-option" title="Gato genérico">?</div>
                    <div class="emoji-option" title="Huella de gato">?</div>
                    <div class="emoji-option" title="Cara de gato">???</div>
                    <div class="emoji-option" title="Gato con ojos de corazón">???</div>
                    <div class="emoji-option" title="Gato bailando">???</div>
                    <div class="emoji-option" title="Gato astronauta">???</div>
                    <div class="emoji-option" title="Gato ninja">???</div>
                </div>
            </div>
        </div>  
    </div-->
    <!--script src="${pageContext.request.contextPath}/js/make-editP.js"></script-->
    <script>
    const fileInput = document.getElementById('fileInput');
    const fileName = document.getElementById('fileName');
    const imagePreview = document.getElementById('imagePreview');

    fileInput.addEventListener('change', function(e) {
        const file = this.files[0];
        if (file) {
            fileName.textContent = file.name;

            // Only preview image if it's an image
            if(file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function(evt) {
                    imagePreview.innerHTML = '<img src="' + evt.target.result + '" alt="Vista previa de la imagen">';
                };
                reader.readAsDataURL(file);
            } else {
                imagePreview.innerHTML = '';
            }
        } else {
            fileName.textContent = '';
            imagePreview.innerHTML = '';
        }
    });
    </script>
</body>
</html>
