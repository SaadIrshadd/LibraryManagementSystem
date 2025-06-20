<%@ Page Title="UserProfile" Language="C#" MasterPageFile="~/UserScreen/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="LibraryManagementSystem.UserScreen.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../logoimg/login.png" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status -</span>
                                    <asp:Label ID="lblstatus" CssClass="badge badge-pill badge-info" runat="server" Text="Your Status"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullname" CssClass="form-control" runat="server" placeholder="Full Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="*Enter Name" ControlToValidate="txtfullname" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDob" CssClass="form-control" runat="server" placeholder="Date of Birth" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage="*Enter Date of Birth" ControlToValidate="txtDob" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtContact" CssClass="form-control" runat="server" placeholder="Contact No"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*Enter Contact No" ControlToValidate="txtContact" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="*Enter Email" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Enter Valid Email Address" ForeColor="#CC00CC" ControlToValidate="txtEmail" ValidateRequestMode="Enabled" Display="Dynamic" ValidationGroup="S1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
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
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtCity" runat="server" placeholder="City"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="*Enter City" ControlToValidate="txtCity" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>PIN</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtPin" runat="server" placeholder="PinCode" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic" ErrorMessage="*Enter Zip Code" ControlToValidate="txtPin" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtFullAddress" runat="server" placeholder="Full Address"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" ErrorMessage="*Enter Address" ControlToValidate="txtFullAddress" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-info">Login Credentials</span>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ReadOnly="true" ID="txtUserID" runat="server" placeholder="User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>Current Password</lable>
                                <div class="form-group">
                                    <asp:TextBox class="form-control"  ReadOnly="true" ID="txtoldpassword" runat="server" placeholder="Current Password"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <lable>New Password</lable>
                                <div class="form-group">
                                    <asp:TextBox class="form-control" ID="txtnewpassword" runat="server" placeholder="New Password"></asp:TextBox>
                                    
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <center>
                                    <div class="form-group">
                                        <asp:Button class="btn btn-primary btn-lg" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="S1" />
                                    </div>
                                </center>
                            </div>
                        </div>

                    </div>
                    <a href="UserHome.aspx"><< Back To Home</a>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
