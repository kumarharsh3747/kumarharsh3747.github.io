<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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


    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-home.css">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>


    <header>


        <a href="#" class="logo"> <i class="fas fa-heartbeat"
                style='font-size:23px;color:white'></i>
            <b style="font-size: 23px">&nbsp;Blood Bank Management</b></a>

        <nav>

           
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
                    <a href="admin-home.html" class="nav-link active" aria-current="page">
                        <i class="fas fa-home">

                        </i>
                        &nbsp;Home
                    </a>
                </li>
                <li>
                    <a href="donor-list.jsp" class="nav-link text-white">
                        <i class="fas fa-user">

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
                    <a href="admin-blood-request.jsp" class="nav-link text-white">
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
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                    id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
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

       <%
                            Connection connection = null;
                            Statement statement = null;
                            ResultSet resultSet = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql:///1page", "root", "root");
                                statement = connection.createStatement();

                                // Use proper SQL syntax for counting rows with a specific condition
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='A+'");
                                
                                int aPositiveCount = resultSet.next() ? resultSet.getInt(1) : 0;

                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='A-'");
                                int aNegativeCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='B+'");
                                int bPositiveCount = resultSet.next() ? resultSet.getInt(1) : 0;

                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='B-'");
                                int bNegativeCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='AB+'");
                                int abPositiveCount = resultSet.next() ? resultSet.getInt(1) : 0;

                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='AB-'");
                                int abNegativeCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='O+'");
                                int oPositiveCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock WHERE bloodgroup='O-'");
                                int oNegativeCount = resultSet.next() ? resultSet.getInt(1) : 0;

                                resultSet = statement.executeQuery("SELECT COUNT(*) FROM donuser");
                                int donCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                resultSet = statement.executeQuery("SELECT COUNT(*) FROM request");
                                int requestCount = resultSet.next() ? resultSet.getInt(1) : 0;
                                
                                resultSet = statement.executeQuery("SELECT SUM(UNIT) FROM bloodstock ");
                                int unitCount = resultSet.next() ? resultSet.getInt(1) : 0;



                                // Repeat similar queries for other blood groups

                        %>
                       <div class="main">
            <div class="cont-box">

                <!-- row-1 -->

                <div class="row">
                    <div class="col">
                        <div class="card-border">
                            <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>A+ <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                                                          <p> <%= aPositiveCount %></p> 
                            </div>
                        </div>
                    </div>
        
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>B+ <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                           <p> <%= bPositiveCount %></p> 
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>AB+ <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                           <p> <%= abPositiveCount %></p> 
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>O+ <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                            <p> <%= oPositiveCount %></p> 
                            </div>
                        </div>
                    </div>
                </div>

            <br>
            <!-- row-2 -->


            <div class="row">
                    <div class="col">
                        <div class="card-border">
                            <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>A- <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                           <p> <%= aNegativeCount %></p> 
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>B- <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                          <p> <%= bNegativeCount %></p> 
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>AB- <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                            <p> <%= abNegativeCount %></p> 
                            
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2>O- <i class="fas fa-tint" style="color: red;"></i></h2>
                                </div>
                            </div>
                            <div class="val">
                               <p> <%= oNegativeCount %></p> 
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <br>
            <hr>
            <br>
        <!-- row 3 -->
            <div class="row">
                    <div class="col">
                        <div class="card-border">
                            <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2><i class="fas fa-users" style="color: blue;"></i></h2>
                                </div>
                            </div>
                            <div class="val" style="margin-top: 0px;">
                                Total Donors
                                <br> <p> <%= donCount %></p> 
                            </div>
                        </div>
                    </div>
        
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2><i class="fas fa-spinner" style="color: blue;"></i></h2>
                                </div>
                            </div>
                            <div class="val" style="margin-top: 0px;">
                                Total Requests
                                <br> <p> <%= requestCount %></p> 
                            </div>
                        </div>
                    </div>
                   
                    <div class="col">
                        <div class="card-border">
                        <div style=" padding-right: 19px; padding-bottom: 46px;  padding-top: 13px;">
                                <div class="blood">
                                    <h2><i class="fas fa-tint" style="color: blue;"></i></h2>
                                </div>
                            </div>
                            <div class="val" style="margin-top: 0px;">
                                Total Blood Unit
                                <br> <p> <%= unitCount %></p> 
                            </div>
                        </div>
                    </div>
                </div>
            
        

        </div>
    </div>




<%
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    if (resultSet != null) resultSet.close();
                                    if (statement != null) statement.close();
                                    if (connection != null) connection.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

</form>
</body>
</html>