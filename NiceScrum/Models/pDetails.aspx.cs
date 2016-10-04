using System;
using System.Data.SqlClient;

namespace NiceScrum.Models
{
    public partial class pDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string connectioninfo;
            SqlConnection db;

            connectioninfo = String.Format(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True");

            db = new SqlConnection(connectioninfo);
            db.Open();

            string sql2 = String.Format(@"select id from projects where projects.projectName = '{0}'",Session["project"].ToString());
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = db;
            cmd2.CommandText = sql2;
            object result2 = new object();
            result2 = cmd2.ExecuteScalar();
            string maxVal = Convert.ToString(result2);
            int currnum = Convert.ToInt32(maxVal);
            db.Close();

            Session.Add("pID",currnum);
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
}