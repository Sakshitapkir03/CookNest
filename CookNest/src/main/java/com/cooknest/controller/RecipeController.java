package com.cooknest.controller;

import com.cooknest.model.Recipe;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/recipes")
public class RecipeController extends HttpServlet {

    @Override
    public void init() {
        if (getServletContext().getAttribute("recipes") == null) {
            getServletContext().setAttribute("recipes", new ArrayList<Recipe>());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Recipe recipe = new Recipe(title, description);
        List<Recipe> recipes = (List<Recipe>) getServletContext().getAttribute("recipes");
        recipes.add(recipe);

        response.setContentType("text/plain");
        response.getWriter().write("");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("🍳 Reached doGet() — Preparing to forward to viewRecipes.jsp");
        List<Recipe> recipes = (List<Recipe>) getServletContext().getAttribute("recipes");
        request.setAttribute("recipes", recipes);
        request.getRequestDispatcher("viewRecipes.jsp").forward(request, response);
    }
}
