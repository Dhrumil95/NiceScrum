﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace NiceScrum
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Register";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connectioninfo;
            SqlConnection db;

            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();


            string sql = String.Format(@"select max(userid) from users ");
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = db;
            cmd.CommandText = sql;
            object result = new object();
            result = cmd.ExecuteScalar();
            string maxVal = Convert.ToString(result);
            int currnum = Convert.ToInt32(maxVal) + 1;
            String Name = TextBox1.Text;
            String UserName = TextBox2.Text;
            String Password = TextBox3.Text;

            string sql2 = String.Format(@"insert into users values({0},'{1}','{2}','{3}','{4}') ",currnum, UserName, Name, Password, "reg");
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = db;
            cmd2.CommandText = sql2;
            object result2 = new object();
            result2 = cmd2.ExecuteNonQuery();

            db.Close();



            Response.Redirect("index.aspx");



        }
    }
}