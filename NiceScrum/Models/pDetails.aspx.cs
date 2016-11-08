using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace NiceScrum.Models
{
    public partial class pDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
       
                this.Button1.Text = "Add Task";
                this.Button2.Text = "Assign";
                this.Button3.Text = "Change to 'Available'";

                string connectioninfo;
                SqlConnection db;

                connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                db = new SqlConnection(connectioninfo);

                using (var conn = new SqlConnection(connectioninfo))
                {
                    conn.Open();
                    string sql = String.Format(@"select DISTINCT t.MemberName as name from projects P, TeamMembers t where p.id = t.ProjectID and p.projectName = '{0}' and t.ProjectName = '{0}' ", Session["project"].ToString());
                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                DropDownList1.DataSource = reader;
                                DropDownList1.DataValueField = "name";
                                DropDownList1.DataTextField = "name";
                                DropDownList1.DataBind();
                            }
                        }
                    }
                    DropDownList1.Items.Insert(0, new ListItem("None", "0"));
                    conn.Close();
                }

                DropDownList4.Items.AddRange(DropDownList1.Items.OfType<ListItem>().ToArray());
                
                db.Open();
                string sql2 = String.Format(@"select id from projects where projects.projectName = '{0}'", Session["project"].ToString());
                SqlCommand cmd2 = new SqlCommand();
                cmd2.Connection = db;
                cmd2.CommandText = sql2;
                object result2 = new object();
                result2 = cmd2.ExecuteScalar();
                string maxVal = Convert.ToString(result2);
                int currnum = Convert.ToInt32(maxVal);
                db.Close();

                Session.Add("pID", currnum);

                using (var conn = new SqlConnection(connectioninfo))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(String.Format("SELECT task FROM tasks where status = 'Available' and AssignedTo IS NULL and project = {0}",currnum), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                ListBox1.DataSource = reader;
                                ListBox1.DataValueField = "task";
                                ListBox1.DataTextField = "task";
                                ListBox1.DataBind();
                            }
                        }
                    }
                    conn.Close();
                }

                using (var conn = new SqlConnection(connectioninfo))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand(String.Format("SELECT task FROM tasks where status <> 'Available' and AssignedTo IS NOT NULL and project = {0}", currnum), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                ListBox2.DataSource = reader;
                                ListBox2.DataValueField = "task";
                                ListBox2.DataTextField = "task";
                                ListBox2.DataBind();
                            }
                        }
                    }
                    conn.Close();
                }


                String TeamMembers = "  ";
                using (SqlConnection conn = new SqlConnection(connectioninfo))
                {
                    string sql = String.Format(@"select DISTINCT t.MemberName as name from projects P, TeamMembers t where p.id = t.ProjectID and p.projectName = '{0}' and t.ProjectName = '{0}' ", Session["project"].ToString());
                    SqlCommand oCmd = new SqlCommand(sql, conn);
                    conn.Open();
                    using (SqlDataReader result = oCmd.ExecuteReader())
                    {
                        while (result.Read())
                        {
                            TeamMembers += result["name"].ToString();
                            TeamMembers += "  ,  ";
                        }
                        conn.Close();
                    }
                }
                try
                {
                    //Response.Write(String.Format(@"<script>alert('{0}')</script>",TeamMembers));
                    TeamMembers = TeamMembers.Remove(TeamMembers.Length - 3);
                    Session.Add("tMembers", TeamMembers);
                }
                catch { }


                //startDate
                String StartDate = "  ";
                using (SqlConnection conn = new SqlConnection(connectioninfo))
                {
                    string sql = String.Format(@"select StartDate from projects P where p.projectName = '{0}' ", Session["project"].ToString());
                    SqlCommand oCmd = new SqlCommand(sql, conn);
                    conn.Open();
                    using (SqlDataReader result = oCmd.ExecuteReader())
                    {
                        while (result.Read())
                        {
                            StartDate += result["StartDate"].ToString();
                        }
                        conn.Close();
                    }
                }
                try
                {
                    //Response.Write(String.Format(@"<script>alert('{0}')</script>",TeamMembers));
                    Session.Add("StartDate", StartDate);
                }
                catch { }

                //endDate
                //startDate
                String EndDate = "  ";
                using (SqlConnection conn = new SqlConnection(connectioninfo))
                {
                    string sql = String.Format(@"select EndDate from projects P where p.projectName = '{0}' ", Session["project"].ToString());
                    SqlCommand oCmd = new SqlCommand(sql, conn);
                    conn.Open();
                    using (SqlDataReader result = oCmd.ExecuteReader())
                    {
                        while (result.Read())
                        {
                            EndDate += result["EndDate"].ToString();
                        }
                        conn.Close();
                    }
                }
                try
                {
                    //Response.Write(String.Format(@"<script>alert('{0}')</script>",TeamMembers));
                    Session.Add("EndDate", EndDate);
                }
                catch { }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int TaskID = Convert.ToInt32(TextBox1.Text);
                String TaskName = TextBox2.Text.Replace("'", "''");
                String TaskDesc = TextBox3.Text.Replace("'", "''");
                String TaskType = DropDownList2.SelectedItem.Text;
                String Status = DropDownList3.SelectedItem.Text;
                DateTime DueDate = Calendar1.SelectedDate;
                String AssignedTo = DropDownList1.SelectedValue.ToString();

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                    String sql = "";
                    if (DropDownList1.SelectedIndex == 0)
                    {
                        sql = String.Format("INSERT INTO tasks (Id, task, taskDesc, DueDate, Type, Status, Project) values({0}, '{1}', '{2}', '{3}', '{4}', 'Available', '{5}')", TaskID, TaskName, TaskDesc, DueDate, TaskType, Convert.ToInt32(Session["pID"].ToString()));
                    }
                    else 
                    {
                        sql = String.Format("INSERT INTO tasks values({0}, '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')", TaskID, TaskName, TaskDesc, DueDate, AssignedTo, TaskType, Status, Convert.ToInt32(Session["pID"].ToString()));
                    }
                    using (SqlCommand cmd = new SqlCommand(sql))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
                DropDownList1.SelectedIndex = DropDownList2.SelectedIndex = DropDownList3.SelectedIndex = 0;
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", "Task Added!"));
              
            }
            catch (Exception ex)
            { TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
                DropDownList1.SelectedIndex = DropDownList2.SelectedIndex = DropDownList3.SelectedIndex = 0;
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));  }
            GridView1.DataBind();
            GridView2.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();

            Response.Redirect("pDetails.aspx");
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            try
            {
                String Task = ListBox1.SelectedItem.Text.ToString();
                String AssignTo = DropDownList4.SelectedItem.Text.ToString();

                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {
                   
                    String sql = String.Format("UPDATE tasks SET AssignedTo = '{0}', Status = 'In Progress' WHERE CONVERT(VARCHAR, task) = '{1}' and CONVERT(VARCHAR, project) = '{2}' ", AssignTo,Task,Convert.ToInt32(Session["pID"].ToString()));
                    using (SqlCommand cmd = new SqlCommand(sql))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                Response.Write(String.Format(@"<script language=javascript>alert('Task: {0} Assigned to {1}');</script>",Task,AssignTo ));
               
            }
            catch (Exception ex)
            {
                DropDownList4.SelectedIndex = 0;
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));
            }

            GridView1.DataBind();
            GridView2.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();

            Response.Redirect("pDetails.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string myString = e.Row.Cells[2].Text;

                string result = string.Empty;

                for (int i = 0; i < myString.Length; i++)
                    result += (i % 100 == 0 && i != 0) ? (myString[i].ToString() + "<br/>") : myString[i].ToString();

                e.Row.Cells[2].Text = result;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String Task = ListBox2.SelectedItem.Text.ToString();

            try
            {
                string constr = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                using (SqlConnection con = new SqlConnection(constr))
                {

                    String sql = String.Format("UPDATE tasks SET AssignedTo = NULL, Status = 'Available' WHERE CONVERT(VARCHAR, task) = '{0}' and CONVERT(VARCHAR, project) = '{1}' ", Task, Convert.ToInt32(Session["pID"].ToString()));
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
            catch (Exception ex)
            {
                DropDownList4.SelectedIndex = 0;
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));
            }
            Response.Write(String.Format(@"<script language=javascript>alert('User removed from Task: {0}');</script>", Task));
            GridView1.DataBind();
            GridView2.DataBind();
            ListBox1.DataBind();
            ListBox2.DataBind();
            Response.Redirect("pDetails.aspx");

        }

        protected void Chart1_Load(object sender, EventArgs e)
        {
            Chart1.ChartAreas[0].AxisX.CustomLabels.Add(0.5, 1.5, "Available");
            Chart1.ChartAreas[0].AxisX.CustomLabels.Add(1.5, 2.5, "In Progress");
        }
    }
}