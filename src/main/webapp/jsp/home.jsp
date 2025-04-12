<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse</title>
    <link rel="icon" type="image/png" href="images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloH.css">
</head>
<body>
    <iframe src="navbar.html" width="100%" height="80" style="border:none; position:fixed; top:0; left:0; z-index:1000;"></iframe>

    <div class="container">
        
        <h1 class="welcome-message">�Bienvenido a Meowverse!</h1>

        <div class="add-new-post" id="post-background">
            <button id="add-new-btn" onclick="window.location.href='makeP.html'">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 144L48 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0 0 144c0 17.7 14.3 32 32 32s32-14.3 32-32l0-144 144 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-144 0 0-144z"/></svg>
                CREAR POST
            </button>
        </div>

        <div class="post-list">
            <div class="post">
                <img src="images/P1.jpeg" alt="Imagen post 1">
                <div>
                    <span class="post-category">happy</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post01</h2>
                <p class="post-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
                </p>
                <button class="edit-btn">Editar</button>
                <button class="favorite-btn">
                    <svg class="favorite-icon" viewBox="0 0 24 24" width="45" height="45">
                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                    </svg>
                </button>
            </div>
            <div class="post">
                <img src="images/P3.jpeg" alt="Imagen post 2">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post02</h2>
                <p class="post-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
                </p>
                <button class="edit-btn">Editar</button>
                <button class="favorite-btn">
                    <svg class="favorite-icon" viewBox="0 0 24 24" width="45" height="45">
                        <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"></path>
                    </svg>
                </button> 
            </div>
            <div class="post">
                <img src="images/P3.jpeg" alt="Imagen post 3">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post03</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 4">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post04</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 5">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post05</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 6">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post06</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 7">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post07</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 8">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post08</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 9">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post09</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 10">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post10</h2>
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
                <img src="images/P3.jpeg" alt="Imagen post 11">
                <div>
                    <span class="post-category">funny</span>
                    <span class="post-date">2025.04.14</span>
                </div>
                <h2 class="post-title">post11</h2>
                <p class="post-content">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Mollitia, tempora.
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
                    <li><a href="termC.html" target="_self">Términos y condiciones</a></li>
                    <li><a href="sobreN.html" target="_self">Acerca de nosotros</a></li>
                </ul>
            </div>
        </div>
        <div class="footerBottom">
            <p>Copyright &copy;2025; Designed by <span class="designer">Areli Hernández y Rey Aguirre</span></p>
        </div>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const posts = document.querySelectorAll('.post');
            const postsPerPage = 10;
            const totalPosts = posts.length;
            const totalPages = Math.ceil(totalPosts / postsPerPage);
            const paginationContainer = document.getElementById('pagination-container');
            
            // Solo mostrar paginación si hay más de 10 posts
            if (totalPosts > postsPerPage) {
                createPagination();
                showPage(1); // Mostrar primera página por defecto
            } else {
                // Mostrar todos los posts si son 10 o menos
                posts.forEach(post => post.classList.add('show'));
            }
            
            function createPagination() {
                let paginationHTML = '';
                
                // Botón Anterior
                paginationHTML += '<a href="#" class="page-nav" data-page="prev">&laquo;</a>';
                
                // Números de página
                for (let i = 1; i <= totalPages; i++) {
                    paginationHTML += `<a href="#" class="page-number ${i == 1 ? 'active' : ''}" data-page="${i}">${i}</a>`;
                }
                
                // Botón Siguiente
                paginationHTML += '<a href="#" class="page-nav" data-page="next">&raquo;</a>';
                
                paginationContainer.innerHTML = paginationHTML;
                
                // Event listeners para los botones de paginación
                document.querySelectorAll('.page-number').forEach(button => {
                    button.addEventListener('click', function(e) {
                        e.preventDefault();
                        const page = parseInt(this.getAttribute('data-page'));
                        showPage(page);
                        updateActiveButton(page);
                    });
                });
                
                document.querySelectorAll('.page-nav').forEach(button => {
                    button.addEventListener('click', function(e) {
                        e.preventDefault();
                        const currentPage = parseInt(document.querySelector('.page-number.active').getAttribute('data-page'));
                        let newPage = currentPage;
                        
                        if (this.getAttribute('data-page') === 'prev' && currentPage > 1) {
                            newPage = currentPage - 1;
                        } else if (this.getAttribute('data-page') === 'next' && currentPage < totalPages) {
                            newPage = currentPage + 1;
                        }
                        
                        if (newPage !== currentPage) {
                            showPage(newPage);
                            updateActiveButton(newPage);
                        }
                    });
                });
            }
            
            function showPage(page) {
                const startIndex = (page - 1) * postsPerPage;
                const endIndex = startIndex + postsPerPage;
                
                // Ocultar todos los posts
                posts.forEach(post => post.classList.remove('show'));
                
                // Mostrar solo los posts de la página actual
                for (let i = startIndex; i < endIndex && i < totalPosts; i++) {
                    posts[i].classList.add('show');
                }
                
                // Desplazarse suavemente hacia arriba
                window.scrollTo({
                    top: document.querySelector('.post-list').offsetTop - 100,
                    behavior: 'smooth'
                });
            }
            
            function updateActiveButton(page) {
                document.querySelectorAll('.page-number').forEach(button => {
                    button.classList.remove('active');
                    if (parseInt(button.getAttribute('data-page')) === page) {
                        button.classList.add('active');
                    }
                });
                
                // Actualizar estado de botones Anterior/Siguiente
                const prevButton = document.querySelector('.page-nav[data-page="prev"]');
                const nextButton = document.querySelector('.page-nav[data-page="next"]');
                
                prevButton.classList.toggle('disabled', page === 1);
                nextButton.classList.toggle('disabled', page === totalPages);
            }
        });
    </script>

</body>
</html>
