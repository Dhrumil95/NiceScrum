using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            Button6.Text = "Set Meeting";
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
                String StartDate = "Not Specified";
                String EndDate = "Not Specified";

                if ( Calendar2.SelectedDate.Date != DateTime.MinValue )
                {
                    StartDate = Calendar2.SelectedDate.ToShortDateString();
                }

                if (Calendar3.SelectedDate.Date != DateTime.MinValue)
                {
                    EndDate = Calendar3.SelectedDate.ToShortDateString();
                }

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                    String sql = String.Format("INSERT INTO projects values({0}, '{1}', '{2}', '{3}', '{4}')", ProjectID, ProjectName, Session["name"].ToString(),StartDate,EndDate);

                    using (SqlCommand cmd = new SqlCommand(sql))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                List<ListItem> selected = new List<ListItem>();
                foreach (ListItem item in CheckBoxList1.Items)
                    if (item.Selected) selected.Add(item);

                //if (selected.Count == 0) return;


                // checkbox
                using (SqlConnection con = new SqlConnection(constr))
                {

                    foreach (ListItem item in selected) {

                        String sql = String.Format("INSERT INTO TeamMembers values('{0}', {1}, '{2}')",  item.Value.ToString()  , ProjectID, ProjectName);

                        using (SqlCommand cmd = new SqlCommand(sql))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }




                TextBox1.Text = TextBox2.Text = "";
                //Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", "Project Added!"));
                Session.Add("pAdded", "1");

            }
            catch (Exception ex)
            {
                TextBox1.Text = TextBox2.Text = "";
                //Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));
                Session.Add("pAdded", "0");
            }

            GridView1.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            ListBox3.DataBind();
            ListBox4.DataBind();

            Response.Redirect("myWork.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            try
            {
                List<ListItem> selected = new List<ListItem>();
                foreach (ListItem item in CheckBoxList2.Items)
                    if (item.Selected) selected.Add(item);

                //if (selected.Count == 0) return;

                String Agenda = TextBox3.Text;
                String Time = TextBox4.Text;
                String Date = Calendar1.SelectedDate.ToShortDateString().ToString();
                String From = Session["Name"].ToString();
                String Message = String.Format(@"A meething has been scheduled by {0} on {1} at {2}. <br /> Meeting Agenda: {3}",From,Date,Time,Agenda);

                using (SqlConnection con = new SqlConnection(constr))
                {

                    foreach (ListItem item in selected)
                    {

                        String sql = String.Format("INSERT INTO mess(\"FROM\", \"TO\", \"SUBJECT\", \"MESSAGE\") values('{0}', '{1}', '{2}', '{3}')", From, item.Value.ToString(), "Meeting", Message);

                        using (SqlCommand cmd = new SqlCommand(sql))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

                TextBox3.Text = TextBox4.Text = "";

            }
            catch
            {
                TextBox3.Text = TextBox4.Text = "";
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