<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Administrator Login" CodeBehind="Login.aspx.cs" Inherits="CampusForum.Admin.Login" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-admin-page">
        <div class="admin-login-box">
            <div class="admin-login-title">&#x2667; CampusForum Admin</div>
            <div class="admin-login-inner">
                <div class="alert" style="margin-bottom: 17px">&#x26A0; RESTRICTED ACCESS PORTAL</div>
                <div class="form-section">
                    <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="AdminLogin" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field">
                        <label>Administrator ID</label><asp:TextBox ID="txtAdminId" runat="server" placeholder="Enter Admin ID" MaxLength="50" /><asp:RequiredFieldValidator ID="rfvTxtAdminId" runat="server" ControlToValidate="txtAdminId" ValidationGroup="AdminLogin" ErrorMessage="Administrator ID is required." Text="Administrator ID is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="field">
                        <label>Secure Password</label><asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" placeholder="••••••••" MaxLength="256" /><asp:RequiredFieldValidator ID="rfvTxtAdminPassword" runat="server" ControlToValidate="txtAdminPassword" ValidationGroup="AdminLogin" ErrorMessage="Secure password is required." Text="Secure password is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="row between" style="margin-bottom: 12px">
                        <label class="hint">
                            <input type="checkbox" />
                            Remember device</label><a href="/Common/Help.aspx">Reset Credentials</a></div>
                    <asp:Button ID="btnAdminLogin" runat="server" Text="▣ AUTHENTICATE" ValidationGroup="AdminLogin" OnClick="AdminLogin_Click" CssClass="primary wide" /><asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
                <p class="muted" style="margin-top: 15px; font-size: 11px">This is a UI-only login demo. It does not verify an administrator's identity.</p>
            </div>
            <div class="admin-login-bottom">Unauthorized access is strictly prohibited.<br />
                Demonstration interface &#x2014; no real authentication or IP logging.</div>
        </div>
    </div>

</asp:Content>
