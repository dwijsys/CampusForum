<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Help Center" CodeBehind="Help.aspx.cs" Inherits="CampusForum.Common.Help" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Help Center</h1>
    <p class="muted">The PDF contains FAQ, Help, Settings, and Privacy links but no separate screens for them.</p>
    <div class="panel">
        <h3>Quick Links</h3>
        <p><a href="/Default.aspx">Welcome / Login</a></p>
        <p><a href="/Student/Report.aspx">Report a Problem</a></p>
        <p><a href="/Admin/Login.aspx">Admin Login</a></p>
    </div>

</asp:Content>
