using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CampusForum.Student
{
    public partial class Report : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void ContentReport_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Content report validated (demo only; not submitted to moderators).";
        }

        protected void UserFlag_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus2.Text = "User flag validated (demo only; not submitted to moderators).";
        }

        protected void ValidateReportEvidence(object source, ServerValidateEventArgs args)
        {
            if (!uplReportEvidence.HasFile) { args.IsValid = true; return; }
            string extension = Path.GetExtension(uplReportEvidence.FileName).ToLowerInvariant();
            args.IsValid = (extension == ".jpg" || extension == ".jpeg" || extension == ".png" || extension == ".gif" || extension == ".webp")
                && uplReportEvidence.PostedFile.ContentLength <= 5 * 1024 * 1024;
        }
    }
}
