package com.lab.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import com.lab.bean.*;
import jakarta.servlet.RequestDispatcher;

public class payrollServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Employee> employees = new ArrayList<>();

        employees.add(new Employee("E001", "max verstappen", "RedBull Racing", 128000.99));
        employees.add(new Employee("E002", "Markus Person", "Game Development", 8000.50));
        employees.add(new Employee("E003", "Ammar Khasab", "Marines", 10000.50));
        employees.add(new Employee("E004", "Amin Albert", "Human Resources", 2500.50));
        employees.add(new Employee("E005", "Mohammad Magnus", "Resource and Development", 73100.50));
        employees.add(new Employee("E006", "Maria", "Front Desk", 1500.50));
        employees.add(new Employee("E007", "Minah", "Back End", 100000.50));

        request.setAttribute("employees", employees);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view.jsp");
        dispatcher.forward(request, response);
    }

}
