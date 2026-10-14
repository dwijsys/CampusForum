<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Submit a Report" CodeBehind="Report.aspx.cs" Inherits="CampusForum.Student.Report" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cols">
        <div class="stack">
            <div>
                <h1>Submit a Report</h1>
                <p class="muted">Please use this form to report violations of the CampusForum community guidelines.</p>
            </div>
            <section class="panel">
                <h3>&#x2691; Report Content or Post</h3>
                <div class="form-section">
                    <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="ContentReport" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field">
                        <label>Violation Category *</label><asp:DropDownList ID="ddlViolationCategory" runat="server">
                            <asp:ListItem Value="">Select a category...</asp:ListItem>
                            <asp:ListItem Value="Harassment">Harassment</asp:ListItem>
                            <asp:ListItem Value="Spam Post">Spam Post</asp:ListItem>
                            <asp:ListItem Value="Impersonation">Impersonation</asp:ListItem>
                            <asp:ListItem Value="Academic Dishonesty">Academic Dishonesty</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList><asp:RequiredFieldValidator ID="rfvDdlViolationCategory" runat="server" ControlToValidate="ddlViolationCategory" ValidationGroup="ContentReport" ErrorMessage="Violation category is required." Text="Violation category is required." CssClass="validation-message" Display="Dynamic" InitialValue="" /></div>
                    <div class="field">
                        <label>Direct Link to Content *</label><asp:TextBox ID="txtContentLink" runat="server" TextMode="Url" placeholder="https://campusforum.edu/post/..." MaxLength="600" /><asp:RequiredFieldValidator ID="rfvTxtContentLink" runat="server" ControlToValidate="txtContentLink" ValidationGroup="ContentReport" ErrorMessage="Content URL is required." Text="Content URL is required." CssClass="validation-message" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionTxtContentLink" runat="server" ControlToValidate="txtContentLink" ValidationGroup="ContentReport" Display="Dynamic" CssClass="validation-message" Text="Enter a valid HTTP or HTTPS link." ValidationExpression="^https?://[^\s/]+\.[^\s/]+(?:/[^\s]*)?$" ErrorMessage="Enter a valid HTTP or HTTPS link." /><small>Paste the URL of the specific post or comment.</small></div>
                    <div class="field">
                        <label>Detailed Description *</label><asp:TextBox ID="txtReportDescription" runat="server" TextMode="MultiLine" Text="" placeholder="Please describe exactly what happened and why this violates community standards..." /><asp:RequiredFieldValidator ID="rfvTxtReportDescription" runat="server" ControlToValidate="txtReportDescription" ValidationGroup="ContentReport" ErrorMessage="Detailed description is required." Text="Detailed description is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="field">
                        <label>Evidence / Screenshot (Optional)</label><asp:FileUpload ID="uplReportEvidence" runat="server" accept="image/*" /><asp:CustomValidator ID="cvUplReportEvidence" runat="server" ValidationGroup="ContentReport" OnServerValidate="ValidateReportEvidence" ErrorMessage="Evidence must be an image under 5 MB." Text="Evidence must be an image under 5 MB." CssClass="validation-message" Display="Dynamic" EnableClientScript="false" /><small>Max 5MB in the design; upload storage is not connected yet.</small></div>
                    <div class="actions">
                        <asp:Button ID="btnContentReport" runat="server" Text="Submit Content Report" ValidationGroup="ContentReport" OnClick="ContentReport_Click" CssClass="primary pull-right" /></div>
                    <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
            </section>
            <section class="panel">
                <h3>&#x2691; Flag a User Profile</h3>
                <p>Use this section if an entire account is dedicated to violating guidelines, ban evasion, or impersonation.</p>
                <div class="form-section">
                    <asp:ValidationSummary ID="summary2" runat="server" ValidationGroup="UserFlag" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field-grid">
                        <div class="field">
                            <label>Username to Flag *</label><asp:TextBox ID="txtFlagUsername" runat="server" placeholder="student_username" MaxLength="40" /><asp:RequiredFieldValidator ID="rfvTxtFlagUsername" runat="server" ControlToValidate="txtFlagUsername" ValidationGroup="UserFlag" ErrorMessage="Username is required." Text="Username is required." CssClass="validation-message" Display="Dynamic" /><asp:RegularExpressionValidator ID="RegularExpressionTxtFlagUsername" runat="server" ControlToValidate="txtFlagUsername" ValidationGroup="UserFlag" Display="Dynamic" CssClass="validation-message" Text="Username must be 3–40 characters (letters, numbers, dots, hyphens or underscores)." ValidationExpression="^[A-Za-z0-9._-]{3,40}$" ErrorMessage="Username must be 3–40 characters (letters, numbers, dots, hyphens or underscores)." /></div>
                        <div class="field">
                            <label>Reason for Flagging</label><asp:DropDownList ID="ddlFlagReason" runat="server">
                                <asp:ListItem Value="Impersonation">Impersonation</asp:ListItem>
                                <asp:ListItem Value="Harassment">Harassment</asp:ListItem>
                                <asp:ListItem Value="Spam">Spam</asp:ListItem>
                            </asp:DropDownList></div>
                    </div>
                    <div class="actions">
                        <asp:Button ID="btnUserFlag" runat="server" Text="Submit User Flag" ValidationGroup="UserFlag" OnClick="UserFlag_Click" CssClass="pull-right" /></div>
                    <asp:Label ID="lblFormStatus2" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
            </section>
        </div>
        <aside class="stack">
            <section class="panel">
                <h3>My Recent Reports <span class="badge">3 Active</span></h3>
                <p class="row between">#R-492 Harassment <span class="badge yellow">Pending</span></p>
                <p class="row between">#R-488 Spam Post <span class="badge">Review</span></p>
                <p class="row between">#R-412 Vulgarity <span class="badge green">Resolved</span></p>
                <a href="/Student/Report.aspx">View Full History &#x2192;</a></section>
            <section class="panel">
                <h3>&#x24D8; Before You Report</h3>
                <p>Ensure the content explicitly violates the Student Code of Conduct.</p>
                <p>False reporting or weaponizing the report system is a violation itself.</p>
                <p>Moderators review all reports within 24-48 business hours.</p>
                <a href="/Common/Help.aspx">Campus support information</a></section>
        </aside>
    </div>

</asp:Content>
