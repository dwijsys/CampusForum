using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusForum.Admin
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            // UI demo: redirects after ASP.NET validation, but this is NOT authentication.
            Response.Redirect(ResolveUrl("~/Admin/Dashboard.aspx"));
        }
    }
}
