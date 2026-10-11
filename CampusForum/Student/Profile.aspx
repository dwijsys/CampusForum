<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Student Profile" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="cols">
 <div class="stack">
  <section class="panel no-pad">
    <img class="cover" src="/images/campus_cover.jpg" alt="University campus" />
    <div class="profile-overview">
       <div class="row" style="align-items:end"><img class="avatar lg" src="/images/sarina_profile.jpg" alt="Sarina"/><div><h1 class="profile-name">Sarina Wangchuk</h1><small>Computer Science &#x2022; Junior Semester 6</small><div class="muted">&#x2316; Main Campus</div></div><button class="primary pull-right" data-toggle data-on="&#x2713; Following" data-off="+ Follow">+ Follow</button></div>
       <div class="profile-stats"><span><b>342</b> Followers</span><span><b>128</b> Following</span><span><b>1,450</b> Reputation</span></div>
    </div>
  </section>
  <div class="two-cols" style="grid-template-columns:215px minmax(0,1fr)">
   <div class="stack"><section class="panel"><h3>&#x25C9; About Me</h3><p>Passionate about machine learning and open source. Currently organizing the Spring Hackathon. Always up for a coffee chat about tech or indie music.</p></section><section class="panel"><h3>&#x2654; Achievements</h3><p><span class="badge">Hackathon Winner '23</span></p><span class="badge">Top Contributor</span></section></div>
   <div class="stack"><div class="tabs"><a class="active" href="/Student/Profile.aspx">Recent Posts</a><a href="/Student/ProjectHub.aspx">Projects</a><a href="/Common/Saved.aspx">Saved</a></div><article class="card"><small><img class="avatar" src="/images/sarina_profile.jpg" alt=""/> Sarina Wangchuk posted in CS 301 Study Group</small><h3>Notes for upcoming Midterm</h3><p>Hey everyone, I compiled a summary of chapters 4-7 based on the lectures. Hope this helps with studying! Let me know if I missed anything important regarding the Big-O notation examples.</p><div class="notice">&#x1F4C4; midterm_notes_v2.pdf</div><div class="post-footer"><button data-toggle data-on="&#x2665; Liked" data-off="&#x2661; Like">&#x2661; 14</button><button data-demo="Comments are a future database feature.">&#x25A4; 3</button><button data-demo="Sharing is a demo action.">Share</button></div></article></div>
  </div>
 </div>
 <aside class="panel no-pad"><div class="panel-header">Mutual Connections</div><div class="panel-body"><p>&#x25C9; <a href="/Student/Profile.aspx">Sarina Wangchuk</a></p><p>&#x25C9; <a href="/Student/Profile.aspx">Ravi Kumar</a></p></div></aside>
</div>

</asp:Content>
