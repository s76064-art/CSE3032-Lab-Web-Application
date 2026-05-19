package com.lab.dao;

import com.lab.bean.SubjectBean;
import java.sql.*;
import java.util.ArrayList;

public class SubjectDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3307/lab7_db", "root", "");
    }

    public boolean registerSubject(SubjectBean subject) throws Exception {
        String sql = "INSERT INTO registered_subjects(subject_name, matric_no) VALUE(?, ?);";

        String matricNo = subject.getMatricNo();
        if (matricNo == null) {
            return false;
        }

        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, subject.getSubjectName());
                pstmt.setString(2, matricNo);

                return 0 > pstmt.executeUpdate();
            }
        }
    }

    public boolean updateSubject(SubjectBean subject) throws Exception {
        String sql = "UPDATE registered_subjects SET subject_name = ? WHERE id = ?";

        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, subject.getSubjectName());
                pstmt.setInt(2, subject.getId());

                int rows = pstmt.executeUpdate();

                return rows > 0;
            }
        }
    }

    public boolean deleteSubject(int id) throws Exception {
        String sql = "DELETE FROM registered_subjects WHERE id = ?";

        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, id);
                System.out.println(id);
                return 0 > pstmt.executeUpdate();
            }
        }
    }

    public ArrayList<SubjectBean> getAllSubjectByMatricNo(String matricNo) throws SQLException, Exception {
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";

        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, matricNo);

                try (ResultSet result = pstmt.executeQuery()) {
                    ArrayList<SubjectBean> subjects = new ArrayList<SubjectBean>();
                    while (result.next()) {
                        subjects.add(
                                new SubjectBean(
                                        result.getInt("id"),
                                        result.getString("subject_name"),
                                        result.getString("matric_no")
                                )
                        );
                    }
                    return subjects;
                }
            }
        }
    }

    public SubjectBean getSubjectById(int id) throws SQLException, Exception {
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";

        try (Connection conn = getConnection()) {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, id);

                try (ResultSet result = pstmt.executeQuery()) {
                    if (result.next()) {
                        return new SubjectBean(
                                result.getInt("id"),
                                result.getString("subject_name"),
                                result.getString("matric_no")
                        );
                    }

                }
            }
        }
        return null;
    }

}
