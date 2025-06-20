using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminrole"] != null && Session["Adminrole"].ToString() == "Admin")
            {
                if (Session["Adminusername"].ToString() == "" || Session["Adminusername"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again.');</script>");
                    Response.Redirect("~/SignOut.aspx");
                }
                else
                {
                    if (!this.IsPostBack)
                    {
                        GetIssueBook();
                        GetTotalBook();
                        GetTotalMembers();
                    }
                }
            }
            else
            {
                Response.Redirect("~/SignOut.aspx");

            }


        }
        private void GetTotalMembers()
        {
            cmd = new SqlCommand("select count(*)as TotalMembers from member_master_tbl", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.Clear();
            
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                lblamount.Text = " " + dt2.Rows[0]["TotalMembers"].ToString();
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
            cmd = new SqlCommand("select count(*)as IssuedBook from book_issue_tbl", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Parameters.Clear();
            
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