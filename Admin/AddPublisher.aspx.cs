using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Policy;

namespace LibraryManagementSystem.Admin
{
    public partial class AddPublisher : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Autogenerate();
                Repeater();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_AddPublisher", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@id", txtpublisherId.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dbcon.OpenCon();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Saved Succesfully.');</script>");
                Cleartext();
                Repeater();
                Autogenerate();
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Error Try Again.');</script>");
            }
        }
        private void Cleartext()
        {
            txtpublisherName.Text = txtpublisherId.Text = string.Empty;
            txtpublisherId.Focus();
        }

        private void Autogenerate()
        {
            try
            {
                int r;
                SqlCommand cmd = new SqlCommand("select max(publisher_id)as ID from publisher_master_tbl;", dbcon.GetCon());
                dbcon.OpenCon();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtpublisherId.Text = "501";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtpublisherId.Text = r.ToString();
                    }
                    txtpublisherId.ReadOnly = true;
                }
                dbcon.CloseCon();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                Search(Convert.ToInt32(id));
            }
            else if (e.CommandName == "delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SqlCommand cmd = new SqlCommand("sp_DeletePublisher", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ID", id);
                dbcon.OpenCon();
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert('Deleted Succesfully.');</script>");
                    Cleartext();
                    Repeater();
                    Autogenerate();
                    btnAdd.Visible = true;
                    btnUpdate.Visible = false;
                    btnCancel.Visible = false;
                }
                else
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert('Record Not Deleted.');</script>");
                }
            }
        }

        private void Search(int id)
        {
            SqlCommand cmd = new SqlCommand("sp_GetPublisherByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@ID", id);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            // DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["PublisherID"] = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtpublisherId.Text = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtpublisherName.Text = ds.Tables[0].Rows[0]["publisher_name"].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error! No Record Found try Again.')  </script>");
            }
        }

        private void Repeater()
        {
            SqlCommand cmd = new SqlCommand("sp_GetPublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_UpdatePublisher", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@id", txtpublisherId.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dbcon.OpenCon();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Updated Succesfully.');</script>");
                Cleartext();
                Repeater();
                Autogenerate();
                btnAdd.Visible = true;
                btnUpdate.Visible = false;
                btnCancel.Visible = false;
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Record Not Updated.');</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Cleartext();
            Repeater();
            Autogenerate();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
        }
    }
}