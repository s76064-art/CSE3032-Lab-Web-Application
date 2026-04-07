package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.lab.dao.ProductDAO;


public class DeleteServlet extends HttpServlet {
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
        
        //Get product id from URL
        String id = request.getParameter("id");
        
        //Remove product from MySQL
        boolean success = productDAO.deleteProduct(Integer.parseInt(id));
        
        //Redirect to correct page if succefully delete the product
        if (success){
            response.sendRedirect("ViewServlet");
        }else{
            //Show error
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1>Error</h1>");
            out.print("<p>Unable to delete ");
            out.println(id);
            out.print(" from the system </p>");
            out.println("<a href='ViewServlet'>Main Menu</a>");
        }
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
