using System;

namespace NiceScrum.Models
{
    public partial class myWork : System.Web.UI.Page
    {
        String selectedProject = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Text = "Submit";
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
    }
}