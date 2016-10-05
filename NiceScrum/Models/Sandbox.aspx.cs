using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Nicescrum_homepage
{
    public partial class Sandbox : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);                                                                                    
        protected void Page_Load(object sender, EventArgs e)
        {
            //con.Open();
        }

        protected void Home_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand("insert into sandbox values ("")",con)
        }

        protected void lnkbtnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }
        protected void lnkbtnideas_Click(object sender, EventArgs e)
        {
            
        }
        protected void lnkbtnposts_Click(object sender, EventArgs e)
        {

        }

        protected void btnpost_Click(object sender, EventArgs e)
        {
            String From = Session["Name"].ToString();
            String Ideas = txtideas.Text.Replace("'","''");

            string connectioninfo;
            SqlConnection db;

            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();

            int currnum = 0;
            string sql2 = String.Format(@"select max(id) from sandbox");
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = db;
            cmd2.CommandText = sql2;
            try
            {
                object result = new object();
                result = cmd2.ExecuteScalar();
                string maxVal = Convert.ToString(result);
                currnum = Convert.ToInt32(maxVal) + 1;
            }
            catch { }

            string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            using (SqlConnection con = new SqlConnection(constr))
            {
                //   INSERT INTO mess("FROM", "TO", "SUBJECT", "MESSAGE") values('HarveyB', 'Hello', 'This is a Subject', 'This is a message');
                String sql = String.Format("INSERT INTO sandbox values('{0}','{1}','{2}')",currnum,From,Ideas);
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Visible = true;
                    Label1.Text = "Your data stored successfully!";
                }
            }
            txtideas.Text = "";
            //Response.Redirect("sandbox.aspx?Success=1");
            GridView1.DataBind();

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string myString = e.Row.Cells[1].Text;

                string result = string.Empty;

                for (int i = 0; i < myString.Length; i++)
                    result += (i % 165 == 0 && i != 0) ? (myString[i].ToString() + "<br/>") : myString[i].ToString();

                e.Row.Cells[1].Text = result;
            }
        }

            }
}