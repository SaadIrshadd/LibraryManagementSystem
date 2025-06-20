using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.UserScreen
{
    public partial class UserHome : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again.');</script>");
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    GetIssueBook();
                    GetTotalBook();
                    GetTotalFine();
                }
            }

        }

        private void GetTotalFine()
        {
            cmd = new SqlCommand("select sum(fineamount)as TotalFine from BookFineRecord where member_id=@member_id", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", Session["mid"].ToString());
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                lblamount.Text =" "+ dt2.Rows[0]["TotalFine"].ToString();
            }
            else
            {
                lblamount.Text = "0";
            }
        }

        private void GetTotalBook()
        {
            cmd = new SqlCommand("select count(*)as TotalBooks from book_master_tbl", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.Clear();
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                lblTotalBooks.Text = " " + dt2.Rows[0]["TotalBooks"].ToString();
            }
            else
            {
                lblTotalBooks.Text = "0";
            }
        }

        private void GetIssueBook()
        {
            cmd = new SqlCommand("select count(*)as IssuedBook from book_issue_tbl where member_id=@member_id", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", Session["mid"].ToString());
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                lblIssueBook.Text = " " + dt2.Rows[0]["IssuedBook"].ToString();                
            }
            else
            {
                lblIssueBook.Text = "0";
            }
        }
    }
}