package com.servlet.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/request1")
public class Admin_patient extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String driver = "com.mysql.cj.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String database = "1page";
        String userid = "root";
        String password = "root";

        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);

            // Loop through parameter names and update status for each patient
            for (String name : request.getParameterMap().keySet()) {
                String patientName = name;
                String status = request.getParameter(name);

                // Update status based on patient name
                String updateQuery = "UPDATE request SET status = ? WHERE name = ?";
                try (PreparedStatement updateStatement = connection.prepareStatement(updateQuery)) {
                    updateStatement.setString(1, status);
                    updateStatement.setString(2, patientName);
                    int rowsUpdated = updateStatement.executeUpdate();
                    System.out.println(rowsUpdated + " row(s) updated");
                }
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the HTML page after updating the database
        response.sendRedirect(request.getContextPath() + "/admin-blood-request.jsp");
    }
}