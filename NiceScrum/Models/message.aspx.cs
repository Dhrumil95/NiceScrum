using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
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
           
        }
    }
}