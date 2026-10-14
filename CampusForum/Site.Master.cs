using System;
using System.Web.UI;

namespace CampusForum
{
    public partial class SiteMaster : MasterPage
    {
        // Read the current page name so we can display the correct menu.
            protected string CurrentPath
            {
                get { return Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant(); }
            }

            protected bool IsAdmin
            {
                get { return CurrentPath.StartsWith("~/admin/") && !CurrentPath.EndsWith("/login.aspx"); }
            }

            protected bool IsGuest
            {
                get { return CurrentPath.EndsWith("~/default.aspx"); }
            }

            protected bool IsAdminLogin
            {
                get { return CurrentPath.EndsWith("/admin/login.aspx"); }
            }

            // Mark the active page blue in the sidebar.
            protected string Active(string page)
            {
                return CurrentPath.EndsWith("/" + page.ToLowerInvariant() + ".aspx") ? "active" : "";
            }
    }
}
