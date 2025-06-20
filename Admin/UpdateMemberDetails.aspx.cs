using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class UpdateMemberDetails : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridView();               
            }
        }

        private void BindGridView()
        {
            cmd = new SqlCommand("sp_GetMemberAllRecord", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            GridView1.DataSource = dbcon.LoadData(cmd);
            GridView1.DataBind();       
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SearchMember();
            }
        }
        protected void SearchMember()
        {
            cmd = new SqlCommand("sp_GetMemberByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
            dbcon.OpenCon();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtFullName.Text = dr.GetValue(0).ToString();
                    txtDOB.Text = dr.GetValue(1).ToString();
                    txtContactNo.Text = dr.GetValue(2).ToString();
                    txtEmail.Text = dr.GetValue(3).ToString();
                    ddlState.SelectedValue = dr.GetValue(4).ToString();
                    txtCiy.Text = dr.GetValue(5).ToString();
                    txtPIN.Text = dr.GetValue(6).ToString();
                    txtAddress.Text = dr.GetValue(7).ToString();
                }
            }
            else
            {
                Response.Write("<script> alert('Record Not Found');</script>");
            }
            dbcon.CloseCon();
        }


        protected void btnActive_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMember("Active");
            }
            else
            {
                Response.Write("<script> alert('Validation Error Try Again');</script>");
            }
        }

        private void UpdateMember(string status)
        {
            if (CheeckMember())
            {
                cmd = new SqlCommand("sp_UpdateMemberStatus", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@qrType", status);
                dbcon.OpenCon();
                if (cmd.ExecuteNonQuery()>0)
                {
                    Response.Write("<script> alert('Member Status Updated');</script>");
                }
                else
                {
                    Response.Write("<script> alert('Member Status Not Updated');</script>");
                }
                dbcon.CloseCon();
            }
            else
            {
                Response.Write("<script> alert('Record Not Found');</script>");                
            }
            BindGridView();
        }

        private bool CheeckMember()
        {
            dbcon.OpenCon();
            cmd = new SqlCommand("sp_GetMemberByID", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", txtMemberID.Text.Trim());
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dbcon.CloseCon();
            
            if (dt.Rows.Count >= 1)
                return true;
            else
                return false;
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMember("Pending");
            }
            else
            {
                Response.Write("<script> alert('Validation Error Try Again');</script>");
            }
        }

        protected void btnDeactive_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                UpdateMember("Deactive");
            }
            else
            {
                Response.Write("<script> alert('Validation Error Try Again');</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {         
            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);

            TextBox updatetxtName=(TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditName");
            TextBox updatetxtDOB = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditDOB");
            TextBox updatetxtContact = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditContact");
            TextBox updatetxtEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
            DropDownList updateddlState= (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlEditState");
            TextBox updatetxtCity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditCity");
            TextBox updatetxtPIN = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditPIN");
            TextBox updatetxtAddress = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");

            cmd = new SqlCommand("sp_UpdateMemberRecord", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@full_name",updatetxtName.Text);
            cmd.Parameters.AddWithValue("@dob",updatetxtDOB.Text);
            cmd.Parameters.AddWithValue("@contact_no",updatetxtContact.Text);
            cmd.Parameters.AddWithValue("@email",updatetxtEmail.Text);
            cmd.Parameters.AddWithValue("@state",updateddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city",updatetxtCity.Text);
            cmd.Parameters.AddWithValue("@pincode",updatetxtPIN.Text);
            cmd.Parameters.AddWithValue("@full_address",updatetxtAddress.Text);
            cmd.Parameters.AddWithValue("@member_id",ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.CloseCon();
            GridView1.EditIndex = -1;
            BindGridView();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label mid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblDisplayID");
            int ID = Convert.ToInt32(mid.Text);

            cmd = new SqlCommand("sp_DeleteMember", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();

            cmd.Parameters.AddWithValue("@member_id", ID);
            dbcon.OpenCon();
            cmd.ExecuteNonQuery();
            dbcon.CloseCon();
            BindGridView();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType==DataControlRowType.DataRow && GridView1.EditIndex==e.Row.RowIndex)
            {
                DropDownList ddlEditState_value = (DropDownList)e.Row.FindControl("ddlEditState");
                Label lblState = (Label)e.Row.FindControl("lblEditState");
                ddlEditState_value.SelectedValue = lblState.Text; 
            }           
        }
    }
}