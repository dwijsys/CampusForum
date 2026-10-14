using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace CampusForum.Student
{
    public partial class Messages : Page
    {
        protected void Page_Load(object sender, EventArgs e) { BindMessages(); }
        protected void SendMessage_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            var messages = Session["CampusForumDemoMessages"] as List<string> ?? new List<string>();
            messages.Add(Server.HtmlEncode(txtMessage.Text.Trim()));
            if (messages.Count > 30) messages.RemoveAt(0);
            Session["CampusForumDemoMessages"] = messages;
            txtMessage.Text = "";
            BindMessages();
            lblFormStatus1.Text = "Message validated and displayed (session demo; not sent).";
        }
        private void BindMessages()
        {
            var messages = Session["CampusForumDemoMessages"] as List<string>;
            litNewMessages.Text = messages == null ? "" : string.Concat(messages.ConvertAll(x => "<div class=\"bubble me\">" + x + "</div>"));
        }
    }
}
