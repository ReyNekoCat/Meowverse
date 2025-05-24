<%@ page import="java.util.List" %>
<%@ page import="models.Post" %>
<%@ page import="dao.userDAO" %>
<%@ page import="models.User" %>
<%@ page import="classes.connection" %>
<%
    List<Post> posts = (List<Post>) request.getAttribute("posts");
    List<Integer> favoritePostIds = (List<Integer>) request.getAttribute("favoritePostIds");
    userDAO uDao = new userDAO(new connection().Connect());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Busqueda Avanzada</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloBA.css">
</head>
<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:200; height: 200px;"></iframe>
    <h1 class="results-title">Resultados de tu búsqueda...</h1>
    <div class="post-list">
        <% if (posts != null && !posts.isEmpty()) {
            for (Post post : posts) {
                User postUser = uDao.getUser(post.getUserId());
                boolean liked = favoritePostIds != null && favoritePostIds.contains(post.getId());
        %>
        <div class="post">
            <span class="user-container">
                <img src="<%= request.getContextPath() + "/" + (postUser != null && postUser.getPFP() != null && !postUser.getPFP().isEmpty() ? postUser.getPFP() : "images/avatar2.png") %>" class="user-avatar">
                <h2 class="post-username"><%= postUser != null ? postUser.getUsername() : "Usuario desconocido" %></h2>
            </span>
            <% if (post.getImage() != null && !post.getImage().isEmpty()) { %>
                <img src="<%= request.getContextPath() + "/" + post.getImage() %>" alt="Imagen post">
            <% } %>
            <div>
                <span class="post-category"><%= post.getCategory() != null ? post.getCategory() : "" %></span>
                <span class="post-date"><%= post.getCreationDate() != null ? post.getCreationDate() : "" %></span>
            </div>
            <span class="post-title"><b><%= post.getTitle() %></b></span>
            <p class="post-content"><%= post.getDescription() %></p>
            <button class="favorite-btn" data-postid="<%= post.getId() %>">
                <svg class="favorite-icon <%= liked ? "liked" : "" %>" viewBox="0 0 24 24" width="30" height="30">
                    <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
                </svg>
            </button>
        </div>
        <% }
        } else { %>
            <p>No hay resultados para tu búsqueda.</p>
        <% } %>
    </div>
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
    <script>
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
    </script>
</body>
</html>