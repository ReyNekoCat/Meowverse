<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloH.css">
</head>
<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:200; height: 200px;"></iframe>
    <div class="container">
        
        
        <h1 class="welcome-message">¡Bienvenido a Meowverse!</h1>

        <div class="add-new-post" id="post-background">
            <button id="add-new-btn" onclick="window.location.href='${pageContext.request.contextPath}/jsp/makeP.jsp'">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 144L48 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0 0 144c0 17.7 14.3 32 32 32s32-14.3 32-32l0-144 144 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-144 0 0-144z"/></svg>
                CREAR POST
            </button>
        </div> 

        <div class="post-list">
            <div class="post">
                <span class="user-container">
                <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="User Avatar" class="user-avatar">
                <h2 class="post-username">Username1</h2>
                </span>
                <img src="${pageContext.request.contextPath}/images/P1.jpeg" alt="Imagen post 1">
                <div>
                    <span class="post-category">happy</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <p class="post-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
                </p>
                <button class="favorite-btn">
                    <svg class="favorite-icon" viewBox="0 0 24 24" width="45" height="45">
                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                    </svg>
                </button>
            </div>
            <div class="post">
                 <span class="user-container">
                <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="User Avatar" class="user-avatar">
                <h2 class="post-username">Username2</h2>
                </span>
                <img src="${pageContext.request.contextPath}/images/P2.jpeg" alt="Imagen post 2">
                <div>
                    <span class="post-category">happy</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <p class="post-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora2.
                </p>
                <button class="favorite-btn">
                    <svg class="favorite-icon" viewBox="0 0 24 24" width="45" height="45">
                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                    </svg>
                </button>
            </div>
            <!-- Contenedor de paginación -->
            <div class="pagination" id="pagination-container">
                <!-- Los botones de paginación se generarán aquí con JavaScript -->
            </div>
        </div>
    </div>
    </script>
    
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

    <script src="${pageContext.request.contextPath}/js/btnF_Pag.js"></script> 

</body>
</html>
