<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.cooknest.model.Recipe" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>CookNest - View Recipes</title>
</head>
<body>
    <h1>All Recipes</h1>
    <ul>
        <%
            List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipes");
            if (recipes != null && !recipes.isEmpty()) {
                for (Recipe r : recipes) {
        %>
            <li><strong><%= r.getTitle() %></strong>: <%= r.getDescription() %></li>
        <%
                }
            } else {
        %>
            <li>No recipes added yet.</li>
        <%
            }
        %>
    </ul>
    <br>
    <a href="index.jsp">Back to Add Recipe</a>
</body>
</html>
