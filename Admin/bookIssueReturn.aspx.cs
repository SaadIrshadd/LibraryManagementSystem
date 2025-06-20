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
    public partial class bookIssueReturn : System.Web.UI.Page
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
            cmd = new SqlCommand("sp_getIssueBook", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            GridView1.DataSource = dbcon.LoadData(cmd);
            GridView1.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                GetMemberName();
                GetBookName();
            }
            else
            {
                Response.Write("<script>alert('Validation Error please enter MemberID or BookID.');</script>");
            }
        }
        protected void btnIssue_Click(object sender, EventArgs e)
        {
            if (IsBookExist() && IsMemberExist())
            {
                if (IsIssueEntryExist())
                {
                    Response.Write("<script>alert('This Member already has this book.');</script>");
                }
                else
                {
                    DateTime issueDate = Convert.ToDateTime(txtIssueDate.Text);
                    DateTime dueDate = Convert.ToDateTime(txtDueDate.Text);
                    DateTime today = DateTime.Now.Date;

                    if (issueDate< today)
                    {
                        Response.Write("<script>alert('Issue date cannot be in the past.');</script>");
                    }
                    else if (dueDate <= issueDate)
                    {
                        Response.Write("<script>alert('Due date must be after the issue date.');</script>");
                    }
                    else
                    {
                        issueBook();
                        BindGridView();
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong MemberID or BookID.');</script>");
            }
        }
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            if (IsBookExist() && IsMemberExist())
            {
                if (IsIssueEntryExist())
                {

                    if (CheckFine())
                    {
                        ReturnBook();
                        BindGridView();
                    }
                    else
                    {
                        Response.Redirect("BookFine.aspx?bid=" + txtBookID.Text + "&mid=" + txtMemberID.Text + "&day=" + Session["day"].ToString());
                    }
                }
                else
                {
                    Response.Write("<script>alert('This entry does not exist.');</script>");
                    BindGridView();
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong MemberID or BookID.');</script>");
            }
        }

        private void GetMemberName()
        {
            cmd = new SqlCommand("select full_name from member_master_tbl where member_id=@member_id", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                txtMemberName.Text = dt.Rows[0]["full_name"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Wrong Member Id. Try Again.');</script>");
            }
        }
        private void GetBookName()
        {
            cmd = new SqlCommand("select book_name from book_master_tbl where book_id=@book_id", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                txtBookName.Text = dt.Rows[0]["book_name"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Wrong Book Id. Try Again.');</script>");
            }
        }

        private bool IsBookExist()
        {
            cmd = new SqlCommand("sp_ChechkBookStock", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool IsMemberExist()
        {
            cmd = new SqlCommand("select full_name from member_master_tbl where member_id=@member_id", dbcon.GetCon());
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool IsIssueEntryExist()
        {
            cmd = new SqlCommand("sp_checkIssue", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void issueBook()
        {
            cmd = new SqlCommand("sp_BookIssue", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_name", txtMemberName.Text.Trim());
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text.Trim());
            cmd.Parameters.AddWithValue("@issue_date", txtIssueDate.Text.Trim());
            cmd.Parameters.AddWithValue("@due_date", txtDueDate.Text.Trim());
            if (dbcon.InsertUpdatedata(cmd))
            {
                updateBookStock();
            }
            else
            {
                Response.Write("<script>alert('Book not Issued.');</script>");
                //ClearControl();
            }
        }

        private void updateBookStock()
        {
            cmd = new SqlCommand("sp_UpdateBookStock", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            if (dbcon.InsertUpdatedata(cmd))
            {
                Response.Write("<script>alert('Book Issued Succesfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Book not Issued.');</script>");
            }
        }

        private void ReturnBook()
        {
            cmd = new SqlCommand("sp_returnBook_UpdateStock", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            if (dbcon.InsertUpdatedata(cmd))
            {
                Response.Write("<script>alert('Book Returned Succesfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Book not Returned.');</script>");
                //ClearControl();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Now;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private bool CheckFine()
        {
            int days;
            cmd = new SqlCommand("sp_GetNumOfdays", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            DataTable dt = dbcon.LoadData(cmd);
            if (dt.Rows.Count >= 1)
            {
                days = Convert.ToInt32(dt.Rows[0]["number_of_day"].ToString());
                Session["day"] = days;
                if (days <= 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}