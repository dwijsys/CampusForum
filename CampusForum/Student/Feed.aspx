<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Home Feed" CodeBehind="Feed.aspx.cs" Inherits="CampusForum.Student.Feed" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cols">
        <div class="stack">
            <section class="panel">
                <div class="form-section" id="post-form">
                    <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="PostFeed" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field">
                        <asp:TextBox ID="txtPostContent" runat="server" TextMode="MultiLine" Text="" placeholder="What&#x27;s on your mind?" aria-label="New post" /><asp:RequiredFieldValidator ID="rfvTxtPostContent" runat="server" ControlToValidate="txtPostContent" ValidationGroup="PostFeed" ErrorMessage="Post is required." Text="Post is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="actions">
                        <button type="button" data-demo="Image uploads will be connected later.">&#x25A7; Image</button>
                        <button type="button" data-demo="File uploads will be connected later.">&#x25A4; File</button>
                        <button type="button" data-demo="Polls will be connected later.">&#x25A3; Poll</button><asp:Button ID="btnPostFeed" runat="server" Text="Post" ValidationGroup="PostFeed" OnClick="PostFeed_Click" CssClass="primary pull-right" /></div>
                    <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
            </section>
            <div class="tabs"><a class="active" href="/Student/Feed.aspx">All</a><a href="/Common/Departments.aspx">My Department</a><a href="/Student/Feed.aspx">Trending</a><a href="/Common/Saved.aspx">Saved</a></div>
            <div id="feed-posts" class="stack">
                <asp:Literal ID="litNewFeedPosts" runat="server" />
                <article class="card">
                    <div class="row">
                        <img class="avatar" src="/images/sarina_profile.jpg" alt="" /><div><b>Sarina Wangchuk</b><br />
                            <small>Computer Science Dept &#x2022; 2 hours ago</small></div>
                    </div>
                    <p style="margin-top: 14px">Just finished setting up the new server architecture for the upcoming hackathon. Looks solid! If anyone wants a walkthrough of the load balancing setup, let me know.</p>
                    <img class="post-image" src="/images/server_room.jpg" alt="Server room" /><div class="post-footer">
                        <button type="button" data-toggle data-on="&#x2665; Liked" data-off="&#x2661; Like">&#x2661; Like (12)</button>
                        <button type="button" data-demo="Commenting will be connected with the database.">&#x25A4; Comment (3)</button>
                        <button type="button" data-demo="Share action preview.">&#x21E7; Share</button>
                        <button type="button" data-toggle data-on="&#x2713; Saved" data-off="&#x2667; Save">&#x2667; Save</button></div>
                </article>
                <article class="card">
                    <h3>Prof. Hansal Mehta</h3>
                    <small>Physics Dept &#x2022; 5 hours ago</small><p>Here are the lecture notes for Thermodynamics Week 4. Please review before Thursday's lab session.</p>
                    <div class="notice">&#x1F4C4; Thermo_Week4_Notes.pdf
                        <button type="button" class="pull-right" data-demo="This PDF attachment is not included in the Figma export.">Download</button><br />
                        <small>2.4 MB &#x2022; PDF Document</small></div>
                    <div class="post-footer">
                        <button type="button" data-toggle data-on="&#x2665; Liked" data-off="&#x2661; Like">&#x2661; Like (45)</button>
                        <button type="button" data-demo="Comments demo.">&#x25A4; Comment (0)</button>
                        <button type="button" data-demo="Share demo.">Share</button>
                        <button type="button" data-toggle data-on="&#x2713; Saved" data-off="&#x2667; Save">Save</button></div>
                </article>
            </div>
        </div>
        <aside class="stack">
            <section class="panel">
                <h3><span class="badge red">IMPORTANT</span> Campus Alert</h3>
                <p>Main library will be closed this weekend for emergency maintenance.</p>
                <a href="/Student/Events.aspx">Read full details &#xBB;</a></section>
            <section class="panel no-pad">
                <div class="panel-header">Trending Topics</div>
                <div class="panel-body">
                    <p class="row between">#SpringCareerFair <small>245 posts</small></p>
                    <p class="row between">#ExamPrep <small>120 posts</small></p>
                    <p class="row between">#HousingSearch <small>89 posts</small></p>
                    <p class="row between">#Hackathon2024 <small>56 posts</small></p>
                </div>
            </section>
            <section class="panel no-pad">
                <div class="panel-header">Upcoming Events <a href="/Student/Events.aspx"><small>View All</small></a></div>
                <div class="panel-body">
                    <p><b>OCT 12</b> &nbsp; Guest Lecture: AI Ethics<br />
                        <small>Auditorium A &#x2022; 2:00 PM</small></p>
                    <hr class="subtle-rule" />
                    <p><b>OCT 15</b> &nbsp; Engineering Club Mixer<br />
                        <small>Student Union &#x2022; 6:00 PM</small></p>
                </div>
            </section>
        </aside>
    </div>

</asp:Content>
