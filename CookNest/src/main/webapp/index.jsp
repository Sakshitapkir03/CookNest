<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CookNest - Add Recipe</title>
    <script>
        let hasSubmitted = false;
        function onFormSubmit() {
            hasSubmitted = true;
        }
        function showSuccessMessage() {
            if (hasSubmitted) {
                alert("Recipe added successfully!");
                document.getElementById("recipeForm").reset();
                hasSubmitted = false;
            }
        }
    </script>
</head>
<body>
    <h1>Add New Recipe</h1>
    <iframe name="hiddenFrame" style="display:none;" onload="showSuccessMessage()"></iframe>
    <form id="recipeForm" action="${pageContext.request.contextPath}/recipes" method="post" target="hiddenFrame" onsubmit="onFormSubmit()">
        Title: <input type="text" name="title" required><br><br>
        Description: <textarea name="description" required></textarea><br><br>
        <input type="submit" value="Add Recipe">
    </form>
    <br>
    <form action="${pageContext.request.contextPath}/recipes" method="get">
        <input type="submit" value="View Recipes">
    </form>
</body>
</html>
