package com.lab.controller;

import com.lab.bean.StudentBean;
import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SubjectServlet extends HttpServlet {

    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if (action.equals("enroll")) {
            StudentBean student = (StudentBean) request.getSession().getAttribute("loggedUser");
            String subjectName = request.getParameter("subjectName");
            SubjectBean subject = new SubjectBean();
            subject.setMatricNo(student.getMatricNo());
            subject.setSubjectName(subjectName);

            try {
                subjectDAO.registerSubject(subject);
            } catch (Exception ex) {
                Logger.getLogger(SubjectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            response.sendRedirect("viewSubject.jsp");
        } else if (action.equals("delete")) {
            StudentBean student = (StudentBean) request.getSession().getAttribute("loggedUser");
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            System.out.println("ID: "+subjectId);
            try {
                System.out.println(subjectDAO.deleteSubject(subjectId));
            } catch (Exception ex) {
                Logger.getLogger(SubjectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            response.sendRedirect("viewSubject.jsp");

        } else if (action.equals("update")) {
           
                StudentBean student = (StudentBean) request.getSession().getAttribute("loggedUser");
                String subjectName = request.getParameter("subjectName");
                int subjectId = Integer.parseInt(request.getParameter("id"));
                SubjectBean subject = new SubjectBean();
                subject.setMatricNo(student.getMatricNo());
                subject.setSubjectName(subjectName);
                subject.setId(subjectId);

                try {
                    subjectDAO.updateSubject(subject);
                } catch (Exception ex) {
                    Logger.getLogger(SubjectServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                response.sendRedirect("viewSubject.jsp");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        StudentBean student = (StudentBean) request.getSession().getAttribute("loggedUser");
        String action = request.getParameter("action");

        if (action.equals("view")) {
            try {
                ArrayList<SubjectBean> subjects = subjectDAO.getAllSubjectByMatricNo(student.getMatricNo());

                request.setAttribute("subjects", subjects);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewSubject.jsp");
                requestDispatcher.forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(SubjectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            return;
        } else if (action.equals("viewUpdate")) {

            int id = Integer.parseInt(request.getParameter("subjectId"));
            SubjectBean subject = null;
            try {
                subject = subjectDAO.getSubjectById(id);
            } catch (Exception ex) {
                Logger.getLogger(SubjectServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("subject", subject);
            System.out.println(subject);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("updateSubject.jsp");
            requestDispatcher.forward(request, response);
            return;
        }

    }
}
