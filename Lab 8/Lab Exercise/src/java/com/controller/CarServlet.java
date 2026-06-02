package com.controller;

import com.dao.CarDAO;
import com.model.Car;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CarServlet extends HttpServlet {

    private CarDAO carDAO;

    public void init() {
        carDAO = new CarDAO();
    }

    //Display
    public void display(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //Retrive data
        ArrayList<Car> cars = carDAO.getAll();

        request.setAttribute("cars", cars);
        RequestDispatcher requestDisaptcher = request.getRequestDispatcher("CarList.jsp");
        requestDisaptcher.forward(request, response);
    }

    public void showEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //Retrive data
        String carIdStr = request.getParameter("carId");
        
        int carid = Integer.parseInt(carIdStr);
        
        Car car = carDAO.getCarById(carid);

        request.setAttribute("car", car);
        RequestDispatcher requestDisaptcher = request.getRequestDispatcher("AddCar.jsp");
        requestDisaptcher.forward(request, response);
    }

    //Insert
    public void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //Retrive data from user
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String cylinderStr = request.getParameter("cylinder");
        String priceStr = request.getParameter("price");

        int cylinderInt = Integer.parseInt(cylinderStr);
        double priceDouble = Double.parseDouble(priceStr);

        Car newCar = new Car(-1, brand, model, cylinderInt, priceDouble);

        carDAO.insert(newCar);
        response.sendRedirect(request.getContextPath() + "/CarList.jsp");
    }

    //Update
    public void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //Retrive data from user
        String carIdStr = request.getParameter("carId");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String cylinderStr = request.getParameter("cylinder");
        String priceStr = request.getParameter("price");

        int carIdInt = Integer.parseInt(carIdStr);
        int cylinderInt = Integer.parseInt(cylinderStr);
        double priceDouble = Double.parseDouble(priceStr);

        Car newCar = new Car(carIdInt, brand, model, cylinderInt, priceDouble);

        carDAO.update(newCar);
        response.sendRedirect(request.getContextPath() + "/CarList.jsp");
    }

    //Delete
    public void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //Retrive data from user
        String carIdStr = request.getParameter("carId");

        int carIdInt = Integer.parseInt(carIdStr);

        Car newCar = new Car(carIdInt, null, null, -1, 0.0);

        carDAO.delete(newCar);
        response.sendRedirect(request.getContextPath() + "/CarList.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("display".equals(action)) {
            try {
                display(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CarServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            System.out.println("Invalid action");
            response.sendRedirect(request.getContextPath() + "/CarList.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (null == action) {
            System.out.println("Invalid action");
            response.sendRedirect(request.getContextPath() + "/CarList.jsp");
        } else {
            try {
                switch (action) {
                    case "insert":
                        System.out.println("Inder");
                        insert(request, response);
                        break;

                    case "update":
                        update(request, response);
                        break;
                    case "showEdit":
                        showEdit(request, response);
                        break;
                        
                    case "delete":
                        delete(request, response);
                        break;

                    default:
                        System.out.println("Invalid action");
                        response.sendRedirect(
                                request.getContextPath() + "/CarServlet?action=display"
                        );
                        break;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
