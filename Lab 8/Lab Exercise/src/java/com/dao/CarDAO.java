package com.dao;

import com.model.Car;
import java.sql.*;
import com.util.ConnectionDB;
import java.util.ArrayList;

public class CarDAO {

    Connection connection;

    public CarDAO() {
        this.connection = new ConnectionDB().getConnection();
    }

    //Insert
    public void insert(Car car) throws SQLException {
        String sql = "INSERT INTO carpricelist (brand, model, cylinder, price) VALUE(?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, car.getBrand());
            pstmt.setString(2, car.getModel());
            pstmt.setInt(3, car.getCylinder());
            pstmt.setDouble(4, car.getPrice());

            boolean isSuccess = pstmt.executeUpdate() > 0;
            System.out.println("Insert new car status: " + isSuccess);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Update
    public void update(Car car) throws SQLException {
        String sql = "UPDATE carpricelist SET brand =?, model = ?, cylinder = ?, price =? WHERE car_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, car.getBrand());
            pstmt.setString(2, car.getModel());
            pstmt.setInt(3, car.getCylinder());
            pstmt.setDouble(4, car.getPrice());
            pstmt.setInt(5, car.getCarId());

            boolean isSuccess = pstmt.executeUpdate() > 0;
            System.out.println("Update new car status: " + isSuccess);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Delete
    public void delete(Car car) throws SQLException {
        String sql = "DELETE FROM carpricelist WHERE car_id = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);) {
            System.out.println("car id" + car.getCarId());
            pstmt.setInt(1, car.getCarId());

            boolean isSuccess = pstmt.executeUpdate() > 0;
            System.out.println("Delete new car status: " + isSuccess);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //Retrieved
    public ArrayList<Car> getAll() throws SQLException {
        String sql = "SELECT * FROM carpricelist";
        ArrayList<Car> carList = new ArrayList<>();
        try (PreparedStatement pstmt = connection.prepareStatement(sql); ResultSet result = pstmt.executeQuery();) {

            while (result.next()) {
                carList.add(
                        new Car(
                                result.getInt("car_id"),
                                result.getString("brand"),
                                result.getString("model"),
                                result.getInt("cylinder"),
                                result.getDouble("price")
                        )
                );
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return carList;
    }

    //Retrieved
    public Car getCarById(int id) throws SQLException {
        String sql = "SELECT * FROM carpricelist WHERE car_id=?";

        try (PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1, id);

            try (ResultSet result = pstmt.executeQuery()){
                if (result.next()) {
                    return new Car(
                            result.getInt("car_id"),
                            result.getString("brand"),
                            result.getString("model"),
                            result.getInt("cylinder"),
                            result.getDouble("price")
                    );
                }
            }
                

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            return null;
        }

    }
