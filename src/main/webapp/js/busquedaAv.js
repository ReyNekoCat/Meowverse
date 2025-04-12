document.addEventListener('DOMContentLoaded', function() {
    const advancedSearchBtn = document.querySelector('.advanced-search-btn');
    const advancedSearchMenu = document.getElementById('advancedSearchMenu');
    const applyBtn = document.querySelector('.apply-btn');
    const searchForm = document.querySelector('.search-form');

    // Toggle del menú de búsqueda avanzada
    advancedSearchBtn.addEventListener('click', function(e) {
        e.stopPropagation();
        advancedSearchMenu.style.display = advancedSearchMenu.style.display === 'block' ? 'none' : 'block';
    });

    // Aplicar filtros y cerrar menú
    applyBtn.addEventListener('click', function() {
        advancedSearchMenu.style.display = 'none';
        searchForm.submit();
    });

    // Cerrar el menú al hacer clic fuera de él
    document.addEventListener('click', function(event) {
        if (!event.target.closest('.advanced-search') && 
            advancedSearchMenu.style.display === 'block') {
            advancedSearchMenu.style.display = 'none';
        }
    });

    // Prevenir que el clic en el menú lo cierre
    advancedSearchMenu.addEventListener('click', function(e) {
        e.stopPropagation();
    });
});