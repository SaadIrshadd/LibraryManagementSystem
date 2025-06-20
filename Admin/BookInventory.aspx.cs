using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem.Admin
{
    public partial class BookInventory : System.Web.UI.Page
    {
        DBConnect dbcon = new DBConnect();
        SqlCommand cmd;
        static int actual_stock;
        static int current_stock;
        static int issued_book;
        static string filepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Autogenerate();
                BindAuthor_Publisher();
                BindGridView();
            }
        }    

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (CheckDuplicateBook())
            {
                Response.Write("<script>alert('Book Already Exist.Try Another ID');</script>");

            }
            else
            {
                AddBook();
                BindGridView();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (CheckDuplicateBook())
            {
                UpdateBook();
                BindGridView();
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID.');</script>");
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (CheckDuplicateBook())
            {
                DeleteBook();
                BindGridView();
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID.');</script>");
            }
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            SearchBooks();
        }
        protected void btnCanel_Click(object sender, EventArgs e)
        {
            ClearControl();
            Autogenerate();
        }

        private void BindAuthor_Publisher()
        {
            cmd = new SqlCommand("sp_GetAuthor", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            ddlAuthor.DataSource = dbcon.LoadData(cmd);
            ddlAuthor.DataValueField = "author_name";
            ddlAuthor.DataBind();
            ddlAuthor.Items.Insert(0, new ListItem("--Select--"));

            cmd = new SqlCommand("sp_GetPublisher", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            ddlPublisherName.DataSource = dbcon.LoadData(cmd);
            ddlPublisherName.DataValueField = "publisher_name";
            ddlPublisherName.DataBind();
            ddlPublisherName.Items.Insert(0, new ListItem("--Select--"));
        }
        private bool CheckDuplicateBook()
        {
            cmd = new SqlCommand("sp_GetBookByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        private void AddBook()
        {
            string genre = "";
            foreach (int i in ListBoxGenre.GetSelectedIndices())
            {
                genre = genre + ListBoxGenre.Items[i] + ",";
            }
            genre = genre.Remove(genre.Length - 1);

            string FilePath = "~/BookImg/asp.jpg";
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/BookImg/" + FileName));
            FilePath = "~/BookImg/" + FileName;

            cmd = new SqlCommand("sp_Insert_Update_DeleteBookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            AddParameter();
            cmd.Parameters.AddWithValue("@StatementType", "Insert");

            cmd.Parameters.AddWithValue("@genre", genre);
            cmd.Parameters.AddWithValue("@book_img_link", FilePath);


            if (dbcon.InsertUpdatedata(cmd))
            {

                Response.Write("<script>alert('Book Added Succesfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not Inserted.');</script>");
            }
            ClearControl();
            Autogenerate();

        }
        private void UpdateBook()
        {
            int A_stock = Convert.ToInt32(txtActualStock.Text.Trim());
            int C_stock = Convert.ToInt32(txtCurrentStock.Text.Trim());
            if (actual_stock==A_stock)
            {

            }
            else
            {
                if (A_stock < actual_stock)
                {
                    Response.Write("<script>alert('Actual Stock Value cannot be less then issued book.');</script>");
                    return;
                }
                else
                {
                    current_stock = actual_stock - issued_book;
                    txtCurrentStock.Text = C_stock + "";
                }
            }
            

            string genre = "";
            foreach (int i in ListBoxGenre.GetSelectedIndices())
            {
                genre = genre + ListBoxGenre.Items[i] + ",";
            }
            genre = genre.Remove(genre.Length - 1);

            string F_Path = "~/BookImg/asp.jpg";
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            if (FileName == "" || FileName == null)
            {
                F_Path=filepath;
            }
            else
            {
                FileUpload1.SaveAs(Server.MapPath("~/BookImg/" + FileName));
                F_Path = "~/BookImg/" + FileName;
            }


            cmd = new SqlCommand("sp_Insert_Update_DeleteBookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
           
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Update");
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text);
            cmd.Parameters.AddWithValue("@author_name", ddlAuthor.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text);
            cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@edititon", txtEdition.Text);
            cmd.Parameters.AddWithValue("@book_cost", txtbookCost.Text);
            cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text);
            cmd.Parameters.AddWithValue("@book_description", txtBookDesc.Text);
            cmd.Parameters.AddWithValue("@genre", genre);
            cmd.Parameters.AddWithValue("@actual_stock", A_stock.ToString());
            cmd.Parameters.AddWithValue("@current_stock", C_stock.ToString());
            cmd.Parameters.AddWithValue("@book_img_link", F_Path);

            if (dbcon.InsertUpdatedata(cmd))
            {
                Response.Write("<script>alert('Book Updated Succesfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not Inserted.');</script>");
                ClearControl();
            }
            ClearControl();
            Autogenerate();
        }
        private void DeleteBook()
        {
            cmd = new SqlCommand("sp_Insert_Update_DeleteBookInventory", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@StatementType", "Delete");
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text.Trim());

            if (dbcon.InsertUpdatedata(cmd))
            {
                Response.Write("<script>alert('Book Deleted Succesfully.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Record Not Deleted.');</script>");
                ClearControl();
            }
            ClearControl();
            Autogenerate();
        }
        private void Autogenerate()
        {
            try
            {
                int r;
                SqlCommand cmd = new SqlCommand("select max(book_id)as ID from book_master_tbl;", dbcon.GetCon());
                dbcon.OpenCon();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string d = dr[0].ToString();
                    if (d == "")
                    {
                        txtBookID.Text = "101";
                    }
                    else
                    {
                        r = Convert.ToInt32(dr[0].ToString());
                        r = r + 1;
                        txtBookID.Text = r.ToString();
                    }
                    
                }
                dbcon.CloseCon();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ")</script>");
            }
        }
        private void ClearControl()
        {
            txtBookName.Text = txtActualStock.Text = txtbookCost.Text = txtBookDesc.Text = txtCurrentStock.Text = txtEdition.Text = txtIssuedBooks.Text = txtPages.Text = txtPublishDate.Text = string.Empty;
            ddlAuthor.SelectedIndex = -1;
            ddlPublisherName.SelectedIndex = -1;
            FileUpload1.PostedFile.InputStream.Dispose();
            ImgPhoto.ImageUrl = "../Images/lib1.jpg";

        }
        private void AddParameter()
        {
            cmd.Parameters.Clear();        
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            cmd.Parameters.AddWithValue("@book_name", txtBookName.Text);
            cmd.Parameters.AddWithValue("@author_name", ddlAuthor.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publisher_name", ddlPublisherName.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@publish_date", txtPublishDate.Text);
            cmd.Parameters.AddWithValue("@language", ddlLanguage.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@edititon", txtEdition.Text);
            cmd.Parameters.AddWithValue("@book_cost", txtbookCost.Text);
            cmd.Parameters.AddWithValue("@no_of_pages", txtPages.Text);
            cmd.Parameters.AddWithValue("@book_description", txtBookDesc.Text);
            cmd.Parameters.AddWithValue("@actual_stock", txtActualStock.Text);
            cmd.Parameters.AddWithValue("@current_stock", txtActualStock.Text);
            
        }
        private void SearchBooks()
        {
            cmd = new SqlCommand("sp_GetBookByID", dbcon.GetCon());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@book_id", txtBookID.Text);
            DataTable dt2 = new DataTable();
            dt2 = dbcon.LoadData(cmd);
            if (dt2.Rows.Count >= 1)
            {
                txtBookName.Text = dt2.Rows[0]["book_name"].ToString();
                txtPublishDate.Text = dt2.Rows[0]["publisher_name"].ToString();
                txtEdition.Text = dt2.Rows[0]["edition"].ToString();
                txtbookCost.Text = dt2.Rows[0]["book_cost"].ToString().Trim();
                txtPages.Text = dt2.Rows[0]["no_of_pages"].ToString().Trim();
                txtActualStock.Text = dt2.Rows[0]["actual_stock"].ToString().Trim();
                txtCurrentStock.Text = dt2.Rows[0]["current_stock"].ToString().Trim();
                txtBookDesc.Text = dt2.Rows[0]["book_description"].ToString();

                txtIssuedBooks.Text = "" + (Convert.ToInt32(dt2.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt2.Rows[0]["current_stock"].ToString()));

                ddlLanguage.SelectedValue = dt2.Rows[0]["language"].ToString().Trim();
                ddlPublisherName.SelectedValue = dt2.Rows[0]["publisher_name"].ToString().Trim();
                ddlAuthor.SelectedValue = dt2.Rows[0]["author_name"].ToString().Trim();

                ListBoxGenre.ClearSelection();
                string[] genre = dt2.Rows[0]["genre"].ToString().Trim().Split(',');
                for(int i = 0; i < genre.Length; i++)
                {
                    for(int j = 0; j < ListBoxGenre.Items.Count; j++)
                    {
                        if (ListBoxGenre.Items[j].ToString() == genre[i])
                        {
                            ListBoxGenre.Items[j].Selected = true;
                        }
                    }
                }

                actual_stock = Convert.ToInt32(dt2.Rows[0]["actual_stock"].ToString().Trim());
                current_stock = Convert.ToInt32(dt2.Rows[0]["current_stock"].ToString().Trim());
                issued_book = actual_stock - current_stock;
                filepath = dt2.Rows[0]["book_img_link"].ToString();

                if (filepath != "" || filepath != null)
                {
                    ImgPhoto.ImageUrl = filepath;
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Book ID.');</script>");
                ClearControl();
                Autogenerate();
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