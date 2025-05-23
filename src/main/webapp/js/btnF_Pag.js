//PAGINACIÓN
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
            paginationHTML += `<a href="#" class="page-number ${i === 1 ? 'active' : ''}" data-page="${i}">${i}</a>`;
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

// Función para manejar el estado de favoritos
document.querySelectorAll('.favorite-btn').forEach(btn => {
    btn.addEventListener('click', function(e) {
        e.preventDefault();
        const postId = this.getAttribute('data-postid');
        fetch('${pageContext.request.contextPath}/SvToggleLike', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'postId=' + postId
        })
        .then(resp => resp.json())
        .then(data => {
            if (data.liked) {
                this.querySelector('.favorite-icon').classList.add('liked');
            } else {
                this.querySelector('.favorite-icon').classList.remove('liked');
            }
        });
    });
});

//document.addEventListener('DOMContentLoaded', function() {
//    // Seleccionar todos los botones de favoritos
//    const favoriteButtons = document.querySelectorAll('.favorite-btn');
//    
//    // Cargar estado de favoritos desde localStorage
//    let favorites = JSON.parse(localStorage.getItem('postFavorites')) || {};
//    
//    // Aplicar estado guardado a los botones
//    favoriteButtons.forEach((button, index) => {
//       const postId = `post-${index}`; // Crear un ID único para cada post
//        button.setAttribute('data-post-id', postId);
//        
//        // Verificar si este post está en favoritos
//        if (favorites[postId]) {
//            button.classList.add('active');
//        }
//        
//        // Añadir event listener para clicks
//        button.addEventListener('click', function() {
//            this.classList.toggle('active');
//            
//            // Actualizar el objeto de favoritos
//            const isFavorite = this.classList.contains('active');
//            favorites[postId] = isFavorite;
//            
//            // Guardar en localStorage
//            localStorage.setItem('postFavorites', JSON.stringify(favorites));
//        });
//    });
//});
