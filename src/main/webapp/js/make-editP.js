document.addEventListener('DOMContentLoaded', function() {
    // Elementos del DOM
    const postText = document.querySelector('.post-text');
    const postBtn = document.querySelector('.post-btn');
    const photoBtn = document.querySelector('.option-btn:nth-of-type(1)');
    const emojiBtn = document.querySelector('.option-btn:nth-of-type(2)');
    const categorySelect = document.querySelector('.post-category');
    const mediaPreview = document.querySelector('.media-preview');
    const previewImage = document.getElementById('preview-image');
    const previewVideo = document.getElementById('preview-video');
    const removeMediaBtn = document.querySelector('.remove-media');
    const postContainer = document.querySelector('.post-container');
    const emojiPicker = document.getElementById('emojiPicker');
    const postTextarea = document.getElementById('postTextarea');
    const emojiOptions = document.querySelectorAll('.emoji-option');
    
    
    // Variable para almacenar el archivo seleccionado
    let selectedFile = null;
        
    function autoResizeTextarea() {
        postText.style.height = 'auto';
        postText.style.height = postText.scrollHeight + 'px';
    }

    // Función para publicar
    function publicarPost() {
        const texto = postText.value.trim();
        const categoria = categorySelect.value;
        
        if (texto === '' && !selectedFile) {
            alert('Por favor escribe algo o sube una foto/video antes de publicar');
            return;
        }
        
        // Aquí normalmente enviarías los datos a un servidor
        console.log('Publicación creada:', {
            texto: texto,
            categoria: categoria,
            archivo: selectedFile ? selectedFile.name : 'Ninguno',
            fecha: new Date().toLocaleString()
        });

         // Mostrar éxito y redirigir
        if (confirm('¡Publicación creada con éxito!\n¿Deseas ir a la página de inicio?')) {
            window.location.href = 'home.html';
        }
        
        //limpiar
        postText.value = '';
        categorySelect.value = 'Funny';
        resetMediaPreview();
        autoResizeTextarea();
    }
    
    // Función para resetear la previsualización
    function resetMediaPreview() {
        previewImage.style.display = 'none';
        previewImage.src = '';
        previewVideo.style.display = 'none';
        previewVideo.src = '';
        mediaPreview.style.display = 'none';
        selectedFile = null;
    }
    
    // Función para añadir foto/video
    function añadirMedia() {
        // Crear input de tipo file dinámicamente
        const fileInput = document.createElement('input');
        fileInput.type = 'file';
        fileInput.accept = 'image/*, video/*';
        
        fileInput.onchange = (e) => {
            const file = e.target.files[0];
            if (file) {
                selectedFile = file;
                
                // Mostrar previsualización
                mediaPreview.style.display = 'block';
                
                if (file.type.startsWith('image/')) {
                    previewImage.style.display = 'block';
                    previewVideo.style.display = 'none';
                    
                    const reader = new FileReader();
                    reader.onload = (event) => {
                        previewImage.src = event.target.result;
                    };
                    reader.readAsDataURL(file);
                } 
                else if (file.type.startsWith('video/')) {
                    previewImage.style.display = 'none';
                    previewVideo.style.display = 'block';
                    
                    previewVideo.src = URL.createObjectURL(file);
                }
            }
        };
        
        fileInput.click();
    }
    
    // Función para insertar emoji
    function insertEmoji(emoji) {
        const startPos = postText.selectionStart;
        const endPos = postText.selectionEnd;
        const text = postText.value;
        
        postText.value = text.substring(0, startPos) + emoji + text.substring(endPos);
        postText.focus();
        postText.selectionStart = postText.selectionEnd = startPos + emoji.length;
        autoResizeTextarea();
    }
    
    // Mostrar/ocultar selector emojis
    emojiBtn.addEventListener('click', (e) => {
        e.stopPropagation();
        emojiPicker.style.display = emojiPicker.style.display === 'block' ? 'none' : 'block';
    });
    

    document.addEventListener('click', (e) => {
        if (e.target !== emojiBtn && !emojiPicker.contains(e.target)) {
            emojiPicker.style.display = 'none';
        }
    });
    
    // Insertar emoji 
    emojiOptions.forEach(emoji => {
        emoji.addEventListener('click', (e) => {
            e.stopPropagation();
            const emojiChar = emoji.textContent;
            insertEmoji(emojiChar);
            emojiPicker.style.display = 'none';
        });
    });
    
    postBtn.addEventListener('click', publicarPost);
    photoBtn.addEventListener('click', añadirMedia);
    removeMediaBtn.addEventListener('click', resetMediaPreview);
    postText.addEventListener('input', autoResizeTextarea);
    autoResizeTextarea();
    
});