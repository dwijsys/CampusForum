<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Admin Dashboard" CodeBehind="Dashboard.aspx.cs" Inherits="CampusForum.Admin.Dashboard" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="stack">
        <div class="section-heading">
            <div>
                <h1>Admin Dashboard Overview</h1>
                <p class="muted">Primary System Metrics &amp; Moderation Queue</p>
            </div>
            <div class="muted" style="text-align: right">August 5, 2026<br />
                System Time: 02:59:08 UTC</div>
        </div>
        <div class="three-cols" style="grid-template-columns: repeat(4,1fr)">
            <div class="metric"><span>Total Students</span><strong>12,450</strong></div>
            <div class="metric"><span>Active Posts</span><strong>1,204</strong></div>
            <div class="metric"><span>Pending Reports</span><strong style="color: #c33f4b">42</strong></div>
            <div class="metric"><span>Ongoing Projects</span><strong>156</strong><small>System nominal</small></div>
        </div>
        <div class="cols">
            <section class="panel no-pad">
                <div class="panel-header">Recent System Activity <span><a href="/Admin/Moderation.aspx"><small>Server Logs</small></a></span></div>
                <div class="table-wrap" style="border: 0">
                    <table>
                        <thead>
                            <tr>
                                <th>Timestamp</th>
                                <th>Event Type</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>14:30:12 UTC</td>
                                <td>Access Log</td>
                                <td>Account provisioned for: John Doe (ID: 99482)</td>
                                <td><span class="badge green">SUCCESS</span></td>
                                <td><a href="/Admin/Students.aspx">VIEW</a></td>
                            </tr>
                            <tr>
                                <td>14:28:45 UTC</td>
                                <td>Moderation</td>
                                <td>Post flagged for review in 'General Discussion'</td>
                                <td><span class="badge yellow">PENDING</span></td>
                                <td><a href="/Admin/Moderation.aspx">VIEW</a></td>
                            </tr>
                            <tr>
                                <td>14:22:10 UTC</td>
                                <td>Content</td>
                                <td>Event created: 'Spring Gala 2024' by Admin</td>
                                <td><span class="badge green">SUCCESS</span></td>
                                <td><a href="/Student/Events.aspx">VIEW</a></td>
                            </tr>
                            <tr>
                                <td>14:15:00 UTC</td>
                                <td>System</td>
                                <td>Failed login attempt from IP 192.168.1.45</td>
                                <td><span class="badge red">ERROR</span></td>
                                <td>
                                    <button type="button" class="tiny" data-demo="Read-only sample log.">VIEW</button></td>
                            </tr>
                            <tr>
                                <td>14:05:33 UTC</td>
                                <td>Access Log</td>
                                <td>Account provisioned for Sarah Smith</td>
                                <td><span class="badge green">SUCCESS</span></td>
                                <td><a href="/Admin/Students.aspx">VIEW</a></td>
                            </tr>
                            <tr>
                                <td>13:50:22 UTC</td>
                                <td>Moderation</td>
                                <td>User 'anon_user12' suspended for 24h</td>
                                <td><span class="badge green">SUCCESS</span></td>
                                <td><a href="/Admin/Moderation.aspx">VIEW</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="panel-body"><a href="/Admin/Moderation.aspx">View Full Queue &#x2192;</a></div>
            </section>
            <aside class="panel">
                <h3>Moderation Queue <span class="badge red">42</span></h3>
                <div class="card"><b>15 Reports</b> <small class="pull-right">10m ago</small><p>&#x201C;Inappropriate content in Physics 101 study group thread regarding final exam answers...&#x201D;</p>
                    <small>By: unknown_user</small> &nbsp; <a href="/Admin/Moderation.aspx">Review</a></div>
                <div class="card"><b>8 Reports</b><p>&#x201C;Spam links posted repeatedly in the Campus Housing portal comments section.&#x201D;</p>
                    <a href="/Admin/Moderation.aspx">Review</a></div>
                <div class="card"><b>5 Reports</b><p>&#x201C;Harassment directed at a specific student in the debate club forum.&#x201D;</p>
                    <a href="/Admin/Moderation.aspx">Review</a></div>
            </aside>
        </div>
    </div>

</asp:Content>
