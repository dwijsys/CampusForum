using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusForum.Student
{
    public partial class ProjectHub : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void ProjectRequest_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Collaboration request validated (demo only; not saved).";
        }
    }
}
