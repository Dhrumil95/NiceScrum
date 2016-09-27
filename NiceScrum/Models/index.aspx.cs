﻿using System;
using System.Data.SqlClient;


namespace NiceScrum
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Submit";
            Button2.Text = "Register";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connectioninfo;
            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");
            string username = TextBox1.Text.Replace("'", "''");
            string password = TextBox2.Text.Replace("'", "''");
            string userName = "", accType = "";

            using (SqlConnection conn = new SqlConnection(connectioninfo))
            {
                string sql = String.Format(@"select name, accType, userid from users where username = '{0}' and pass= '{1}' COLLATE Latin1_General_CS_AS ", username, password);
                SqlCommand oCmd = new SqlCommand(sql, conn);
                conn.Open();
                using (SqlDataReader result = oCmd.ExecuteReader())
                {

                    if (result == null) Response.Redirect("index.aspx?inval=1");
                    else if (!result.HasRows) Response.Redirect("index.aspx?inval=1");
                    else
                    {
                        while (result.Read())
                        {
                            userName = result["name"].ToString();
                            accType = result["accType"].ToString();
                            Session.Add("Name", userName);
                            Session.Add("accType", accType);
                            Response.Redirect("homepage.aspx");
                        }
                    }

                    conn.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}