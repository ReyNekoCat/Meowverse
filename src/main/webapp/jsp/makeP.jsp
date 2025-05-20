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
        <div class="post-header">
            <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="Usuario" class="profile-pic">
            <div>
                <p class="user-name">Nombre</p>
                <select class="post-category">
                    <option value="Funny"> funny</option>
                    <option value="Sad"> sad </option>
                    <option value="Happy"> happy</option>
                </select>
            </div>
        </div>

        <textarea placeholder="¿Qué estás pensando?" class="post-text"></textarea>
        
        <!-- Área de previsualización de medios -->
        <div class="media-preview">
            <button class="remove-media">×</button>
            <img id="preview-image" style="display: none;">
            <video id="preview-video" controls style="display: none;"></video>
        </div>

        <div class="post-options">
            <button class="option-btn">? Foto/Video</button>
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
        <button class="post-btn">Publicar</button>
    </div>
    <script src="${pageContext.request.contextPath}/js/make-editP.js"></script>
</body>
</html>
