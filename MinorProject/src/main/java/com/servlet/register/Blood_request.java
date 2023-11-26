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

@WebServlet("/request")
public class Blood_request extends HttpServlet{

    //create the query
    private static final String INSERT_QUERY ="INSERT INTO REQUEST(name,age,reason,bgroup,unit) VALUES(?,?,?,?,?)";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        //get PrintWriter
    	PrintWriter pw = res.getWriter();
        //set Content type
        res.setContentType("text/html");
        //read the form values
        String name = req.getParameter("p_name");
        int age=Integer.parseInt(req.getParameter("p_age"));
        String reason = req.getParameter("reason");
        
        
        String bloodgroup = req.getParameter("p_bgroup");
        int unit=Integer.parseInt(req.getParameter("p_unit"));

       
        
        
     


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
            ps.setInt(2,age );
            ps.setString(3,reason );
            
            ps.setString(4,bloodgroup );
            ps.setInt(5,unit);
            
            
            //execute the query
            int count = ps.executeUpdate();

            if(count==0) {
                pw.println("Record not stored into database");
              
            }
            else {
                pw.println("Record Stored into Database");
                RequestDispatcher rd=req.getRequestDispatcher("/request-history2.html");
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