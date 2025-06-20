using LibraryManagementSystem.Admin;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.UserScreen
{
    public partial class UserProfile : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again.');</script>");
                Response.Redirect("~/SignOut.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    SearchMember();
                }
            }

        }
        private void SearchMember()
        {
            cmd = new SqlCommand("sp_getMemberProfileByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", Session["mid"].ToString());
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                txtFullname.Text = dt2.Rows[0]["full_name"].ToString();
                txtDob.Text = dt2.Rows[0]["dob"].ToString();
                txtContact.Text = dt2.Rows[0]["contact_no"].ToString();
                txtEmail.Text = dt2.Rows[0]["email"].ToString().Trim();
                ddlState.SelectedValue = dt2.Rows[0]["state"].ToString().Trim();
                txtCity.Text = dt2.Rows[0]["city"].ToString().Trim();
                txtPin.Text = dt2.Rows[0]["pincode"].ToString().Trim();
                txtFullAddress.Text = dt2.Rows[0]["full_address"].ToString();
                txtUserID.Text = Session["mid"].ToString();
                txtoldpassword.Text = dt2.Rows[0]["password"].ToString().Trim();
                lblstatus.Text = dt2.Rows[0]["account_status"].ToString().Trim();

                if (dt2.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt2.Rows[0]["account_status"].ToString().Trim() == "pending")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt2.Rows[0]["account_status"].ToString().Trim() == "deactive")
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    lblstatus.Attributes.Add("class", "badge badge-pill badge-info");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID.');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again.');</script>");
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                if (CheckValidation())
                {
                    UpdateUserProfile();
                }
                else
                {
                    Response.Write("<script>alert('Validation error Try again.');</script>");
                }
            }
        }

        private void UpdateUserProfile()
        {
            SqlCommand cmd = new SqlCommand("sp_UpdateMemberProfile", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@full_name", txtFullname.Text);
            cmd.Parameters.AddWithValue("@dob", txtDob.Text);
            cmd.Parameters.AddWithValue("@contact_no", txtContact.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@state", ddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@pincode", txtPin.Text);
            cmd.Parameters.AddWithValue("@full_address", txtFullAddress.Text);
            cmd.Parameters.AddWithValue("@member_id", Session["mid"].ToString());
            if (txtnewpassword.Text != string.Empty)
            {
                cmd.Parameters.AddWithValue("@password", txtnewpassword.Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@password", txtoldpassword.Text);
            }

          //  cmd.Parameters.AddWithValue("@account_status", lblstatus.Text);
            
           
            if (dbcon.InsertUpdatedata(cmd))
            {
                Response.Write("<script>alert('Profile Updated Succesfully.');</script>");
                Response.Redirect("UserHome.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error Try Again.');</script>");
            }
        }

        private bool CheckValidation()
        {
            if (txtFullname.Text != string.Empty && txtEmail.Text != string.Empty)
            {
                return true;
            }
            else
            {
                return false;
            }
        }        
    }
}