using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace NiceScrum
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Submit";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            string filename, version, connectioninfo;
            SqlConnection db;

            version = "MSSQLLocalDB";
            filename = "NiceScrumDB.mdf";

            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();

            string username = TextBox1.Text;
            string password = TextBox2.Text;

            Console.Write(username);
            Console.WriteLine(password);
            string sql = String.Format(@"select name, accType, userid from users where username = '{0}' and pass= '{1}'",username,password);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            object result = new object();
            result = cmd.ExecuteScalar();
         

            db.Close();
            string userName = "";
            if (result == null) Console.Write("Item was not found"); // debug
            else if (result == DBNull.Value)
                Console.Write("Item found but value was NULL"); // debug
            else
            {
                userName = Convert.ToString(result);
            }

            Session.Add("test", userName);
            
            Response.Redirect("homepage.aspx");
        }
    }
}