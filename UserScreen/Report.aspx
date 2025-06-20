<%@ Page Title="Issue/Return Book Report" Language="C#" MasterPageFile="~/UserScreen/User.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="LibraryManagementSystem.UserScreen.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <br />
                <h2>Book Issue Report</h2>
                <hr />
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
            </div>
        </div>
       
    </div>
</asp:Content>
