package com.lab.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.lab.bean.StudentBean;
import jakarta.servlet.RequestDispatcher;
import java.util.*;

public class StudentListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<StudentBean> stdList = new ArrayList<>();

        StudentBean s1 = new StudentBean();
        s1.setName("Ali bin Abu");
        s1.setMatricNo("S111");
        StudentBean s2 = new StudentBean();
        s2.setName("Siti Aminah");
        s2.setMatricNo("S222");
        StudentBean s3 = new StudentBean();
        s3.setName("Muthusamy");
        s3.setMatricNo("S333");
        stdList.add(s1);
        stdList.add(s2);
        stdList.add(s3);

        request.setAttribute("listData", stdList);

        RequestDispatcher rd = request.getRequestDispatcher("displayList.jsp");
        rd.forward(request, response);
    }


}
