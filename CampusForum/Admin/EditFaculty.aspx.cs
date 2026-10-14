using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace CampusForum.Admin
{
    public partial class EditFaculty : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void UpdateFaculty_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Faculty details passed .NET validation (demo only; not saved).";
        }

        protected void ValidateFacultyPhoto(object source, ServerValidateEventArgs args)
        {
            if (!uplFacultyPhoto.HasFile) { args.IsValid = true; return; }
            string extension = Path.GetExtension(uplFacultyPhoto.FileName).ToLowerInvariant();
            args.IsValid = (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                && uplFacultyPhoto.PostedFile.ContentLength <= 2 * 1024 * 1024;
        }
    }
}
