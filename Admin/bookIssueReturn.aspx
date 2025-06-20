<%@ Page Title="bookIssueReturn" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="bookIssueReturn.aspx.cs" Inherits="LibraryManagementSystem.Admin.bookIssueReturn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../datatable/js/dataTables.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
    });

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issue/Return</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="../logoimg/issue.jpg" />
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
                                <label>
                                    Member ID
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Member ID" ControlToValidate="txtMemberID" Display="Dynamic" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>

                                </label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" runat="server" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>
                                    Book ID
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Book ID" ControlToValidate="txtBookID" Display="Dynamic" ForeColor="Red" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                </label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" CssClass="form-control" runat="server" placeholder="Book ID"></asp:TextBox>
                                    <asp:Button ID="btnSearch" CssClass="btn btn-dark" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="S1" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemberName" ReadOnly="true" CssClass="form-control" runat="server" placeholder="Member Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookName" ReadOnly="true" CssClass="form-control" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtIssueDate" CssClass="form-control" runat="server" placeholder="Start Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Issue Date cannot be empty" ControlToValidate="txtIssueDate" Display="Dynamic" ForeColor="Red" ValidationGroup="S2"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtDueDate" CssClass="form-control" runat="server" placeholder="End Date" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Due Date cannot be empty" ControlToValidate="txtDueDate" Display="Dynamic" ForeColor="Red" ValidationGroup="S2"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnIssue" CssClass="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnIssue_Click" ValidationGroup="S2" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnReturn" CssClass="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnReturn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="AdminHome.aspx"><< Back To Home</a>
                <br />
                <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" Font-Size="Small" AutoGenerateColumns="false" EmptyDataText="No Record Found..." OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />

                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
