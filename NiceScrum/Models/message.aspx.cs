using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace NiceScrum
{
    public partial class message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Send";

            if (!this.IsPostBack)
            {
                string constr =  String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT name FROM users"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        DropDownList1.DataSource = cmd.ExecuteReader();
                        DropDownList1.DataTextField = "name";
                        DropDownList1.DataValueField = "name";
                        DropDownList1.DataBind();
                        con.Close();
                    }
                }
                DropDownList1.Items.Insert(0, new ListItem("--Select Member--", "0"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
         

            if (Convert.ToBoolean(DropDownList1.SelectedIndex != 0))
            {
                String From = Session["Name"].ToString();
                String To = DropDownList1.SelectedItem.Text;
                String Subject = TextBox1.Text.Replace("'", "''");
                String Message = TextBox2.Text.Replace("'", "''");

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                    //   INSERT INTO mess("FROM", "TO", "SUBJECT", "MESSAGE") values('HarveyB', 'Hello', 'This is a Subject', 'This is a message');
                    String sql = String.Format("INSERT INTO mess(\"FROM\", \"TO\", \"SUBJECT\", \"MESSAGE\") values('{0}', '{1}', '{2}', '{3}')", From, To, Subject, Message);
                    using (SqlCommand cmd = new SqlCommand(sql))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                TextBox1.Text = TextBox2.Text = "";
                DropDownList1.SelectedIndex = 0;
            }
        }

        

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string myString = e.Row.Cells[2].Text;

                string result = string.Empty;

                for (int i = 0; i < myString.Length; i++)
                    result += (i % 165 == 0 && i != 0) ? (myString[i].ToString() + "<br/>") : myString[i].ToString();

                e.Row.Cells[2].Text = result;
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string myString = e.Row.Cells[2].Text;

                string result = string.Empty;

                for (int i = 0; i < myString.Length; i++)
                    result += (i % 165 == 0 && i != 0) ? (myString[i].ToString() + "<br/>") : myString[i].ToString();

                e.Row.Cells[2].Text = result;
            }
        }
    }
}