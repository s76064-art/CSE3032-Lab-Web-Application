package com.lab.controller;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class ViewServlet extends HttpServlet {

    private ProductDAO productDAO;

    //Initialize ProductDAO
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //Get all products
        List<Product> products = productDAO.getAllProducts();
        
        //Output
        out.println("<h2>Product List</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Quantity</th> <th>Actions</th></tr>");
        for (Product product : products) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>" + product.getPrice() + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td><a href='UpdateServlet?id=" + product.getId()
                    + "'>Edit</a> | ");
            out.println("<a href='DeleteServlet?id=" + product.getId() + "'>Delete</a > </td>");
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("<br><a href='add_product.html'>Add Product</a>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
