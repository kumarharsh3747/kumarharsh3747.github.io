package com.servlet.register;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/donate")
public class donateBlood extends HttpServlet{

    //create the query
    private static final String INSERT_QUERY ="INSERT INTO DONATE(name,disease,age,username,bloodgroup) VALUES(?,?,?,?,?)";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //get PrintWriter
    	PrintWriter pw = res.getWriter();
        //set Content type
        res.setContentType("text/html");
        //read the form values
        String name = req.getParameter("name");
        String disease = req.getParameter("dise");
        int age=Integer.parseInt(req.getParameter("age"));
        String username = req.getParameter("un");
        String bloodgroup = req.getParameter("bgroup");
        
   

        //load the driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //create the connection
        try(Connection con = DriverManager.getConnection("jdbc:mysql:///1page","root","root");
                PreparedStatement ps = con.prepareStatement(INSERT_QUERY);){
            //set the values
            ps.setString(1, name);
            
            ps.setString(2,disease );
            ps.setInt(3,age );
            ps.setString(4,username);
            ps.setString(5,bloodgroup);
            
            
            
            //execute the query
            int count = ps.executeUpdate();

            if(count==0) {
                pw.println("Record not stored into database");
              
            }
            else {
                pw.println("Record Stored into Database");
                RequestDispatcher rd=req.getRequestDispatcher("/donation-history.jsp");
                rd.include(req, res);
            }
        }catch(SQLException se) {
            pw.println(se.getMessage());
            se.printStackTrace();
        }catch(Exception e) {
            pw.println(e.getMessage());
            e.printStackTrace();
        }

        //close the stream
        pw.close();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(req, resp);
    }
}