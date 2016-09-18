using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NiceScrum
{
    public partial class invalidCred : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Submit";
            Button2.Text = "Register";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connectioninfo;
            SqlConnection db;
          
            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();

            string username = TextBox1.Text;
            string password = TextBox2.Text;

            Console.Write(username);
            Console.WriteLine(password);
            string sql = String.Format(@"select name, accType, userid from users where username = '{0}' and pass= '{1}' COLLATE Latin1_General_CS_AS ", username, password);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            object result = new object();
            result = cmd.ExecuteScalar();


            db.Close();
            string userName = "";
            if (result == null) Response.Redirect("invalidCred.aspx");
            else if (result == DBNull.Value)
                Response.Redirect("invalidCred.aspx");
            else
            {
                userName = Convert.ToString(result);
            }

            Session.Add("Name", userName);

            Response.Redirect("homepage.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}