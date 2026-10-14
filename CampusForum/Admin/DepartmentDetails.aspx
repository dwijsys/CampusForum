<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Department Details" CodeBehind="DepartmentDetails.aspx.cs" Inherits="CampusForum.Admin.DepartmentDetails" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="stack">
        <div class="section-heading">
            <div>
                <p class="muted"><a href="/Admin/Departments.aspx">Departments</a> &#x203A; Computer Science &amp; Engineering</p>
                <h1>Computer Science &amp; Engineering <span class="badge green">ACTIVE</span></h1>
            </div>
            <div class="actions">
                <button type="button" data-demo="Reporting/export is not connected.">Export Report</button>
                <button type="button" class="primary" data-demo="Department editing is not connected.">Edit Department</button></div>
        </div>
        <div class="three-cols" style="grid-template-columns: repeat(4,1fr)">
            <div class="metric"><span>Total Enrollment</span><strong>1,284</strong></div>
            <div class="metric"><span>Assigned Faculty</span><strong>42</strong><small>Full-time</small></div>
            <div class="metric"><span>Research Projects</span><strong>18</strong><small>Active</small></div>
            <div class="metric"><span>Moderation Alerts</span><strong style="color: #b33441">3</strong><small>Critical</small></div>
        </div>
        <div class="cols">
            <div class="stack">
                <section class="panel no-pad">
                    <div class="panel-header">ASSIGNED FACULTY <a href="/Admin/Faculty.aspx"><small>Manage All</small></a></div>
                    <div class="table-wrap" style="border: 0">
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Load</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Dr. Heli Shah</td>
                                    <td>Senior Professor</td>
                                    <td>Building A, 402</td>
                                    <td>Normal</td>
                                    <td><a href="/Admin/EditFaculty.aspx">Edit</a></td>
                                </tr>
                                <tr>
                                    <td>Marcus Gupta</td>
                                    <td>Assistant Prof</td>
                                    <td>Building B, 112</td>
                                    <td>High</td>
                                    <td><a href="/Admin/EditFaculty.aspx">Edit</a></td>
                                </tr>
                                <tr>
                                    <td>Dr. Anita Gupta</td>
                                    <td>Research Lead</td>
                                    <td>Lab 4, West</td>
                                    <td>Normal</td>
                                    <td><a href="/Admin/EditFaculty.aspx">Edit</a></td>
                                </tr>
                                <tr>
                                    <td>Samir Patel</td>
                                    <td>Lab Technician</td>
                                    <td>Annex 1</td>
                                    <td>Available</td>
                                    <td><a href="/Admin/EditFaculty.aspx">Edit</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
                <h3>ACTIVE DEPARTMENTAL PROJECTS</h3>
                <div class="two-cols">
                    <section class="card"><span class="badge green">FUNDED</span><h3>Neural Mesh Optimization</h3>
                        <p>Efficiency research on graph neural networks for edge computing devices in urban environments.</p>
                        <small>ENDS IN 12D</small></section>
                    <section class="card"><span class="badge red">REVIEW REQ</span><h3>Encrypted Ledger Audit</h3>
                        <p>Annual security verification of departmental blockchain records.</p>
                        <small>ENDS IN 4D</small></section>
                </div>
            </div>
            <aside class="stack">
                <section class="panel">
                    <h3>FORUM MODERATION LOG</h3>
                    <div class="alert"><b>Critical Flag</b><p>External data link detected in private student forum section.</p>
                        <a href="/Admin/Moderation.aspx">Investigate</a></div>
                    <hr class="subtle-rule" />
                    <b>Spam Warning</b><p>Automated system flagged duplicate post across 3 thread categories.</p>
                    <a href="/Admin/Moderation.aspx">Dismiss</a></section>
                <section class="panel">
                    <h3>QUICK CONTROLS</h3>
                    <div class="field">
                        <label>Enrollment Status</label><select><option>Open (Full Access)</option>
                            <option>Closed</option>
                        </select></div>
                    <p>
                        <label>
                            <input type="checkbox" checked />
                            Public Directory Listing</label></p>
                    <p>
                        <label>
                            <input type="checkbox" />
                            Cross-Dept Collaboration</label></p>
                    <button type="button" class="wide" data-demo="Preferences require a database.">UPDATE PREFERENCES</button></section>
            </aside>
        </div>
    </div>

</asp:Content>
