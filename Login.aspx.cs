using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace LibraryManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //for memver login
            SqlCommand cmd = new SqlCommand("sp_UserLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType=System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Response.Write("<script> alert('Login Successfully');</script>");
                    Session["role"] = "user";
                    Session["fullname"] = dr.GetValue(0).ToString();
                    Session["username"] = dr.GetValue(1).ToString();
                    Session["status"] = dr.GetValue(3).ToString();
                    Session["mid"] = txtMemberID.Text.ToString();

                }
                Response.Redirect("~/UserScreen/UserHome.aspx");
            }
            else
            {                
                Response.Write("<script> alert('Invalid credentials......try again');</script>");
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            //admin login button
            SqlCommand cmd = new SqlCommand("sp_AdminLogin", dbcon.GetCon());
            dbcon.OpenCon();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtAdminID.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtAdminPass.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    Response.Write("<script> alert('Login Successfully');</script>");
                    Session["Adminrole"] = "Admin";
                    Session["Adminusername"] = dr.GetValue(0).ToString();
                    Session["Adminfullname"] = dr.GetValue(2).ToString();
                    
                }
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else
            {
                Response.Write("<script> alert('Invalid credentials......try again');</script>");
            }
        }

    }
}