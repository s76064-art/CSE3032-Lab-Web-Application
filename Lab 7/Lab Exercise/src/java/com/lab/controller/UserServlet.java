package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig(maxFileSize = 16177215) // max 16 MB required for image upload
public class UserServlet extends HttpServlet {

    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if ("register".equals(action)) {

            StudentBean newStudent = new StudentBean();
            newStudent.setMatricNo(request.getParameter("matricNo"));
            newStudent.setFullname(request.getParameter("fullname"));
            newStudent.setPassword(request.getParameter("password"));
            InputStream inputStream = null;
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
            }
            boolean isSuccess = studentDAO.registerStudent(newStudent, inputStream);
            if (isSuccess) {
                response.getWriter().println("Registration Successful!<a href ='login.html'>Login here< / a >");
            } else {
                response.getWriter().println("Registration Failed!");
            }
        } else if ("login".equals(action)) {

            String matric = request.getParameter("matricNo");
            String pass = request.getParameter("password");
            StudentBean student = studentDAO.loginStudent(matric, pass);
            if (student != null) {

                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", student);
                response.sendRedirect("viewSubject.jsp");
            } else {
                response.getWriter().println("Invalid Credentials!<a href=\"login.html\">Try Again</a>");

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        if ("logout".equals(action)) {

            if (session != null) {
                session.invalidate(); 
            }
            response.sendRedirect("login.html");
        } else if ("delete".equals(action)) {

            if (session != null && session.getAttribute("loggedUser") != null) {
                StudentBean user = (StudentBean) session.getAttribute("loggedUser");
                studentDAO.deleteStudent(user.getMatricNo());
                session.invalidate(); // Destroy session after account deletion
            }
            response.sendRedirect("register.html");
        }
    }
}
