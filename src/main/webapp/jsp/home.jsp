<%@ page import="java.util.List" %>
<%@ page import="models.Post" %>
<%@ page import="dao.userDAO" %>
<%@ page import="models.User" %>
<%@ page import="classes.connection" %>
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
                <!-- Your SVG here -->
                CREAR POST
            </button>
        </div> 

        <div class="post-list">
            <%
                List<Post> posts = (List<Post>) request.getAttribute("posts");
                if (posts != null && !posts.isEmpty()) {
                    // Only create DAO connection once for efficiency
                    userDAO uDao = new userDAO(new connection().Connect());
                    for (Post post : posts) {
                        User postUser = uDao.getUser(post.getUserId());
                        %>
                        <div class="post">
                            <span class="user-container">
                                <img src="<%= request.getContextPath() + "/" + (postUser != null && postUser.getPFP() != null && !postUser.getPFP().isEmpty() ? postUser.getPFP() : "images/avatar2.png") %>" alt="User Avatar" class="user-avatar">
                                <h2 class="post-username"><%= postUser != null ? postUser.getUsername() : "Usuario desconocido" %></h2>
                            </span>
                            <% if (post.getImage() != null && !post.getImage().isEmpty()) { %>
                                <img src="<%= request.getContextPath() + "/" + post.getImage() %>" alt="Imagen post">
                            <% } %>
                            <div>
                                <!-- You can add category here if you implement it -->
                                <span class="post-date"><%= post.getCreationDate() != null ? post.getCreationDate() : "" %></span>
                            </div>
                            <p class="post-content">
                                <%= post.getDescription() %>
                            </p>
                            <button class="favorite-btn">
                                <!-- SVG or icon here -->
                            </button>
                        </div>
                        <%
                    }
                    // Close connection if needed (optional: depends on your connection pooling)
                } else {
            %>
                <p>No hay posts para mostrar.</p>
            <% } %>
            <!-- Pagination container (if needed) -->
            <div class="pagination" id="pagination-container"></div>
        </div>
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