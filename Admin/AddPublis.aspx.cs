using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class AddPublisher : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            Autogenerate();
            BindRecord();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_AddPublisher", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dbcon.OpenCon();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Saved Succesfully.');</script>");
                Cleartext();
                BindRecord();
                Autogenerate();
            }
            else
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Error Try Again.');</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_UpdatePublisher", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@id", txtpublisherID.Text);
            cmd.Parameters.AddWithValue("@name", txtpublisherName.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            dbcon.OpenCon();
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                dbcon.CloseCon();
                Response.Write("<script>alert('Updated Succesfully.');</script>");
                Cleartext();
                BindRecord();
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
            BindRecord();
            Autogenerate();
            btnAdd.Visible = true;
            btnUpdate.Visible = false;
            btnCancel.Visible = false;
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
                        txtpublisherID.Text = "501";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtpublisherID.Text = r.ToString();
                    }
                    txtpublisherID.ReadOnly = true;
                }
                dbcon.CloseCon();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }
        private void BindRecord()
        {
            SqlCommand cmd = new SqlCommand("sp_GetPublisher", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            RptPublisher.DataSource = dt;
            RptPublisher.DataBind();
        }

        private void Cleartext()
        {
            txtpublisherID.Text = txtpublisherName.Text = string.Empty;
            txtpublisherID.Focus();
        }

        private void Search(string id)
        {
            SqlCommand cmd = new SqlCommand("sp_GetPublisherByID", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@id", id);
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "dt");
            dbcon.CloseCon();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["AuthorID"] = ds.Tables[0].Rows[0]["publisher_id"].ToString();
                txtpublisherID.Text = ds.Tables[0].Rows[0]["publisher_name"].ToString();
                txtpublisherName.Text = ds.Tables[0].Rows[0][" "].ToString();
                btnAdd.Visible = false;
                btnUpdate.Visible = true;
                btnCancel.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error! No Record Found try Again.')  </script>");
            }
        }

        protected void RptPublisher_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                Search(id);
            }
            else if (e.CommandName == "delete")
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { '&' });
                string id = commandArgs[0];
                SqlCommand cmd = new SqlCommand("sp_DeletePublisher", dbcon.GetCon());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                dbcon.OpenCon();
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    dbcon.CloseCon();
                    Response.Write("<script>alert('Deleted Succesfully.');</script>");
                    Cleartext();
                    BindRecord();
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
    }
}