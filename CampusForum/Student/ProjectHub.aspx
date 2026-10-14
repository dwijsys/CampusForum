<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Project Hub" CodeBehind="ProjectHub.aspx.cs" Inherits="CampusForum.Student.ProjectHub" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cols">
        <div class="stack">
            <div class="section-heading">
                <div>
                    <h1>Cross-Department Collaboration Requests</h1>
                    <p class="muted">Connect across disciplines to build stronger projects.</p>
                </div>
                <a class="btn" href="/Student/Applications.aspx">My Requests &amp; Applications</a></div>
            <div class="two-cols" style="grid-template-columns: 235px minmax(0,1fr)">
                <section class="panel">
                    <h3>Post a Collaboration Request</h3>
                    <div class="form-section">
                        <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="ProjectRequest" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                        <div class="field">
                            <label>Project Title</label><asp:TextBox ID="txtProjectTitle" runat="server" placeholder="e.g., Autonomous Drone Delivery" MaxLength="160" /><asp:RequiredFieldValidator ID="rfvTxtProjectTitle" runat="server" ControlToValidate="txtProjectTitle" ValidationGroup="ProjectRequest" ErrorMessage="Project title is required." Text="Project title is required." CssClass="validation-message" Display="Dynamic" /></div>
                        <div class="field">
                            <label>Primary Department</label><asp:DropDownList ID="ddlProjectDepartment" runat="server">
                                <asp:ListItem Value="Computer Engineering">Computer Engineering</asp:ListItem>
                                <asp:ListItem Value="Business Administration">Business Administration</asp:ListItem>
                                <asp:ListItem Value="Graphic Design">Graphic Design</asp:ListItem>
                            </asp:DropDownList></div>
                        <div class="field">
                            <label>Targeted Departments</label><label><input type="checkbox" />
                                Mechanical Engineering</label><label><input type="checkbox" />
                                    Electrical Engineering</label><label><input type="checkbox" />
                                        Business Administration</label><label><input type="checkbox" />
                                            Graphic Design</label></div>
                        <div class="field">
                            <label>Skills Required</label><asp:TextBox ID="txtProjectSkills" runat="server" TextMode="MultiLine" Text="" placeholder="e.g., CAD, Python, Marketing" /></div>
                        <div class="field-grid">
                            <div class="field">
                                <label>Members Needed</label><asp:TextBox ID="txtMembersNeeded" runat="server" TextMode="Number" Text="1" min="1" /><asp:RequiredFieldValidator ID="rfvTxtMembersNeeded" runat="server" ControlToValidate="txtMembersNeeded" ValidationGroup="ProjectRequest" ErrorMessage="Members needed is required." Text="Members needed is required." CssClass="validation-message" Display="Dynamic" /><asp:RangeValidator ID="RangeTxtMembersNeeded" runat="server" ControlToValidate="txtMembersNeeded" ValidationGroup="ProjectRequest" Display="Dynamic" CssClass="validation-message" Text="Members needed must be a number from 1 to 99." MinimumValue="1" MaximumValue="99" Type="Integer" ErrorMessage="Members needed must be a number from 1 to 99." /></div>
                            <div class="field">
                                <label>Duration</label><asp:DropDownList ID="ddlProjectDuration" runat="server">
                                    <asp:ListItem Value="1 Semester">1 Semester</asp:ListItem>
                                    <asp:ListItem Value="Short Term">Short Term</asp:ListItem>
                                </asp:DropDownList></div>
                        </div>
                        <asp:Button ID="btnProjectRequest" runat="server" Text="Submit Request" ValidationGroup="ProjectRequest" OnClick="ProjectRequest_Click" CssClass="primary wide" /><asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
                </section>
                <section class="panel no-pad">
                    <div class="panel-header">Open Collaboration Requests
                        <select class="input" style="width: 145px; padding: 4px">
                            <option>All Departments</option>
                            <option>Engineering</option>
                            <option>Graphic Design</option>
                        </select></div>
                    <div class="panel-body">
                        <div class="row between">
                            <h3 class="post-title">Robotics Arm Automation</h3>
                            <span class="badge">1 Semester</span></div>
                        <small>Computer Engineering student needs Mechanical Student</small><p>Looking for a mechanical engineering student to help design and 3D print the chassis for an automated robotic arm. We will handle the inverse kinematics and control software.</p>
                        <p><span class="pill">Skills: CAD, 3D Printing, SolidWorks</span> <span class="pill">Needed: 2</span></p>
                        <div class="actions">
                            <button type="button" data-toggle data-on="&#x2713; Applied" data-off="Apply">Apply</button><a class="btn" href="/Student/Messages.aspx">Message</a></div>
                    </div>
                    <div class="panel-body" style="border-top: 1px solid #ddd">
                        <div class="row between">
                            <h3 class="post-title">Startup Pitch Deck Design</h3>
                            <span class="badge">Short Term</span></div>
                        <small>Business Admin group needs Graphic Design Student</small><p>We have the business plan and financials ready for the upcoming pitch competition, but we need someone with a strong design eye to make our presentation slides look professional and engaging.</p>
                        <p><span class="pill">Skills: Figma, Illustrator, Presentation Design</span> <span class="pill">Needed: 1</span></p>
                        <div class="actions">
                            <button type="button" data-toggle data-on="&#x2713; Applied" data-off="Apply">Apply</button><a class="btn" href="/Student/Messages.aspx">Message</a></div>
                    </div>
                </section>
            </div>
        </div>
        <aside class="panel">
            <h3>My Requests &amp; Applications</h3>
            <h3>My Active Projects</h3>
            <p class="card"><a href="/Student/Applications.aspx">AI Ethics Research</a><br />
                <span class="badge green">In Progress</span></p>
            <h3>Recent Requests</h3>
            <p class="card"><a href="/Student/Applications.aspx">UI/UX App Redesign</a><br />
                <span class="badge yellow">Pending Review</span></p>
        </aside>
    </div>

</asp:Content>
