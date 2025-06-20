<%@ Page Title="Book Inventory" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="BookInventory.aspx.cs" Inherits="LibraryManagementSystem.Admin.BookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../datatable/js/dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5 font-weight-normal">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Book Inventory</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <asp:Image ID="ImgPhoto" ImageUrl="../Images/lib1.jpg" runat="server" Height="90" Width="90" alt="" />
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                                <hr />
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Book ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnGo" runat="server" Text="GO" CssClass="form-control btn btn-primary" OnClick="btnGo_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label>Book Name</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Language</label>
                            <div class="form-group">
                                <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                                    <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                    <asp:ListItem Text="Urdu" Value="Urdu"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <label>Publisher Name</label>
                            <div class="form-group">
                                <asp:DropDownList class="form-control" ID="ddlPublisherName" runat="server">
                                    <asp:ListItem Text="Publisher 1" Value="Publisher 1"></asp:ListItem>
                                    <asp:ListItem Text="Publisher 2" Value="Publisher 2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Publisher Name" ForeColor="Red" ControlToValidate="ddlPublisherName" Display="Dynamic" SetFocusOnError="true" ValidationGroup="s1"></asp:RequiredFieldValidator>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <label>Author Name</label>
                            <div class="form-group">
                                <asp:DropDownList CssClass="form-control" ID="ddlAuthor" runat="server">
                                    <asp:ListItem Text="select" Value="select"></asp:ListItem>
                                    <asp:ListItem Text="A1" Value="a1"></asp:ListItem>
                                    <asp:ListItem Text="A2" Value="a2"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Author Name" ForeColor="Red" ControlToValidate="ddlAuthor" Display="Dynamic" SetFocusOnError="true" ValidationGroup="s1" ></asp:RequiredFieldValidator>

                            </div>
                            <label>Publish Date</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtPublishDate" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Genre</label>
                            <div class="form-group">
                                <asp:ListBox CssClass="form-group" ID="ListBoxGenre" runat="server" SelectionMode="Multiple" Rows="5">
                                    <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
                                    <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                    <asp:ListItem Text="Comic Book" Value="Comic Book"></asp:ListItem>
                                    <asp:ListItem Text="Self Help" Value="Self Help"></asp:ListItem>
                                    <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                    <asp:ListItem Text="Healthy Living" Value="Healthy Living"></asp:ListItem>
                                    <asp:ListItem Text="Wellness" Value="Wellness"></asp:ListItem>
                                    <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                                    <asp:ListItem Text="Fictional" Value="Fictional"></asp:ListItem>
                                    <asp:ListItem Text="Drama" Value="Drama"></asp:ListItem>
                                    <asp:ListItem Text="Fantasy" Value="Fantasy"></asp:ListItem>
                                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                                    <asp:ListItem Text="Poetry" Value="Poetry"></asp:ListItem>
                                    <asp:ListItem Text="Romance" Value="Romance"></asp:ListItem>
                                    <asp:ListItem Text="Suspense" Value="Suspense"></asp:ListItem>
                                    <asp:ListItem Text="Thriller" Value="Thriller"></asp:ListItem>
                                    <asp:ListItem Text="Art" Value="Art"></asp:ListItem>
                                    <asp:ListItem Text="Autobiography" Value="Autobiography"></asp:ListItem>
                                    <asp:ListItem Text="Health" Value="Encyclopedia"></asp:ListItem>
                                    <asp:ListItem Text="History" Value="History"></asp:ListItem>
                                    <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                    <asp:ListItem Text="TextBook" Value="TextBook"></asp:ListItem>
                                    <asp:ListItem Text="Science" Value="Science"></asp:ListItem>
                                    <asp:ListItem Text="Travel" Value="Travel"></asp:ListItem>
                                    <asp:ListItem Text="Programming" Value="Programming"></asp:ListItem>
                                </asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Edition</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtEdition" runat="server" placeholder="Edition"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Book Cost(per unit)</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtbookCost" runat="server" placeholder="Book Cost"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Pages</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtPages" runat="server" placeholder="Pages"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Actual Stock</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtActualStock" runat="server" placeholder="Actual Stock"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Current Stock</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtCurrentStock" ReadOnly="true" runat="server" placeholder="Current Stock"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label>Issued Books</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtIssuedBooks" ReadOnly="true" runat="server" placeholder="Issued Books"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Book Description</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtBookDesc" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-3">
                            <asp:Button ID="btnAdd" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="s1" />
                        </div>
                        <div class="col-3">
                            <asp:Button ID="btnUpdate" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                        </div>
                        <div class="col-3">
                            <asp:Button ID="btnDelete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        </div>
                        <div class="col-3">
                            <asp:Button ID="btnCanel" class="btn btn-lg btn-block btn-outline-danger" runat="server" Text="Cancel" OnClick="btnCanel_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <a href="AdminHome.aspx"><< Back to Home</a>
            <br />

        </div>

        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Book Inventory</h4>
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
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" DataKeyNames="book_id" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="true" SortExpression="book_id" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div class="container-fluid">
                                                <div class="row">
                                                    <div class="col-lg-10">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("book_name") %>' Font-Bold="true"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <span>Author - </span>
                                                                <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%#Eval("author_name") %>'></asp:Label>
                                                                &nbsp;|<span><span>&nbsp;</span>Genre - </span>
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="true" Text='<%#Eval("genre") %>'></asp:Label>
                                                                &nbsp;|
                                                                <span>Language - </span>
                                                                <asp:Label ID="Label4" runat="server" Font-Bold="true" Text='<%#Eval("language") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                Publisher -
                                                                <asp:Label ID="Label5" runat="server" Font-Bold="true" Text='<%#Eval("publisher_name") %>'></asp:Label>
                                                                &nbsp;| Publish Date -
                                                                <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%#Eval("publish_date") %>'></asp:Label>
                                                                &nbsp;| Pages -
                                                                <asp:Label ID="Label7" runat="server" Font-Bold="true" Text='<%#Eval("no_of_pages") %>'></asp:Label>
                                                                &nbsp;| Edition -
                                                                <asp:Label ID="Label8" runat="server" Font-Bold="true" Text='<%#Eval("edition") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                Cost -
                                                                <asp:Label ID="Label9" runat="server" Font-Bold="true" Text='<%#Eval("book_cost") %>'></asp:Label>
                                                                &nbsp;| Actual Stock -
                                                                <asp:Label ID="Label10" runat="server" Font-Bold="true" Text='<%#Eval("actual_stock") %>'></asp:Label>
                                                                &nbsp;| Available Stock -
                                                                <asp:Label ID="Label11" runat="server" Font-Bold="true" Text='<%#Eval("current_stock") %>'></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                Description -
                                                                <asp:Label ID="Label12" runat="server" Font-Bold="true" Font-Italic="true" Font-Size="Smaller" Text='<%#Eval("book_description") %>'></asp:Label>                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-2">
                                                        <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%#Eval("book_img_link") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
