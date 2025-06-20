<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="LibraryManagementSystem.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="shortcut icon" href="../logoimg/library-logo.png" />

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <%-- Bootstrap CSS--%>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%--DataTable CSS--%>   
    <link href="datatable/css/dataTables.dataTables.min.css" rel="stylesheet" />

    <%-- FontAwesome CSS--%>
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    <%--JQuerry js--%>
    <script src="bootstrap/js/jquery-3.2.1.slim.min.js"></script>

    <%--Popper js--%>
    <script src="bootstrap/js/popper.min.js"></script>

    <%--Bootstrap js--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm navbar-light bg-primary">
                <a class="navbar-brand" href="default.aspx">
                    <img src="logoimg/library-logo.png" alt="logo" width="49" height="49" />Library</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="default.aspx"><b>Home</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Library Collection</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Archives</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Publication</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Gallery</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Contact</b></a>
                        </li>
                    </ul>
                </div>
                <!--NAVBAR ICON-->
                <div class="pmd-navbar-right-icon ml-auto">
                    <%--<a class="btn btn-sm btn-primary" href="#">Sign Up</a>--%>
                    <a class="btn btn-sm btn-primary" href="Login.aspx">Log In</a>
                </div>
            </nav>
            <div class="jumbotron text-center alert alert-primary" style="margin-bottom: 0">
                <h1>Library Management System</h1>
                <p>Building Community. Inspiring readers. Expanding book access!</p>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-2 border border-info">
                        
                        <hr class="d-sm-none" />
                    </div>
                    <div class="col-sm-10 border border-info">
                        <%--Code Here--%>
                        <div class="container mt-3">
                            <h2>Create New Account</h2>

                            <!--NAV TABS-->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#signup">SignUp</a>
                                </li>


                            </ul>

                            <div class="tab-content">
                                <div id="signup" class=" tab-pane fade show active">
                                    <br />
                                    <h3>SignUp</h3>
                                    <p></p>

                                    <!--DSIGN LOGIN FORM-->

                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="logoimg/signup.jpg" />
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User SignUp</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label>Member ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Password" ForeColor="Red" Display="Dynamic" ClientIDMode="Static" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <label>Full Name</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter FullName" ForeColor="Red" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
                                                                </div>

                                                            </div>
                                                            <div class="col-4">
                                                                <label>Date of Birth</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Contact No.</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtContactNo" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Email</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter Email" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Enter Valid Email Address" ForeColor="#CC00CC" ControlToValidate="txtEmail" ValidateRequestMode="Enabled" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>State</label>
                                                                <div class="form-group">
                                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server">
                                                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                        <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                                                        <asp:ListItem Text="Sindh" Value="Sindh"></asp:ListItem>
                                                                        <asp:ListItem Text="Khyber Pakhtunkhwa" Value="Khyber Pakhtunkhwa"></asp:ListItem>
                                                                        <asp:ListItem Text="Balochistan" Value="Balochistan"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>

                                                                <label>City</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtCiy" CssClass="form-control" placeholder="City" runat="server" ForeColor="Black"></asp:TextBox>
                                                                </div>

                                                                <label>Postal Code</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPIN" CssClass="form-control" placeholder="Postal Code" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <label>Full Address</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnSignUp" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="SignUp" OnClick="btnSignUp_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <a href="default.aspx"><< Back to Home Screen</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--LOGIN DSIGN END-->



                            </div>
                        </div>

                        <!--END LOGIN-->


                    </div>
                </div>
            </div>
            <br />
            <div class="jumbotron text-center alert alert-danger " style="margin-bottom: 0; border: 2px solid black">
                <p>Footer</p>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="footer-pad">
                                <h4>Payment</h4>
                                <ul class="list-unstyled">
                                    <li><a href="#"></a></li>
                                    <li><a href="#">Payement Center</a></li>
                                    <li><a href="#">News and Updates</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <h4>Website</h4>
                            <ul class="list-unstyled">
                                <li><a href="#"></a></li>
                                <li><a href="#">Website</a></li>
                                <li><a href="#">Disclaimer</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <h4>Follow Us</h4>
                            <ul class="social-network social-circle">
                                <li><a href="#" title="Facebook"><i class="fa fa-facebook">Facebook</i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 fa-copyright border-dark">
                            <p class="text-center">&copy; CopyRight 2024-All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>