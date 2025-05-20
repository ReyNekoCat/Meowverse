<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Favoritos</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloFav.css">
</head>
<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:1000; height: 1000px;"></iframe>

    <h1 class="results-title">Tus favoritos...</h1>
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
                <svg class="favorite-icon" viewBox="0 0 24 24" width="30" height="30">
                    <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                </svg>
            </button>
        </div>
        <div class="post">
            <span class="user-container">
                <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="User Avatar" class="user-avatar">
                <h2 class="post-username">Username2</h2>
            </span>
            <img src="${pageContext.request.contextPath}/images/P3.jpeg" alt="Imagen post 2">
            <div>
                <span class="post-category">funny</span>
                <span class="post-date">2025.04.14</span>
            </div>
            <p class="post-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
            </p>
            <button class="favorite-btn">
                <svg class="favorite-icon" viewBox="0 0 24 24" width="30" height="30">
                    <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                </svg>
            </button>
        </div>
        <div class="post">
            <span class="user-container">
                <img src="${pageContext.request.contextPath}/images/avatar2.png" alt="User Avatar" class="user-avatar">
                <h2 class="post-username">Username3</h2>
            </span>
            <img src="${pageContext.request.contextPath}/images/P3.jpeg" alt="Imagen post 3">
            <div>
                <span class="post-category">funny</span>
                <span class="post-date">2025.04.14</span>
            </div>
            <p class="post-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
            </p>
            <button class="favorite-btn">
                <svg class="favorite-icon" viewBox="0 0 24 24" width="30" height="30">
                    <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                </svg>
            </button>
        </div>
    </div>

    <!-- footer<iframe src="footer.html" width="100%" height="80" style="border:none; position:relative; bottom:0; left:0; z-index:10;"></iframe>
    -->

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