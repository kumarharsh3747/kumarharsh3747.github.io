package com.servlet.register;


		import java.io.IOException;
		import java.io.PrintWriter;
		import java.sql.Connection;
		import java.sql.DriverManager;
		import java.sql.PreparedStatement;
		import java.sql.ResultSet;
		import java.sql.SQLException;


		import jakarta.servlet.RequestDispatcher;
		import jakarta.servlet.ServletException;
		import jakarta.servlet.annotation.WebServlet;
		import jakarta.servlet.http.HttpServlet;
		import jakarta.servlet.http.HttpServletRequest;
		import jakarta.servlet.http.HttpServletResponse;

		/**
		 * implementation class LoginServlet
		 */
		@WebServlet("/LoginServlet")
		public class Login_servlet extends HttpServlet {
			private static final long serialVersionUID = 1L;
		    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					PrintWriter out = response.getWriter();
					try{Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql:///1page","root","root");
					String n=request.getParameter("un");
					String p=request.getParameter("ps");
					PreparedStatement ps=con.prepareStatement("Select username from user where username=? and password=? ");
					ps.setString(1,n);
					ps.setString(2,p);
					ResultSet rs=ps.executeQuery();
					if(rs.next()) {
						RequestDispatcher rd=request.getRequestDispatcher("/admin-blood-stock.html");
						rd.forward(request,response);
						}
					else {
						out.println("<font color=red size=15>Login Failed!");
						out.println("<a href=login.jsp>Try Again!!</a>");
					}
					}
					catch(ClassNotFoundException e) {
						e.printStackTrace();
					}
					catch(SQLException e) {
						e.printStackTrace();
					}
					
				}

			}

			
			