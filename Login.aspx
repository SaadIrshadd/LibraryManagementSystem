<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagementSystem.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="shortcut icon" href="../logoimg/library-logo.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- DataTable CSS -->
    <link href="datatable/css/dataTables.dataTables.min.css" rel="stylesheet" />
    <!-- FontAwesome CSS -->
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    <!-- jQuery JS -->
    <script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="bootstrap/js/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <!-- Navbar -->
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-primary">
                <a class="navbar-brand" href="default.aspx">
                    <img src="logoimg/library-logo.png" alt="logo" width="49" height="49" />Library
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="default.aspx"><b>Home</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Library Collection</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Archives</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Publication</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Gallery</b></a></li>
                        <li class="nav-item"><a class="nav-link" href="#"><b>Contact</b></a></li>
                    </ul>
                </div>
                <!-- Sign Up Button -->
                <div class="pmd-navbar-right-icon ml-auto">
                    <a class="btn btn-sm btn-primary" href="SignUp.aspx">Sign Up</a>
                </div>
            </nav>


            <!-- Jumbotron -->
            <div class="jumbotron text-center alert alert-primary mb-0">
                <h1>Library Management System</h1>
                <p>Building Community. Inspiring readers. Expanding book access!</p>
            </div>

            <!-- Login Section -->
            <div class="col-sm-10 mx-auto border border-info">
                <div class="container mt-3">
                    <h2 class="text-center">Login Panel</h2>

                    <!-- Nav Tabs -->
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">User Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu1">Admin Login</a>
                        </li>
                    </ul>

                    <div class="tab-content mt-4">
                        <!-- User Login Tab -->
                        <div id="home" class="tab-pane fade show active">
                            <h3>User Login</h3>

                            <!-- User Login Form -->
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="text-center">
                                                    <img width="150" src="logoimg/login.png" />
                                                    <h3>Member/User Login</h3>
                                                    <hr />
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtMemberID">Member ID</label>
                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtPassword">Password</label>
                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                                                </div>

                                                <div class="form-group">
                                                    <a href="SignUp.aspx">
                                                        <input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up" /></a>
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#"><< Back to Home Screen</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Admin Login Tab -->
                        <div id="menu1" class="tab-pane fade">
                            <h3>Admin Login</h3>

                            <!-- Admin Login Form -->
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 mx-auto">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="text-center">
                                                    <img width="150" src="logoimg/admin.png" />
                                                    <h3>Admin Login</h3>
                                                    <hr />
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtAdminID">Admin ID</label>
                                                    <asp:TextBox ID="txtAdminID" CssClass="form-control" placeholder="Admin ID" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <label for="txtAdminPass">Password</label>
                                                    <asp:TextBox ID="txtAdminPass" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                </div>

                                                <div class="form-group">
                                                    <asp:Button ID="btnAdminLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Admin LogIn" OnClick="btnAdminLogin_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <a href="#"><< Back to Home Screen</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer Section -->
            <div class="jumbotron text-center alert alert-danger mt-4 mb-0" style="border: 2px solid black;">
                <p>Footer</p>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <h4>Payment</h4>
                            <ul class="list-unstyled">
                                <li><a href="#">Payment Center</a></li>
                                <li><a href="#">News and Updates</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h4>Website</h4>
                            <ul class="list-unstyled">
                                <li><a href="#">Website</a></li>
                                <li><a href="#">Disclaimer</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h4>Follow Us</h4>
                            <ul class="social-network social-circle">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook"></i>Facebook</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 fa-copyright border-dark">
                            <p class="text-center">&copy; CopyRight 2024 - All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
