<%-- 
    Document   : profile
    Created on : Feb 16, 2023, 7:36:11 PM
    Author     : smanjuna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="blog.entities.User"%>
<%@page import="blog.entities.Message"%>

<% 

User user=(User)session.getAttribute("currentUser");

if(user==null){
     response.sendRedirect("login_page.jsp");
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fas fa-angle-double-downt"></span>My Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Programming</a></li>
                                <li><a class="dropdown-item" href="#">Projects</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">DSA</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logoutServlet">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profileModal"><%= user.getName()%></a>
                        </li>

                    </ul>

                </div>
            </div>
        </nav>
        <br>
        <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                %>
                <div class="alert <%= m.getCssClass() %>" role="alert">
                    <%= m.getContent() %>
                </div> 


                <%        
                        session.removeAttribute("msg");
                    }
                %>


        <!--        profile modal-->
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Your Profile</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="editServlet" method="post">
                            
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Name:</th>
                                        <td><input type="text" name="profile_name" value="<%= user.getName()%>"></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><input type="email" name="profile_email" value="<%= user.getEmail()%>"></td>

                                    </tr>

                                    <tr>
                                        <th scope="row">Registered On:</th>
                                        <td><input type="text" name="profile_date" value="<%= user.getDateTime().toString()%>"></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><textarea class="form-control" id="textbox" name="profile_textbox" value="<%= user.getAbout()%>" rows="5"></textarea></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="password" name="profile_password" value="<%= user.getPassword()%>"></td>

                                    </tr>
                                </tbody>
                            </table>
                            <button type="submit" class="btn btn-success">
                                <i class="fas fa-save"></i> Save
                            </button>

                        </form>            

                        </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                       
                    </div>
                </div>
            </div>
        </div>

        <!--        profile modal end-->

        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>    </body>
</body>
</html>
