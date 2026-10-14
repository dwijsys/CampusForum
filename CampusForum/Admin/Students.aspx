<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Student Management" CodeBehind="Students.aspx.cs" Inherits="CampusForum.Admin.Students" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="stack">
        <div class="section-heading">
            <div>
                <h1>Student Management</h1>
                <p class="muted">Manage enrollments, statuses, and profiles.</p>
            </div>
            <div class="actions">
                <button type="button" data-demo="CSV export requires the database.">&#x21A7; Export CSV</button>
                <button type="button" class="primary" data-demo="Bulk actions require an editable database.">Bulk Actions &#x25BE;</button></div>
        </div>
        <section class="panel">
            <h3>Search &amp; Filter Criteria</h3>
            <div class="form-section">
                <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="StudentSearch" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                <div class="field-grid" style="grid-template-columns: 1fr 1fr 1fr 1fr">
                    <div class="field">
                        <label>Student Name</label><asp:TextBox ID="txtSearchName" runat="server" placeholder="Search name" /></div>
                    <div class="field">
                        <label>Student ID</label><asp:TextBox ID="txtSearchStudentId" runat="server" placeholder="Student ID" /></div>
                    <div class="field">
                        <label>Department</label><asp:DropDownList ID="ddlSearchDepartment" runat="server">
                            <asp:ListItem Value="All Departments">All Departments</asp:ListItem>
                            <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                            <asp:ListItem Value="Engineering">Engineering</asp:ListItem>
                        </asp:DropDownList></div>
                    <div class="field">
                        <label>Status</label><asp:DropDownList ID="ddlSearchStatus" runat="server">
                            <asp:ListItem Value="Any Status">Any Status</asp:ListItem>
                            <asp:ListItem Value="Active">Active</asp:ListItem>
                            <asp:ListItem Value="Pending">Pending</asp:ListItem>
                            <asp:ListItem Value="Suspended">Suspended</asp:ListItem>
                        </asp:DropDownList></div>
                </div>
                <div class="actions" style="justify-content: end">
                    <asp:Button ID="btnClearStudentSearch" runat="server" Text="Clear" CausesValidation="false" OnClick="ClearStudentSearch_Click" /><asp:Button ID="btnStudentSearch" runat="server" Text="⌕ Search" ValidationGroup="StudentSearch" CausesValidation="false" OnClick="StudentSearch_Click" CssClass="primary" /></div>
                <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
        </section>
        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th>&#x25A1;</th>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Semester</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input type="checkbox" /></td>
                        <td>CS-2023-0142</td>
                        <td>Akhil T.</td>
                        <td>Computer Science</td>
                        <td>Fall 2023 (Sem 3)</td>
                        <td><span class="badge green">ACTIVE</span></td>
                        <td>
                            <button type="button" class="tiny" data-demo="Student details demo">&#x1F441;</button>
                            <button type="button" class="tiny" data-demo="Edit requires database">&#x270E;</button></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" /></td>
                        <td>ENG-2022-0089</td>
                        <td>Mukesh Gupta</td>
                        <td>Engineering</td>
                        <td>Fall 2023 (Sem 5)</td>
                        <td><span class="badge green">ACTIVE</span></td>
                        <td>
                            <button type="button" class="tiny" data-demo="Student details demo">&#x1F441;</button>
                            <button type="button" class="tiny" data-demo="Edit requires database">&#x270E;</button></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" /></td>
                        <td>BUS-2021-0301</td>
                        <td>Sarina Wangchuk</td>
                        <td>Business Administration</td>
                        <td>Fall 2023 (Sem 7)</td>
                        <td><span class="badge red">SUSPENDED</span></td>
                        <td><a href="/Student/Profile.aspx">View</a></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" /></td>
                        <td>ART-2024-0012</td>
                        <td>Dhaval Kothari</td>
                        <td>Arts &amp; Humanities</td>
                        <td>Fall 2023 (Sem 1)</td>
                        <td><span class="badge yellow">PENDING</span></td>
                        <td>
                            <button type="button" class="tiny" data-demo="Student details demo">&#x1F441;</button></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" /></td>
                        <td>CS-2022-0211</td>
                        <td>Geeta Patel</td>
                        <td>Computer Science</td>
                        <td>Fall 2023 (Sem 5)</td>
                        <td><span class="badge green">ACTIVE</span></td>
                        <td>
                            <button type="button" class="tiny" data-demo="Student details demo">&#x1F441;</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="row between"><small>Showing 1 to 5 of 1,248 entries (sample data)</small><div class="actions">
            <button type="button" disabled>Previous</button>
            <button type="button" class="primary tiny">1</button>
            <button type="button" class="tiny" data-demo="Pagination requires data source">2</button>
            <button type="button" class="tiny" data-demo="Pagination requires data source">Next</button></div>
        </div>
    </div>

</asp:Content>
