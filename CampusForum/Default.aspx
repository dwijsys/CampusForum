<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Welcome" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="guest-page">
    <aside class="stack">
        <section class="panel login-card">
            <h3>Member Login</h3>
            <form onsubmit="window.location.href='/Student/Feed.aspx'; return false;">
                <div class="field"><label for="member-id">ID / Email</label><input id="member-id" placeholder="Student ID or email" required /></div>
                <div class="field"><label for="member-pass">Password</label><input type="password" id="member-pass" placeholder="Password" required /></div>
                <div class="row between" style="margin-bottom:12px"><label class="hint"><input type="checkbox" /> Remember me</label><a href="/Common/Help.aspx"><small>Forgot?</small></a></div>
                <button class="primary wide">Sign In</button>
            </form>
        </section>
        <section class="panel" style="text-align:center">
            <div style="font-size:29px;color:#45649b">&#x2667;</div>
            <h3>New to CampusForum?</h3>
            <p class="muted">Accounts are provisioned by the institution and registration is not required.</p>
            <a href="/Admin/Login.aspx"><small>Administrator access</small></a>
        </section>
    </aside>
    <div class="stack">
        <section class="hero" style="background-image:url('/images/campus_students.jpg')">
            <div class="hero-content"><h1>Connect with your Campus</h1><p>The official online community for students, faculty, and alumni. Share notes, discuss projects, and stay updated on campus life.</p></div>
        </section>
        <div class="intro-tiles">
            <a class="card" href="/Common/Departments.aspx"><div class="tile-icon">&#x265C;</div><h3>Department Communities</h3><p class="muted">Connect with peers in your major. Share course materials and seek advice.</p></a>
            <a class="card" href="/Student/ProjectHub.aspx"><div class="tile-icon">&#x2667;</div><h3>Project Collaboration</h3><p class="muted">Find team members for group assignments and showcase academic work.</p></a>
            <a class="card" href="/Student/Events.aspx"><div class="tile-icon">&#x25A3;</div><h3>Campus Events</h3><p class="muted">Stay up to date with club meetings, guest lectures and social gatherings.</p></a>
        </div>
        <section class="panel no-pad">
            <div class="panel-header">Latest Announcements <a href="/Student/Feed.aspx"><small>View All</small></a></div>
            <div class="panel-body"><h3 class="post-title">Spring Semester Registration Opens Next Week</h3><p>Please ensure all previous semester fees are cleared before attempting to register for Spring classes. Advisors are available for drop-in sessions...</p><small>Posted by Administration &#x2022; 2 hours ago</small></div>
            <div class="panel-body" style="border-top:1px solid #ddd"><h3 class="post-title">Computer Science Club Hackathon '08</h3><p>Join us in the student union basement this weekend for 48 hours of coding, pizza, and prizes. Open to all skill levels.</p><small>Posted by CS_Soc &#x2022; Yesterday</small></div>
        </section>
    </div>
    <aside class="stack">
        <section class="panel no-pad"><div class="panel-header">Trending Topics</div><div class="panel-body"><p class="row between"><a href="/Student/Feed.aspx">#MidtermPrep</a><small>124 posts</small></p><p class="row between"><a href="/Student/Feed.aspx">#DormLifeHacks</a><small>89 posts</small></p><p class="row between"><a href="/Student/Feed.aspx">Campus Parking Issues</a><small>56 posts</small></p></div></section>
        <section class="panel no-pad"><div class="panel-header">Student Voices</div><div class="panel-body"><b>Rakesh Kumar</b><br/><small>Computer Engineering</small><p class="quote">&#x201C;CampusForum helped me find a study group for O-Chem when I was totally lost. It's basically essential for surviving finals week.&#x201D;</p><b>Ankita Gupta</b><br/><small>B.Voc</small><p class="quote">&#x201C;I sold all my old textbooks here in like two days. Much better than the bulletin board in the student union!&#x201D;</p></div></section>
    </aside>
</div>

</asp:Content>
