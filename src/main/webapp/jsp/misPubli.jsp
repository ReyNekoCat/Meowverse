<%@ page import="java.util.List" %>
<%@ page import="models.Post" %>
<%@ page import="models.User" %>
<%
    List<Post> posts = (List<Post>) request.getAttribute("posts");
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meowverse - Mis publicaciones</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloFav.css">
</head>
<body>
    <iframe src="${pageContext.request.contextPath}/jsp/navbar.jsp" width="100%" style="border:none; position:fixed; top:0; left:0; z-index:200; height: 200px;"></iframe>

    <h1 class="results-title">Tus publicaciones...</h1>
    <div class="post-list">
        <% if (posts != null && !posts.isEmpty()) {
            for (Post post : posts) { %>
            <div class="post">
                <span class="user-container">
                    <img src="<%= request.getContextPath() + "/" + (user.getPFP() != null && !user.getPFP().isEmpty() ? user.getPFP() : "images/avatar2.png") %>" alt="User Avatar" class="user-avatar">
                    <h2 class="post-username"><%= user.getUsername() %></h2>
                </span>
                <% if (post.getImage() != null && !post.getImage().isEmpty()) { %>
                    <img src="<%= request.getContextPath() + "/" + post.getImage() %>" alt="Imagen post">
                <% } %>
                <div>
                    <!-- Category if you have it -->
                    <span class="post-date"><%= post.getCreationDate() != null ? post.getCreationDate() : "" %></span>
                </div>
                <p class="post-content">
                    <%= post.getDescription() %>
                </p>
                <button class="favorite-btn">
                    <!-- SVG or icon here -->
                </button>
                <button class="edit-btn" onclick="window.location.href='${pageContext.request.contextPath}/SvEditPost?id=<%= post.getId() %>'">
                   <svg class="edit-icon" viewBox="0 0 24 24" width="30" height="30">
                        <path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"></path>
                    </svg>
                </button>
            </div>
        <% }
        } else { %>
            <p>No tienes publicaciones todavía.</p>
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
</body>
</html>