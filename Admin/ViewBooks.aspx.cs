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
    public partial class ViewBooks : System.Web.UI.Page
    {
        DBConnect dbcon=new DBConnect();
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {                
                BindGridView();
            }
        }
        private void BindGridView()
        {
            cmd = new SqlCommand("sp_Insert_Update_DeleteBookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Select");
            GridView1.DataSource = dbcon.LoadData(cmd);
            GridView1.DataBind();
        }
    }
}