<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("request");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "1page";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!doctype html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- icons -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
    integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    
    <!-- logo  -->
    <link rel="icon" href="../logo.png" type="image/icon type">



  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">


  <title>Blood Requests Details</title>

<link rel="stylesheet" href="admin-blood-request.css">

</head>

<body>

<form action="request1" method="post">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
    crossorigin="anonymous"></script>


  <header>


    <a href="http:index.html" class="logo"> <i class="fas fa-heartbeat"
        style='font-size:23px;color:white'></i>
      <b style="font-size: 23px">&nbsp;Blood Bank Management</b></a>

    <nav>

      <!-- <ul class="nav__links" style="margin-top: 14px">
        <li><a href="http://localhost/BBMS/index.html"><i class="fas fa-home"></i>&nbsp;Home</i></a></li>



        <li><a href="#"><i class="fas fa-procedures"></i>&nbsp; Patient</i></a>
        </li>
        <li><a href="../donor/donor-login.html"><i class="fas fa-user"></i>&nbsp; Donor</i></a>
        </li>
        <li><a href="admin-login.html"><i class="fas fa-user-shield"></i>&nbsp; Admin</i></a>
        </li>
      </ul> -->
      </div>
    </nav>

  </header>
  <!-- side bar -->
  <div class="side-bar">

    <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark bar" style="position: fixed; margin-top: 50px;">
      <a href="admin-home.jsp"
        class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">

        <h3 style="margin-left: 16px;
        margin-bottom: auto;">Dashboard</h3>
      </a>
      <hr>
      <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
          <a href="admin-home.jsp" class="nav-link text-white" aria-current="page">
            <i class="fas fa-home">
              <use xlink:href="#home"></use>
            </i>
            &nbsp;Home
          </a>
        </li>
        <li>
          <a href="donor-list.jsp" class="nav-link  text-white">
            <i class="fas fa-user">
              <use xlink:href="#speedometer2"></use>
            </i>
            &nbsp;Donor


          </a>
        </li>
        <li>
          <a href="patient-list.jsp" class="nav-link text-white">
            <i class="fas fa-user-injured">
              <use xlink:href="#table"></use>
            </i>
            &nbsp; Patient
          </a>
        </li>
        <li>
          <a href="admin-donation.jsp" class="nav-link text-white">
            <i class="far fa-heart">
              <use xlink:href="#grid"></use>
            </i>
            &nbsp; Donations
          </a>
        </li>
        <li>
          <a href="admin-blood-request.jsp" class="nav-link active">
            <i class="fas fa-sync-alt">
              <use xlink:href="#people-circle"></use>
            </i>
            &nbsp;Blood Requests
          </a>
        </li>
        <!-- <li>
                <a href="#" class="nav-link text-white">
                  <i class="fas fa-history">
                    <use xlink:href="#people-circle"></use>
                  </i>
                  &nbsp;Request History
                </a>
              </li> -->
        <li>
          <a href="admin-blood-stock.jsp" class="nav-link text-white">
            <i class="fas fa-ambulance">
              <use xlink:href="#people-circle"></use>
            </i>
            &nbsp;Blood Stock
          </a>
        </li>
      </ul>
      <hr>
      <div class="dropdown">
        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser2"
          data-bs-toggle="dropdown" aria-expanded="false">
          <i class="fas fa-user" width="32" height="32" class="rounded-circle me-2"></i>
          <strong>&nbsp;&nbsp;&nbsp;Admin&nbsp;</strong>
        </a>
        <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser2">
          <!-- <li><a class="dropdown-item" href="#">New project...</a></li>
                <li><a class="dropdown-item" href="#">Settings</a></li> -->
          <!-- <li><a class="dropdown-item" href="#">Profile</a></li>
          <li>
            <hr class="dropdown-divider">
          </li> -->
          <li><a class="dropdown-item" href="admin-login.html">Sign out</a></li>
        </ul>
      </div>
    </div>





    <!-- main content -->

    <div class="main">
      <div class="cont-card">
        <h2 style="text-align: center; margin-top: 36px;">BLOOD REQUEST DETAILS</h2>
        <br>
        
        <table class="table table-bordered"
          style="text-align: center;  vertical-align: middle; background-color: #F3F5F9;">
          <thead class="table-dark">
            <tr>
              <th scope="col">Patient Name</th>
              <th scope="col">Age</th>
              <th scope="col">Reason</th>
              <th scope="col">Blood Group</th>
              <th scope="col">Unit</th>
            
              <th scope="col">Action</th>
            </tr>
          </thead>
          

         
<% 
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from request";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("reason") %></td>
<td><%=resultSet.getString("bgroup") %></td>
<td><%=resultSet.getString("unit") %><!-- </td><td>
					
					 <input type="text" name=usname>
                    
</td><td>			
<input type="text" name=name1>
                    --> 
</td><td>
                    <input type="text" name=approve>
                    <input type="submit" class="btn btn--radius-2 btn-primary" style="margin: 6px; width:112px;" value="APPROVE" name="submit">
                   
              
              </td>
            </tr>

                
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
 


          </tbody>
         

        </table>

      </div>

    </div>
  </div>
  
  </form>
</body>
</html>