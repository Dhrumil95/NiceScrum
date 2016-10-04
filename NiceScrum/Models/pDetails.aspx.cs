using System;
using System.Data;
using System.Data.SqlClient;

namespace NiceScrum.Models
{
    public partial class pDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Button1.Text = "Add Task";

                string connectioninfo;
                SqlConnection db;

                connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

                db = new SqlConnection(connectioninfo);

                using (var conn = new SqlConnection(connectioninfo))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("SELECT name FROM users", conn))
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
                    conn.Close();
                }


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
                String TeamMembers = "  ";
                using (SqlConnection conn = new SqlConnection(connectioninfo))
                {
                    string sql = String.Format(@"select DISTINCT t.AssignedTo as name from projects P, tasks t where p.id = t.Project and p.projectName = '{0}' and t.AssignedTo IS NOT NULL ", Session["project"].ToString());
                    SqlCommand oCmd = new SqlCommand(sql, conn);
                    conn.Open();
                    using (SqlDataReader result = oCmd.ExecuteReader())
                    {
                        while (result.Read())
                        {
                            TeamMembers += result["name"].ToString();
                            TeamMembers += ",  ";
                        }
                        conn.Close();
                    }
                }
                //Response.Write(String.Format(@"<script>alert('{0}')</script>",TeamMembers));
                TeamMembers = TeamMembers.Remove(TeamMembers.Length - 3);
                Session.Add("tMembers", TeamMembers);
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
                    String sql = String.Format("INSERT INTO tasks values({0}, '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')", TaskID, TaskName, TaskDesc, DueDate, AssignedTo, TaskType, Status, Convert.ToInt32(Session["pID"].ToString()));
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
                GridView1.DataBind();
            }
            catch (Exception ex)
            { TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
                DropDownList1.SelectedIndex = DropDownList2.SelectedIndex = DropDownList3.SelectedIndex = 0;
                Response.Write(String.Format(@"<script language=javascript>alert('{0}');</script>", ex.Message));  }        
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
        }
    }
}