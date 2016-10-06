using System;
using System.Data;
using System.Data.SqlClient;

namespace NiceScrum.Models
{
    public partial class myWork : System.Web.UI.Page
    {
        String selectedProject = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Submit";
            Button2.Text = "Change To 'In Progress'";
            Button3.Text = "Change To 'Complete'";
            Button4.Text = "Change To 'TODO'";
            Button5.Text = "Create Project";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Add("project", selectedProject);
            Response.Redirect("pDetails.aspx");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedProject = ListBox1.SelectedItem.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
                String Task = ListBox2.SelectedItem.Text.ToString();

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {

                    String sql = String.Format("UPDATE tasks SET Status = 'In Progress' WHERE CONVERT(VARCHAR, task) = '{0}' and CONVERT(VARCHAR, AssignedTo) = '{1}'  and CONVERT(VARCHAR, Status) = 'TODO'  ", Task, Session["name"].ToString());
                    using (SqlCommand cmd = new SqlCommand(sql))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

            GridView1.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();

            Response.Redirect("myWork.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // In Progress - > Completed

            String Task = ListBox3.SelectedItem.Text.ToString();

            string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            using (SqlConnection con = new SqlConnection(constr))
            {

                String sql = String.Format("UPDATE tasks SET Status = 'Completed' WHERE CONVERT(VARCHAR, task) = '{0}' and CONVERT(VARCHAR, AssignedTo) = '{1}' and CONVERT(VARCHAR, Status) = 'In Progress' ", Task, Session["name"].ToString());
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();

            Response.Redirect("myWork.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String Task = ListBox4.SelectedItem.Text.ToString();

            string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            using (SqlConnection con = new SqlConnection(constr))
            {

                String sql = String.Format("UPDATE tasks SET Status = 'TODO' WHERE CONVERT(VARCHAR, task) = '{0}' and CONVERT(VARCHAR, AssignedTo) = '{1}' and CONVERT(VARCHAR, Status) = 'Completed' ", Task, Session["name"].ToString());
                using (SqlCommand cmd = new SqlCommand(sql))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            GridView1.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();

            Response.Redirect("myWork.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                int ProjectID = Convert.ToInt32(TextBox1.Text);
                String ProjectName = TextBox2.Text.Replace("'", "''");

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                    String sql = String.Format("INSERT INTO projects values({0}, '{1}', '{2}')", ProjectID, ProjectName, Session["name"].ToString());
                    
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
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", "Project Added!"));

            }
            catch (Exception ex)
            {
                TextBox1.Text = TextBox2.Text = "";
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));
            }

            GridView1.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();

            Response.Redirect("myWork.aspx");
        }
    }
}