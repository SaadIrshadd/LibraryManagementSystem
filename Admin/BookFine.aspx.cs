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
    public partial class BookFine : System.Web.UI.Page
    {
        SqlCommand cmd;
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mid"] != null && Request.QueryString["bid"] != string.Empty)
                {
                    GetMemName(Request.QueryString["mid"]);
                }
                if (Request.QueryString["day"] != null && Request.QueryString["day"] != string.Empty)
                {
                    Calculatebookfine(Request.QueryString["day"]);
                }
            }
        }
        private void GetMemName(string d)
        {
            cmd = new SqlCommand("sp_GetMemberByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", d);
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                lblMembername.Text = dt.Rows[0]["full_name"].ToString();
                txtFullName.Text = dt.Rows[0]["full_name"].ToString();
                txtEmail.Text = dt.Rows[0]["email"].ToString();
                txtaddress.Text = dt.Rows[0]["full_address"].ToString();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtState.Text = dt.Rows[0]["state"].ToString();
                txtzip.Text = dt.Rows[0]["pincode"].ToString();

            }
            else
            {
                Response.Write("<script>alert('Wrong Member ID.');</script>");
            }
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            A1.Visible = false;
            A2.Visible = true;
            btnNext.Visible = false;
        }

        private void Calculatebookfine(string d)
        {
            int days = Convert.ToInt32(d);
            double fine;
            if (days <= 0)
            {
                fine = 0.0;
            }
            else if (days >= 1 && days<=5)
            {
                fine = days * 20;
            }
            else if(days>5 && days <= 10)
            {
                fine = days * 20 +(days-5)*30;
            }
            else if(days>10&& days <= 30)
            {
                fine= days * 20+(days-10)*50;
            }
            else
            {
                fine = 5 * 20 + 25 * 1.5F + (days - 30) * 100;
            }
            lblfine.Text = "" + fine;
            txtamount.Text = fine.ToString();
        }

        protected void btnsubmit_Click(object sender,EventArgs e)
        {
            if (IsValid)
            {
                InsertBookFine();
            }
            else
            {
                Response.Write("<script>alert('Validation Issue......try again.');</script>");
            }
        }

        private void InsertBookFine()
        {
            cmd = new SqlCommand("sp_fine", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", Request.QueryString["bid"]);
            cmd.Parameters.AddWithValue("@member_id", Request.QueryString["mid"]);
            cmd.Parameters.AddWithValue("@member_fullname", lblMembername.Text.Trim());
            cmd.Parameters.AddWithValue("@FineAmount", txtamount.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@full_address", txtaddress.Text.Trim());
            cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim());
            cmd.Parameters.AddWithValue("@state", txtState.Text.Trim());
            cmd.Parameters.AddWithValue("@pincode", txtzip.Text.Trim());
            cmd.Parameters.AddWithValue("@payementoption", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@nameoncard", txtNameOnCard.Text.Trim());
            cmd.Parameters.AddWithValue("@cardnumber", txtCardNumber.Text.Trim());
            cmd.Parameters.AddWithValue("@expmonth", txtExpmonth.Text.Trim());
            cmd.Parameters.AddWithValue("@expyear", txtexpyear.Text.Trim());
            cmd.Parameters.AddWithValue("@cvv", txtcvv.Text.Trim());
            dbcon.OpenCon();
            if (cmd.ExecuteNonQuery() >= 1)
            {
                ReturnBook();
            }
            else
            {
                Response.Write("<script>alert('Fine not Paid.');</script>");                
            }
        }

        private void ReturnBook()
        {
            cmd = new SqlCommand("sp_returnBook_UpdateStock", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", Request.QueryString["bid"]);
            cmd.Parameters.AddWithValue("@member_id", Request.QueryString["mid"]);
            if (dbcon.InsertUpdatedata(cmd))
            {
                string script = "alert('Fine Paid and Book Returned Successfully.'); window.location='bookIssueReturn.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
            else
            {
                Response.Write("<script>alert('Book not Returned.');</script>");                
            }
        }

    }
}