<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="LibraryManagementSystem.Admin.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <center>
       <br />
    <h3>Welcome to Admin Dashboard</h3>
       <br />
   </center>
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card h-100 border-start-lg border-start-primary">
                    <div class="card-body">
                        <div class="small text-muted">Book Issued</div>
                        <div class="h3">
                            <asp:Label ID="lblIssueBook" runat="server" Text="Label1"></asp:Label>
                        </div>
                        <a class="text-arrow-icon small" href="bookIssueReturn.aspx">View All
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100 border-start-lg border-start-secondary">
                    <div class="card-body">
                        <div class="small text-muted">Total Books</div>
                        <div class="h3">
                            <asp:Label ID="lblTotalBooks" runat="server" Text="Label"></asp:Label>
                        </div>
                        <a class="text-arrow-icon small text-secondary" href="ViewBooks.aspx">View All Books
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100 border-start-lg border-start-secondary">
                    <div class="card-body">
                        <div class="small text-muted">Total Members</div>
                        <div class="h3 d-flex align-items-center">
                            
                    <asp:Label ID="lblamount" runat="server" Text="Label"></asp:Label>
                        </div>
                        <a class="text-arrow-icon small text-success" href="UpdateMemberDetails.aspx">View All
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
