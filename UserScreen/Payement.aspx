<%@ Page Title="FinePaymentDetails" Language="C#" MasterPageFile="~/UserScreen/User.Master" AutoEventWireup="true" CodeBehind="Payement.aspx.cs" Inherits="LibraryManagementSystem.UserScreen.Payement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <br />
                <h2>Fine Payment Details</h2>
                <hr />

                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>
