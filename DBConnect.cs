using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace LibraryManagementSystem
{
    public class DBConnect
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cn"].ConnectionString); 
        public SqlConnection GetCon()
        {
            return con;
        }
        public void OpenCon()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        public void CloseCon()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        public DataTable LoadData(SqlCommand cmd)
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
                return dt;
            }
            catch
            {
                throw;
            }
            finally
            {
                dt.Dispose();
                da.Dispose();
                CloseCon();
            }
        }

        public Boolean InsertUpdatedata(SqlCommand cmd)
        {
            bool recordSaved;
            OpenCon();
            try
            {
                cmd.ExecuteNonQuery();
                recordSaved = true;
            }
            catch
            {
                recordSaved = false;
            }
            finally
            {
                CloseCon();
            }
            return recordSaved;
        }
    }
}