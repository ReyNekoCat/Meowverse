<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Crear Publicación</title>
    <link rel="icon" type="image/png" href="images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloMP.css">
</head>
<body>

    <div class="post-container">
        <div class="post-header">
            <img src="images/avatar2.png" alt="Usuario" class="profile-pic">
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

        <div class="post-options">
            <button class="option-btn">📷 Foto/Video</button>
            <button class="option-btn">😊 Emoji</button>
        </div>

        <button class="post-btn">Publicar</button>
    </div>


</body>
</html>
