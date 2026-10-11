<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Administrator Login" %>
<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="login-admin-page"><div class="admin-login-box"><div class="admin-login-title">&#x2667; CampusForum Admin</div><div class="admin-login-inner">
 <div class="alert" style="margin-bottom:17px">&#x26A0; RESTRICTED ACCESS PORTAL</div>
 <form onsubmit="window.location.href='/Admin/Dashboard.aspx'; return false;"><div class="field"><label>Administrator ID</label><input placeholder="Enter Admin ID" required /></div><div class="field"><label>Secure Password</label><input type="password" placeholder="&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;&#x2022;" required /></div><div class="row between" style="margin-bottom:12px"><label class="hint"><input type="checkbox"/> Remember device</label><a href="/Common/Help.aspx">Reset Credentials</a></div><button class="primary wide">&#x25A3; AUTHENTICATE</button></form>
 <p class="muted" style="margin-top:15px;font-size:11px">This is a UI-only login demo. It does not verify an administrator's identity.</p>
 </div><div class="admin-login-bottom">Unauthorized access is strictly prohibited.<br/>Demonstration interface &#x2014; no real authentication or IP logging.</div></div></div>

</asp:Content>
