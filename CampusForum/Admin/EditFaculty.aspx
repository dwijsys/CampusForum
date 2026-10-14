<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Edit Faculty" CodeBehind="EditFaculty.aspx.cs" Inherits="CampusForum.Admin.EditFaculty" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="stack">
        <div class="section-heading">
            <div>
                <div class="muted">FACULTY MANAGEMENT / EDIT PROFILE</div>
                <h1>Edit Faculty Member: Dr. Heli Shah</h1>
            </div>
            <div class="actions"><a class="btn" href="/Admin/Faculty.aspx">Cancel</a><asp:Button ID="btnSaveFacultyTop" runat="server" CssClass="primary" Text="Save Changes" ValidationGroup="FacultyEdit" OnClick="UpdateFaculty_Click" /></div>
        </div>
        <div class="form-section" id="faculty-form">
            <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="FacultyEdit" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
            <div class="cols" style="grid-template-columns: minmax(0,1fr) 280px">
                <div class="stack">
                    <section class="panel">
                        <h3>PERSONAL INFORMATION</h3>
                        <div class="field-grid">
                            <div class="field">
                                <label>FULL NAME</label><asp:TextBox ID="txtFacultyName" runat="server" Text="Hetal Tripathi" MaxLength="120" /><asp:RequiredFieldValidator ID="rfvTxtFacultyName" runat="server" ControlToValidate="txtFacultyName" ValidationGroup="FacultyEdit" ErrorMessage="Full name is required." Text="Full name is required." CssClass="validation-message" Display="Dynamic" /></div>
                            <div class="field">
                                <label>ACADEMIC TITLE</label><asp:TextBox ID="txtFacultyTitle" runat="server" Text="Senior Professor of Theoretical Physics" MaxLength="150" /><asp:RequiredFieldValidator ID="rfvTxtFacultyTitle" runat="server" ControlToValidate="txtFacultyTitle" ValidationGroup="FacultyEdit" ErrorMessage="Academic title is required." Text="Academic title is required." CssClass="validation-message" Display="Dynamic" /></div>
                            <div class="field">
                                <label>INSTITUTIONAL EMAIL</label><asp:TextBox ID="txtFacultyEmail" runat="server" TextMode="Email" Text="h.tripathi@campus-edu.org" MaxLength="160" /><asp:RequiredFieldValidator ID="rfvTxtFacultyEmail" runat="server" ControlToValidate="txtFacultyEmail" ValidationGroup="FacultyEdit" ErrorMessage="Institutional email is required." Text="Institutional email is required." CssClass="validation-message" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionTxtFacultyEmail" runat="server" ControlToValidate="txtFacultyEmail" ValidationGroup="FacultyEdit" Display="Dynamic" CssClass="validation-message" Text="Enter a valid email address." ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" ErrorMessage="Enter a valid email address." /></div>
                            <div class="field">
                                <label>STAFF ID</label><asp:TextBox ID="txtFacultyStaffId" runat="server" Text="FAC-9920-X" MaxLength="30" /><asp:RequiredFieldValidator ID="rfvTxtFacultyStaffId" runat="server" ControlToValidate="txtFacultyStaffId" ValidationGroup="FacultyEdit" ErrorMessage="Staff ID is required." Text="Staff ID is required." CssClass="validation-message" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionTxtFacultyStaffId" runat="server" ControlToValidate="txtFacultyStaffId" ValidationGroup="FacultyEdit" Display="Dynamic" CssClass="validation-message" Text="Enter a valid staff ID (3–30 letters, numbers or hyphens)." ValidationExpression="^[A-Za-z0-9-]{3,30}$" ErrorMessage="Enter a valid staff ID (3–30 letters, numbers or hyphens)." /></div>
                        </div>
                        <div class="field">
                            <label>BIOGRAPHY / PROFILE SUMMARY</label><asp:TextBox ID="txtFacultyBio" runat="server" TextMode="MultiLine" Rows="5" Text="Specializing in quantum field theory and high-energy particle physics. Over 15 years of instructional experience within the University system. Leading the &#x27;Advanced String Theory&#x27; research initiative for the 2024-2025 academic calendar." /></div>
                    </section>
                    <section class="panel">
                        <h3>ACADEMIC CREDENTIALS</h3>
                        <table>
                            <thead>
                                <tr>
                                    <th>Degree</th>
                                    <th>Institution</th>
                                    <th>Year</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Ph.D. in Physics</td>
                                    <td>Massachusetts Institute of Technology</td>
                                    <td>2008</td>
                                </tr>
                                <tr>
                                    <td>M.Sc. Theoretical Physics</td>
                                    <td>Stanford University</td>
                                    <td>2004</td>
                                </tr>
                            </tbody>
                        </table>
                        <button type="button" style="margin-top: 10px" data-demo="Credentials editor requires persistence.">+ Add Credential</button></section>
                    <section class="panel">
                        <h3>ASSIGNED DEPARTMENTS</h3>
                        <div class="pill-list"><span class="pill">PHYSICS &amp; ASTRONOMY</span><span class="pill">APPLIED MATHEMATICS</span><span class="pill">RESEARCH OVERSIGHT</span>
                            <button type="button" data-demo="Department assignment demo">+ ASSIGN NEW</button></div>
                    </section>
                </div>
                <aside class="stack">
                    <section class="panel" style="text-align: center">
                        <img src="/images/faculty_profile.jpg" style="width: 100%; height: 170px; object-fit: cover" alt="Faculty portrait" /><div class="field">
                            <label>CHANGE PHOTO</label><asp:FileUpload ID="uplFacultyPhoto" runat="server" accept="image/png,image/jpeg" /><asp:CustomValidator ID="cvUplFacultyPhoto" runat="server" ValidationGroup="FacultyEdit" OnServerValidate="ValidateFacultyPhoto" ErrorMessage="Photo must be JPG or PNG and under 2 MB." Text="Photo must be JPG or PNG and under 2 MB." CssClass="validation-message" Display="Dynamic" EnableClientScript="false" /></div>
                        <small>Allowed formats: JPG, PNG. Max file size: 2MB</small></section>
                    <section class="panel">
                        <h3>SYSTEM PERMISSIONS</h3>
                        <p>
                            <label>
                                <input type="checkbox" checked />
                                Moderate Student Forum Posts</label></p>
                        <p>
                            <label>
                                <input type="checkbox" checked />
                                Modify Course Syllabi</label></p>
                        <p>
                            <label>
                                <input type="checkbox" />
                                Access Financial Grant Data</label></p>
                        <p>
                            <label>
                                <input type="checkbox" checked />
                                Authorize Guest Lecturers</label></p>
                        <p>
                            <label>
                                <input type="checkbox" />
                                Global System Administrator</label></p>
                        <div class="field">
                            <label>ROLE HIERARCHY</label><asp:DropDownList ID="ddlFacultyRole" runat="server">
                                <asp:ListItem Value="Senior Faculty Member">Senior Faculty Member</asp:ListItem>
                                <asp:ListItem Value="Faculty Member">Faculty Member</asp:ListItem>
                            </asp:DropDownList></div>
                    </section>
                    <section class="panel">
                        <h3>ACCOUNT STATUS <span class="badge green">ACTIVE</span></h3>
                        <p class="muted">Last Login: 2024-05-12 09:41 AM</p>
                        <button type="button" class="danger wide" data-demo="Suspend action demo only.">SUSPEND ACCOUNT</button></section>
                </aside>
            </div>
            <div class="actions" style="justify-content: flex-end; margin-top: 20px">
                <button type="reset">Reset Form</button><asp:Button ID="btnUpdateFaculty" runat="server" Text="Update Faculty Profile" ValidationGroup="FacultyEdit" OnClick="UpdateFaculty_Click" CssClass="primary" /></div>
            <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" />
        </div>
    </div>

</asp:Content>
