using System;
using System.Data;
using System.Data.SqlClient;
using static System.Net.Mime.MediaTypeNames;

namespace LibraryManagementSystem
{
    public partial class SignUp : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Autogenerate();
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            btnSignUp.Enabled = false;
            if (checkDuplicationMemberExist())
            {
                Response.Write("<script>alert('Member already exist with this ID and email');</script>");
            }
            else
            {
                CreateAccount();
            }
            btnSignUp.Enabled = true;
        }

        private void CreateAccount()
        {
            SqlCommand cmd = new SqlCommand("sp_SignUp", dbcon.GetCon());
            cmd.Parameters.AddWithValue("@full_name", txtFullName.Text);
            cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@contact_no", txtContactNo.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@state", ddlState.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@city", txtCiy.Text);
            cmd.Parameters.AddWithValue("@pincode", txtPIN.Text);
            cmd.Parameters.AddWithValue("@full_address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@account_status","pending");

            dbcon.OpenCon();
            cmd.CommandType = CommandType.StoredProcedure;
            
            int result=cmd.ExecuteNonQuery();
            dbcon.CloseCon();
            if (result==1)
            {
                Response.Write("<script>alert('Account Created Succesfully.');</script>");
                ClearText();
                Autogenerate();
            }
            else
            {
                Response.Write("<script>alert('Error Try Again.');</script>");
            }

        }
        private void Autogenerate()
        {
            try
            {
                int r;
                SqlCommand cmd = new SqlCommand("select max(member_id)as ID from member_master_tbl;", dbcon.GetCon());
                dbcon.OpenCon();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtMemberID.Text = "1001";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtMemberID.Text = r.ToString();
                    }
                    txtMemberID.ReadOnly = true;
                }
                dbcon.CloseCon();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }
        private bool checkDuplicationMemberExist()
        {
            SqlCommand cmd = new SqlCommand("sp_CheckDuplicateMember", dbcon.GetCon());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@member_id", txtMemberID.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
           
            dbcon.OpenCon();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dbcon.CloseCon();

            if (dt.Rows.Count >0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void ClearText()
        {
            txtFullName.Text = txtAddress.Text = txtCiy.Text = txtContactNo.Text = txtDOB.Text = txtEmail.Text = txtPassword.Text = txtPIN.Text = string.Empty;
            ddlState.SelectedIndex = 0;
            txtFullName.Focus();
        }
    }
}