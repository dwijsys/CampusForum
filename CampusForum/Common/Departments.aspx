<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Departments" CodeBehind="Departments.aspx.cs" Inherits="CampusForum.Common.Departments" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Departments</h1>
    <p class="muted">The uploaded PDF has department navigation but no separate student departments directory screen. This is a simple placeholder to keep the link working.</p>
    <section class="panel">
        <h3>Explore department activity</h3>
        <div class="actions"><a class="btn primary" href="/Student/Feed.aspx">Department Posts</a><a class="btn" href="/Student/ProjectHub.aspx">Cross-Department Projects</a><a class="btn" href="/Student/Messages.aspx">Department Chat</a></div>
    </section>

</asp:Content>
