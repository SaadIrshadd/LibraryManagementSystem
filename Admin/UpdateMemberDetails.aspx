<%@ Page Title="Member Update" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="UpdateMemberDetails.aspx.cs" Inherits="LibraryManagementSystem.Admin.UpdateMemberDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 border">

                    <p>
                    </p>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="*Enter Member ID" Display="Dynamic" ControlToValidate="txtMemberID" ValidationGroup="btnSearch"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="btnSearch" />
                                <asp:Button ID="btnActive" CssClass="btn btn-success" runat="server" Text="Active" OnClick="btnActive_Click" ValidationGroup="btnSearch" />
                                <asp:Button ID="btnDeactive" CssClass="btn btn-danger" runat="server" Text="Deactive" OnClick="btnDeactive_Click" ValidationGroup="btnSearch" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtFullName" ReadOnly="true" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtDOB" ReadOnly="true" CssClass="form-control" placeholder="Date of Birth" TextMode="Date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtContactNo" ReadOnly="true" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <asp:DropDownList ReadOnly="true" ID="ddlState" CssClass="form-control" runat="server">
                                    <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                    <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                    <asp:ListItem Text="Sindh" Value="Sindh"></asp:ListItem>
                                    <asp:ListItem Text="Khyber Pakhtunkhwa" Value="Khyber Pakhtunkhwa"></asp:ListItem>
                                    <asp:ListItem Text="Balochistan" Value="Balochistan"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>



                        <div class="col-6">
                            <div class="form-group">
                                <asp:TextBox ID="txtCiy" ReadOnly="true" CssClass="form-control" placeholder="City" runat="server" ForeColor="Black"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtPIN" ReadOnly="true" CssClass="form-control" placeholder="Postal Code" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtAddress" ReadOnly="true" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                </div>

            </div>

            <div class="row">
                <div class="col-sm-12">
                    <h4>Member List</h4>
                    <div class="table table-responsive">
                        <asp:GridView ID="GridView1" CssClass="table table-sm" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" PageSize="5" Font-Size="8" OnRowDataBound="GridView1_RowDataBound">
                            <HeaderStyle BackColor="#0066FF" Font-Bold="true" ForeColor="White" />
                            <FooterStyle BackColor="#3366CC" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayID" runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayName" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditName" CssClass="" Text='<%# Eval("full_name") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DOB">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayDOB" Text='<%# Eval("dob") %>' runat="server"></asp:Label>
                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditDOB" CssClass="" TextMode="Date" Text='<%# Eval("dob") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Contact">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayContact" runat="server" Text='<%# Eval("contact_no") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditContact" CssClass="" Text='<%# Eval("contact_no") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditEmail" CssClass="" Text='<%# Eval("email") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblEditState" runat="server" Text='<%# Eval("state") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlEditState" CssClass="" runat="server">
                                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                            <asp:ListItem Text="Punjab" Value="Punjab"></asp:ListItem>
                                            <asp:ListItem Text="Sindh" Value="Sindh"></asp:ListItem>
                                            <asp:ListItem Text="Khyber Pakhtunkhwa" Value="Khyber Pakhtunkhwa"></asp:ListItem>
                                            <asp:ListItem Text="Balochistan" Value="Balochistan"></asp:ListItem>
                                        </asp:DropDownList>

                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="City">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditCity" CssClass="" Text='<%# Eval("city") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="PinCode">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayPIN" runat="server" Text='<%# Eval("pincode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPIN" CssClass="" Text='<%# Eval("pincode") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="FullAddress">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDisplayAddress" runat="server" Text='<%# Eval("full_address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditAddress" CssClass="" Text='<%# Eval("full_address") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="account_status" HeaderText="Status" ReadOnly="true" />


                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" class="table-link text-primary" runat="server" ToolTip="Edit Record" CommandName="Edit">
                                        <span class="fa-stack">
                                             <i class="fa fa-square fa-stack-2x"> </i>
                                             <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                        </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkDelete" class="table-link text-danger" runat="server" Text="Delete" ToolTip="Delete record" CommandName="Delete" OnClientClick="return confirm('Do you want to delete this row?');">
                                      <span class="fa-stack">
                                          <i class="fa fa-square fa-stack-2x"> </i>
                                          <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                                      </span>
                                        </asp:LinkButton>

                                    </ItemTemplate>

                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkUpdate" class="table-link text-success" Text="Update" CommandName="Update" runat="server" ToolTip="Update Record">
                                        <span class="fa-stack">
                                             <i class="fa fa-square fa-stack-2x"> </i>
                                             <i class="fa fa-spinner fa-stack-1x fa-inverse"></i>
                                        </span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkCancel" class="table-link text-danger" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel record">
                                      <span class="fa-stack">
                                          <i class="fa fa-square fa-stack-2x"> </i>
                                          <i class="fa fa-times-circle fa-stack-1x fa-inverse"></i>
                                      </span>
                                        </asp:LinkButton>

                                    </EditItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                            <PagerSettings Mode="NumericFirstlast" PageButtonCount="4" FirstPageText="First" LastPageText="Last"></PagerSettings>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

    </center>

</asp:Content>
