using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusForum.Admin
{
    public partial class Broadcast : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Broadcast_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Broadcast validated successfully (demo only; not sent or saved).";
        }

        protected void ValidateSchedule(object source, ServerValidateEventArgs args)
        {
            string start = txtSendDate.Text.Trim();
            string end = txtExpiryDate.Text.Trim();
            if (start.Length == 0 && end.Length == 0) { args.IsValid = true; return; }
            // Both dates are required when the broadcast is scheduled.
            DateTime sentAt, expiresAt;
            args.IsValid = start.Length != 0 && end.Length != 0
                && DateTime.TryParse(start, out sentAt)
                && DateTime.TryParse(end, out expiresAt)
                && expiresAt > sentAt;
        }
    }
}
