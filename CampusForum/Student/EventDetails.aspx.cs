using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusForum.Student
{
    public partial class EventDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void PostReply_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Reply validated (demo only; not saved to a database).";
        }
    }
}
