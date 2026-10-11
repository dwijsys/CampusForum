<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="My Requests &amp; Applications" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<div style="max-width:850px" class="stack"><h1>My Requests &amp; Applications</h1>
 <div class="notice row between"><span>&#x24D8; You have been invited to join the <b>&#x201C;Mobile Wallet Prototype&#x201D;</b> project!</span><div class="actions"><button class="primary" data-demo="Invitation accepted for this demonstration.">Accept</button><button data-demo="Invitation declined for this demonstration.">Decline</button></div></div>
 <div class="tabs"><a class="active" href="/Student/Applications.aspx">My Sent Applications</a><a href="/Student/Applications.aspx">Received Requests</a><a href="/Student/Applications.aspx">My Invitations</a></div>
 <section class="panel no-pad"><div class="panel-header">Active Applications</div><div class="table-wrap" style="border:0"><table><thead><tr><th>Project Name</th><th>Owner</th><th>Date Applied</th><th>Status</th><th>Action</th></tr></thead><tbody><tr><td>Campus Map Redesign</td><td>Prof. Heril</td><td>Oct 12, 2011</td><td><span class="badge yellow">Pending</span></td><td><button data-demo="Withdrawal demo only" class="tiny">Withdraw</button></td></tr><tr><td>Student Council Website</td><td>Sarina Wangchuk</td><td>Oct 05, 2011</td><td><span class="badge green">Accepted</span></td><td><a href="/Student/ProjectHub.aspx">View</a></td></tr><tr><td>Library Study App</td><td>Mihir Dave</td><td>Sep 28, 2011</td><td><span class="badge red">Rejected</span></td><td><a href="/Student/ProjectHub.aspx">View</a></td></tr></tbody></table></div></section>
 <a href="/Student/ProjectHub.aspx">&#x2190; Back to Project Hub</a>
</div>

</asp:Content>
