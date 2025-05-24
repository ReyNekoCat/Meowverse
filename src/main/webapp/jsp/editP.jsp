<%@ page import="models.User" %>
<%@ page import="models.Post" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    Post post = (Post) request.getAttribute("post");
    if (user == null || post == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Editar Publicación</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloMP.css">
</head>
<body>
    <div class="post-container">
        <form action="${pageContext.request.contextPath}/SvEditPost" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= post.getId() %>">
            <div class="post-header">
                <img src="${pageContext.request.contextPath}/<%= user.getPFP() != null && !user.getPFP().isEmpty() ? user.getPFP() : "images/avatar2.png" %>" alt="Usuario" class="profile-pic">
                <div>
                    <p class="user-name"><%= user.getUsername() %></p>
                    <select class="post-category" name="category" required>
                        <option value="Funny" <%= "Funny".equals(post.getCategory()) ? "selected" : "" %>>funny</option>
                        <option value="Sad" <%= "Sad".equals(post.getCategory()) ? "selected" : "" %>>sad</option>
                        <option value="Happy" <%= "Happy".equals(post.getCategory()) ? "selected" : "" %>>happy</option>
                    </select>
                </div>
            </div>
            <input type="text" name="title" placeholder="Título del post" value="<%= post.getTitle() %>" class="post-title-input" required>
            <textarea name="description" placeholder="¿Qué estás pensando?" class="post-text" required><%= post.getDescription() %></textarea>

            <label for="image-upload">Imagen actual:</label>
            <% if (post.getImage() != null && !post.getImage().isEmpty()) { %>
                <img src="<%= request.getContextPath() + "/" + post.getImage() %>" alt="Imagen actual" style="max-width: 100%; margin-bottom: 10px;">
            <% } %>
            <input type="file" name="image" id="image-upload" accept="image/*">

            <button class="post-btn" type="submit">Guardar cambios</button>
        </form>

        <!-- Área de previsualización de medios -->
        <div class="media-preview">
            <button class="remove-media" onclick="removePreview();return false;">×</button>
            <img id="preview-image" style="display: none; max-width: 100%;">
            <video id="preview-video" controls style="display: none;"></video>
        </div>

        <!--div class="post-options">
            <button class="option-btn" type="button" onclick="document.getElementById('image-upload').click();">Foto</button>
            <button class="option-btn" type="button">? Emoji</button>
            <div class="emoji-picker" id="emojiPicker" style="display: none;">
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
            </div-->
        </div>  
    </div>
    <script>
        // Preview for selected image (optional, for UX)
        document.getElementById('image-upload').addEventListener('change', function(event) {
            var preview = document.getElementById('preview-image');
            var file = event.target.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            }
        });

        function removePreview() {
            var preview = document.getElementById('preview-image');
            preview.src = '';
            preview.style.display = 'none';
            document.getElementById('image-upload').value = '';
        }
    </script>
</body>
</html>