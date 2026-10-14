<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Messages" CodeBehind="Messages.aspx.cs" Inherits="CampusForum.Student.Messages" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="chat-layout">
        <aside class="chat-list">
            <div class="panel-header">Messages</div>
            <div class="panel-body"><b>DEPARTMENTS</b></div>
            <a class="active" href="/Student/Messages.aspx">&#x2659; Computer Eng | B2024</a><a href="/Student/Messages.aspx">&#x2659; Physics Dept.</a><div class="panel-body"><b>PROJECTS</b></div>
            <a href="/Student/Messages.aspx">&#x25A3; Campus Map Redesign <span class="badge">3</span></a><div class="panel-body"><b>CLUBS</b></div>
            <a href="/Student/Messages.aspx">&#x2667; Robotics Club</a><a href="/Student/Messages.aspx">&#x2667; Debate Society</a><div class="panel-body"><b>DIRECT MESSAGES</b></div>
            <a href="/Student/Messages.aspx">&#x25C9; Sara Gupta</a><a href="/Student/Messages.aspx">&#x25C9; Marcus Gupta</a></aside>
        <section class="chat-main">
            <div class="panel-header"><span>&#x2659; Computer Engineering | Batch 2024
                <br />
                <small>142 Members &#x2022; 12 Online</small></span><span>&#x2691; &nbsp;&#x2315; &nbsp;&#x22EE;</span></div>
            <div id="chat-messages" class="chat-messages">
                <asp:Literal ID="litNewMessages" runat="server" /><p class="muted" style="text-align: center">Today, October 24th</p>
                <div class="bubble"><b>Prof. Mahesh</b> <small>09:15 AM</small><p>Reminder: The mid-term project proposals are due this Friday. Please ensure you submit them via the department portal before 5 PM. No late submissions will be accepted unless previously discussed.</p>
                </div>
                <div class="bubble"><b>Mukesh Gupta</b> <small>09:42 AM</small><p>Has anyone finalized their circuit diagrams for the proposal? I'm having trouble with the power supply section.</p>
                    <span class="pill">&#x1F4C4; Draft_Circuit_V2.pdf &#xB7; 1.2 MB</span></div>
                <div class="bubble me"><b>You</b> <small>10:05 AM</small><p>I can help with that, Marcus. Check the reference schematic in Chapter 4 of the textbook. I used a simple LM317 setup for mine and it worked perfectly.</p>
                </div>
            </div>
            <div class="chat-compose" id="chat-form">
                <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="ChatMessage" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                <div class="field">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Text="" placeholder="Type a message to Computer Engineering | Batch 2024..." aria-label="Write message" /><asp:RequiredFieldValidator ID="rfvTxtMessage" runat="server" ControlToValidate="txtMessage" ValidationGroup="ChatMessage" ErrorMessage="Message is required." Text="Message is required." CssClass="validation-message" Display="Dynamic" /></div>
                <div class="row between"><small>Press Enter to send (demo)</small><asp:Button ID="btnSendMessage" runat="server" Text="Send ➜" ValidationGroup="ChatMessage" OnClick="SendMessage_Click" CssClass="primary" /></div>
                <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
        </section>
    </div>

</asp:Content>
