<%@ Page Title="BookFine" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="BookFine.aspx.cs" Inherits="LibraryManagementSystem.Admin.BookFine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        .container-fluid {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0 15px;
            max-width: 1200px;
        }

        .row {
            margin-bottom: 20px;
        }

        .border {
            border: 1px solid #dee2e6;
            padding: 20px;
            border-radius: 5px;
        }

        h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
        }

        .btn {
            padding: 10px;
            font-size: 14px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .icon-container {
            margin-bottom: 15px;
        }

            .icon-container i {
                font-size: 24px;
                margin-right: 10px;
            }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <!-- Fine Amount Section -->
        <div class="row border" id="A1" runat="server">
            <div class="col-12">
                <!-- Use full width for smaller screens -->
                <p>
                    Hi,
                    <asp:Label ID="lblMembername" runat="server" Text="Label"></asp:Label>
                </p>
                <p>Please Pay Fine Amount.......</p>
                <p>
                    Amount (Rs.):
                    <asp:Label ID="lblfine" runat="server" Text="Label"></asp:Label>
                </p>
                <asp:Button ID="btnNext" CssClass="btn btn-primary btn-block" runat="server" Text="Continue" OnClick="btnNext_Click" />
            </div>
        </div>

        <!-- Payment Details Section -->
        <div class="row" id="A2" runat="server" visible="false">
            <div class="col-12">
                <div class="row">
                    <!-- Billing Address -->
                    <div class="col-md-6 col-sm-12 border">
                        <h3>Billing Address</h3>
                        <label for="fname"><i class="fa fa-user"></i>Full Name</label>
                        <asp:TextBox ID="txtFullName" ReadOnly="true" runat="server" CssClass="form-control" placeholder="John M. Doe"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Please Enter Name" ForeColor="Red" ControlToValidate="txtFullName" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <label for="email"><i class="fa fa-envelope"></i>Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true" CssClass="form-control" placeholder="john@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Please Enter Email" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <label for="adr"><i class="fa fa-address-card"></i>Address</label>
                        <asp:TextBox ID="txtaddress" runat="server"  ReadOnly="true" CssClass="form-control" placeholder="542 W. 15th Street"></asp:TextBox>

                        <label for="city"><i class="fa fa-city"></i>City</label>
                        <asp:TextBox ID="txtCity" runat="server" ReadOnly="true" CssClass="form-control" placeholder="New York"></asp:TextBox>

                        <div class="row">
                            <div class="col-6">
                                <label for="state">State</label>
                                <asp:TextBox ID="txtState" runat="server" ReadOnly="true" CssClass="form-control" placeholder="NY"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <label for="zip">Zip</label>
                                <asp:TextBox ID="txtzip" runat="server" CssClass="form-control" placeholder="100001"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Details -->
                    <div class="col-md-6 col-sm-12 border">
                        <h3>Payment</h3>
                        <label>Accepted Cards</label>
                        <div class="icon-container">
                            <i class="fab fa-cc-visa" style="color: navy;"></i>
                            <i class="fab fa-cc-amex" style="color: blue;"></i>
                            <i class="fab fa-cc-mastercard" style="color: red;"></i>
                            <i class="fab fa-cc-discover" style="color: orange;"></i>
                        </div>

                        <label>Amount</label>
                        <asp:TextBox ID="txtamount" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Please Enter Amount" ForeColor="Red" ControlToValidate="txtamount" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <label>Payment Option</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                            <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                            <asp:ListItem Text="Card" Value="Card"></asp:ListItem>
                        </asp:DropDownList>

                        <label>Name on Card</label>
                        <asp:TextBox ID="txtNameOnCard" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Name on Card" ForeColor="Red" ControlToValidate="txtNameOnCard" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <label>Credit Card Number</label>
                        <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" placeholder="1111-2222-3333-4444"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Card Number" ForeColor="Red" ControlToValidate="txtCardNumber" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <label>Exp Month</label>
                        <asp:TextBox ID="txtExpmonth" runat="server" CssClass="form-control" placeholder="September"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Exp Month" ForeColor="Red" ControlToValidate="txtExpmonth" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                        <div class="row">
                            <div class="col-6">
                                <label>Exp Year</label>
                                <asp:TextBox ID="txtexpyear" runat="server" CssClass="form-control" placeholder="2024"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Exp Year" ForeColor="Red" ControlToValidate="txtexpyear" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                            </div>
                            <div class="col-6">
                                <label>CVV</label>
                                <asp:TextBox ID="txtcvv" runat="server" CssClass="form-control" placeholder="356"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*CVV" ForeColor="Red" ControlToValidate="txtcvv" ValidationGroup="paymentbtn"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                    </div>
                </div>
                <label>
                    <asp:CheckBox ID="chkboxSameasAddress" runat="server" Checked="true" />
                    Shipping address same as Billing Address
                </label>
                <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Continue to Checkout" OnClick="btnsubmit_Click" ValidationGroup="paymentbtn" />
            </div>
        </div>
    </div>
</asp:Content>
