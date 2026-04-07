package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.lab.dao.ProductDAO;
import com.lab.model.Product;


public class UpdateServlet extends HttpServlet {
    
    private ProductDAO productDAO;

    //Initialize ProductDAO
    public void init() {
        productDAO = new ProductDAO();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        //Get id from URL/Parameter
        String id = request.getParameter("id");
        
        //Get product based on current id
        Product existingProduct = productDAO.getProductById(Integer.parseInt(id));
        
        //Reject if the product does not exist
        if (existingProduct != null) {
            out.println("<h2>Update Product </h2>");
            out.println("<form action='UpdateServlet' method='POST'>");
            out.println("<input type='hidden' name='id' value='"
                    + existingProduct.getId() + "'>");
            
            out.println("Product Name: <input type='text' name='name'value ='" + existingProduct.getName()+ "'  required><br><br>");
            out.println("Category: <input type='text' name='category'value ='" + existingProduct.getCategory()+ "'  required><br><br>");
            out.println("Price: <input type='number' name='price'value ='" + existingProduct.getPrice()+ "'  required><br><br>");
            out.println("Quantity: <input type='number' name='quantity'value ='" + existingProduct.getQuantity()+ "'  required><br><br>");

            out.println("<input type='submit' value='Update Product'>");
            out.println("</form>");
        } else {
            out.println("<h1>Error</h1>");
            out.print("<p>This");
            out.print(id);
            out.print(" does not exist in the system </p>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Get product info
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        //Update product to MySQL
        productDAO.updateProduct(new Product(id, name, category, price, quantity)); 
        
        response.sendRedirect("ViewServlet");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
