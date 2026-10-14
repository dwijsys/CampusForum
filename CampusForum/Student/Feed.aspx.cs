using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace CampusForum.Student
{
    public partial class Feed : Page
    {
        protected void Page_Load(object sender, EventArgs e) { BindFeedPosts(); }
        protected void PostFeed_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            var posts = Session["CampusForumDemoPosts"] as List<string> ?? new List<string>();
            posts.Insert(0, Server.HtmlEncode(txtPostContent.Text.Trim()));
            if (posts.Count > 20) posts.RemoveAt(posts.Count - 1);
            Session["CampusForumDemoPosts"] = posts;
            txtPostContent.Text = "";
            BindFeedPosts();
            lblFormStatus1.Text = "Post validated and displayed (session demo; not saved to a database).";
        }
        private void BindFeedPosts()
        {
            var posts = Session["CampusForumDemoPosts"] as List<string>;
            litNewFeedPosts.Text = posts == null ? "" : string.Concat(posts.ConvertAll(x => "<article class=\"card\"><h3>You &#8226; Just now</h3><p>" + x + "</p></article>"));
        }
    }
}
