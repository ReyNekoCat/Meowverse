<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse</title>
    <!-- Preconexiones y precargas para mejor rendimiento -->
    <link rel="preconnect" href="https://cdnjs.cloudflare.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preload" href="${pageContext.request.contextPath}/images/meowverseB.png" as="image">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');
        
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }
        
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding: 2em;
            padding-top: 45px;
            overflow-x: hidden;
        }
        
        .header {
            overflow: visible !important;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background: linear-gradient(to bottom right, #a02fe14c, #8e1f9f6b);
            padding: 15px 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 1000;
            backdrop-filter: blur(10px);
        }
        
        .logo {
            font-size: 32px;
            color: #fff;
            text-decoration: none;
            font-weight: 700;
            display: flex;
            align-items: center;
        }
        
        .logo-img {
            height: 50px;
            width: auto;
            margin-right: 10px;
            object-fit: contain;
        }
        
        .navbar a {
            font-size: 18px;
            color: #ffffff;
            font-weight: 500;
            text-decoration: none;
            margin-left: 40px;
            position: relative;
        }
        
        .navbar a::after {
            content: '';
            position: absolute;
            top: 100%;
            left: 0;
            width: 0;
            height: 2px;
            background: #fff;
            transition: .3s;
        }
        
        .navbar a:hover::after {
            width: 100%;
        }
        
        .search-container {
            position: relative;
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        
        .search-form {
            display: flex;
            align-items: center;
        }
        
        .search-form input[type="text"] {
            padding: 8px 15px;
            border: 2px solid #ccc;
            border-radius: 30px;
            outline: none;
            transition: all 0.3s ease;
            width: 200px;
        }
        
        .search-form input[type="text"]:focus {
            border-color: #9311c7;
        }
        
        .search-form button {
            background-color: #933ecb;
            color: white;
            border: none;
            border-radius: 50%;
            padding: 8px;
            width: 35px;
            height: 35px;
            cursor: pointer;
            margin-left: 8px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .search-form button:hover {
            background-color: #6200b3;
        }
        

        .advanced-search {
            position: relative;
            display: inline-block;
            margin-left: 10px;
            width: 50px; /* Ancho fijo de 50px */
        }
                
        .advanced-search-btn {
            background: none;
            border: none;
            border-radius: 100px;
            color: #c0c0c0;
            cursor: pointer;
            padding: 10px;
            transition: color 0.3s;
            font-size: 20px;
            height: 50px; /* Altura de 50px */
        }
        
        .advanced-search-btn:hover {
            color: #ffffff;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }
        
        /* Estilos del dropdown */
        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: white;
            min-width: 300px;
            max-height: 100px; /* Altura máxima antes de aparecer el scroll */
            overflow-y: auto; /* Scroll vertical cuando sea necesario */
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 8px;
            padding: 15px;
            margin-top: 10px;
            animation: dropdownFadeIn 0.3s ease;
        }
        
        .dropdown-content label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }
        
        .dropdown-content select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        
        .radio-option {
            margin-bottom: 8px;
            display: flex;
            align-items: center;
        }
        
        .radio-option input {
            margin-right: 8px;
        }
        
        .radio-option label {
            margin-bottom: 0;
            font-weight: 400;
        }
        
        .apply-btn {
            background-color: #933ecb;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 50px;
            cursor: pointer;
            font-size: 14px;
            width: 100%;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        
        .apply-btn:hover {
            background-color: #7a2da8;
        }
        
        .show {
            display: block;
        }
        
        @keyframes dropdownFadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <header class="header">
        <a href="${pageContext.request.contextPath}/jsp/home.jsp" class="logo">
            <!-- Logo optimizado con atributos para carga rápida -->
            <img src="${pageContext.request.contextPath}/images/meowverseB.png" alt="Meowverse Logo" class="logo-img" 
                 width="50" height="50" loading="eager" decoding="sync">
            Meowverse
        </a>
        <nav class="navbar">
            <a href="../SvPostList" target="_top">Home</a>
            <a href="${pageContext.request.contextPath}/jsp/perfil.jsp" target="_top">Perfil</a>
            <a href="../SvFavs" target="_top">Favoritos</a>
            <a href="../SvMyPosts" target="_top">Mis publicaciones</a>
        </nav>
        <div class="search-container">
            <form class="search-form" action="${pageContext.request.contextPath}/jsp/busquedaAv.jsp" method="GET" target="_top">
                <input type="text" placeholder="Buscar..." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
            <div class="advanced-search">
                <button class="advanced-search-btn" onclick="toggleDropdown()">
                    <i class="fas fa-sliders-h"></i>
                </button>
                <div class="dropdown-content" id="advancedDropdown">
                    <h4 style="margin-bottom: 15px; color: #333;">Búsqueda avanzada</h4>
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
                    
                    <!-- Añadiendo más opciones para demostrar el scroll -->
                    <div class="filter-group">
                        <label><strong>Tipo de contenido:</strong></label>
                        <div class="radio-option">
                            <input type="radio" name="content_type" value="all" id="all_content" checked>
                            <label for="all_content">Todos los tipos</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" name="content_type" value="images" id="images">
                            <label for="images">Solo imágenes</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" name="content_type" value="videos" id="videos">
                            <label for="videos">Solo videos</label>
                        </div>
                    </div>
                    
                    <div class="filter-group">
                        <label><strong>Rango de fechas:</strong></label>
                        <select name="date_range">
                            <option value="">Cualquier fecha</option>
                            <option value="today">Hoy</option>
                            <option value="week">Esta semana</option>
                            <option value="month">Este mes</option>
                            <option value="year">Este año</option>
                        </select>
                    </div>
                    
                    <button type="button" class="apply-btn">Aplicar filtros</button>
                </div>
            </div>
        </div>
    </header>

       <script>
        function toggleDropdown() {
            document.getElementById("advancedDropdown").classList.toggle("show");
        }
        
        // Cerrar el dropdown solo si se hace clic fuera de él o de su botón
        window.onclick = function(event) {
            const dropdown = document.getElementById("advancedDropdown");
            const button = document.querySelector('.advanced-search-btn');
            
            if (!dropdown.contains(event.target) && !button.contains(event.target)) {
                dropdown.classList.remove("show");
            }
        }
        
        // Función para aplicar los filtros y redirigir
        function aplicarFiltros() {
            // Obtener los valores seleccionados
            const categoria = document.querySelector('select[name="category"]').value;
            const ordenFecha = document.querySelector('input[name="date_order"]:checked').value;
            const autor = document.querySelector('input[name="author"]:checked').value;
            
            // Construir la URL con los parámetros
            const urlParams = new URLSearchParams();
            if (categoria) urlParams.append('category', categoria);
            urlParams.append('date_order', ordenFecha);
            urlParams.append('author', autor);
            
            // Redirigir a la página de búsqueda avanzada con target _top
            window.top.location.href = `${pageContext.request.contextPath}/jsp/busquedaAv.jsp?${urlParams.toString()}`;
        }

        // Asignar la función al botón
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelector('.apply-btn').addEventListener('click', aplicarFiltros);
        });
    </script>
</body>
</html>