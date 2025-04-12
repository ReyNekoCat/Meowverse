<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse</title>
    <link rel="stylesheet" href="Styles/estiloNav.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>
    <header class="header">
        <a href="home.html" class="logo">
            <img src="images/meowverseB.png" alt="Logo" class="logo-img">
            Meowverse
        </a>
        <nav class="navbar">
            <a href="home.html" target="_top">Home</a>
            <a href="perfil.html" target="_top">Perfil</a>
            <a href="favs.html" target="_top">Favoritos</a>
        </nav>
        <div class="search-container">
            <form class="search-form" action="busquedaAv.html" method="GET" target="_top">
                <input type="text" placeholder="Buscar..." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
            <div class="advanced-search">
                <button class="advanced-search-btn">
                    <i class="fas fa-sliders-h"></i>
                </button>
                <div class="advanced-search-menu" id="advancedSearchMenu">
                    <h4>Búsqueda avanzada</h4>
                    
                    <div class="filter-group">
                        <label><strong>Categoría:</strong></label>
                        <select name="category">
                            <option value="">Todas</option>
                            <option value="funny">Funny</option>
                            <option value="happy">Happy</option>
                            <option value="sad">Sad</option>
                            <option value="food">Food</option>
                            <option value="care">Care</option>
                        </select>
                    </div>
                    
                    <div class="filter-group">
                        <label><strong>Ordenar por fecha:</strong></label>
                        <div class="radio-option">
                            <input type="radio" name="date_order" value="newest" id="newest" checked>
                            <label for="newest">Más nuevos primero</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" name="date_order" value="oldest" id="oldest">
                            <label for="oldest">Más antiguos primero</label>
                        </div>
                    </div>
                    
                    <div class="filter-group">
                        <label><strong>Publicados por:</strong></label>
                        <div class="radio-option">
                            <input type="radio" name="author" value="all" id="all" checked>
                            <label for="all">Todos los usuarios</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" name="author" value="me" id="me">
                            <label for="me">Solo mis publicaciones</label>
                        </div>
                    </div>
                    
                    <button type="button" class="apply-btn">Aplicar filtros</button>
                </div>
            </div>
        </div>
    </header>

    <script>
        // JavaScript para mostrar/ocultar el menú avanzado
        document.addEventListener('DOMContentLoaded', function() {
            const advancedBtn = document.querySelector('.advanced-search-btn');
            const advancedMenu = document.getElementById('advancedSearchMenu');
            
            advancedBtn.addEventListener('click', function(e) {
                e.stopPropagation(); // Evitar propagación
                advancedMenu.style.display = advancedMenu.style.display === 'block' ? 'none' : 'block';
            });
            
            // Cerrar el menú al hacer clic fuera
            document.addEventListener('click', function(e) {
                if (!advancedMenu.contains(e.target) && e.target !== advancedBtn) {
                    advancedMenu.style.display = 'none';
                }
            });
            
            // Evitar que el clic en el menú lo cierre
            advancedMenu.addEventListener('click', function(e) {
                e.stopPropagation();
            });
        });
    </script>
    
</body>
</html>