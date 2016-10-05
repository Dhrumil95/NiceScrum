using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NiceScrum
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        String selectedProject = "";
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedProject = ListBox1.SelectedItem.Text;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Add("project", selectedProject);
            Response.Redirect("pDetails.aspx");
        }
    }
}