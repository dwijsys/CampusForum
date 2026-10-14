<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Broadcast Management" CodeBehind="Broadcast.aspx.cs" Inherits="CampusForum.Admin.Broadcast" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="stack">
        <div class="section-heading">
            <div>
                <h1>System Broadcast Management</h1>
                <p class="muted">Utility for global institutional announcements and critical alerts.</p>
            </div>
            <div class="actions">
                <button type="button" data-demo="Refreshed sample broadcasts.">&#x27F3; REFRESH LIST</button>
                <button type="button" class="primary" data-demo="Draft saving requires a database.">SAVE DRAFT</button></div>
        </div>
        <div class="cols" style="grid-template-columns: minmax(0,1fr) 335px">
            <section class="panel">
                <h3>COMPOSE NEW BROADCAST</h3>
                <hr class="subtle-rule" />
                <div class="form-section">
                    <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="Broadcast" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field">
                        <label>BROADCAST TITLE</label><asp:TextBox ID="txtBroadcastTitle" runat="server" placeholder="Enter concise alert heading..." MaxLength="160" /><asp:RequiredFieldValidator ID="rfvTxtBroadcastTitle" runat="server" ControlToValidate="txtBroadcastTitle" ValidationGroup="Broadcast" ErrorMessage="Broadcast title is required." Text="Broadcast title is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="field">
                        <label>MESSAGE BODY (RICH TEXT)</label><div class="soft" style="padding: 6px; border: 1px solid #ddd">B &nbsp; I &nbsp; &#x2261; &nbsp; &#x2197;</div>
                        <asp:TextBox ID="txtBroadcastMessage" runat="server" TextMode="MultiLine" Text="" placeholder="Type message content here..." Style="min-height: 180px" /><asp:RequiredFieldValidator ID="rfvTxtBroadcastMessage" runat="server" ControlToValidate="txtBroadcastMessage" ValidationGroup="Broadcast" ErrorMessage="Message body is required." Text="Message body is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <div class="two-cols">
                        <div class="panel">
                            <h3>TARGETING</h3>
                            <div class="field">
                                <label>AUDIENCE</label><asp:DropDownList ID="ddlAudience" runat="server">
                                    <asp:ListItem Value="Global (All Users)">Global (All Users)</asp:ListItem>
                                    <asp:ListItem Value="Faculty Only">Faculty Only</asp:ListItem>
                                    <asp:ListItem Value="Students Only">Students Only</asp:ListItem>
                                </asp:DropDownList></div>
                            <div class="field">
                                <label>PRIORITY LEVEL</label><label><input type="radio" name="priority" checked />
                                    Low</label>
                                <label>
                                    <input type="radio" name="priority" />
                                    Normal</label>
                                <label>
                                    <input type="radio" name="priority" />
                                    Urgent</label></div>
                        </div>
                        <div class="panel">
                            <h3>SCHEDULING</h3>
                            <div class="field">
                                <label>SEND DATE / TIME</label><asp:TextBox ID="txtSendDate" runat="server" TextMode="DateTimeLocal" /></div>
                            <div class="field">
                                <label>EXPIRY DATE / TIME</label><asp:TextBox ID="txtExpiryDate" runat="server" TextMode="DateTimeLocal" /><asp:CustomValidator ID="cvBroadcastSchedule" runat="server" ValidationGroup="Broadcast" OnServerValidate="ValidateSchedule" ErrorMessage="Use valid dates; expiry must be after the send time." Text="Use valid dates; expiry must be after the send time." CssClass="validation-message" Display="Dynamic" EnableClientScript="false" /></div>
                        </div>
                    </div>
                    <div class="actions" style="justify-content: end; margin-top: 15px">
                        <asp:Button ID="btnBroadcast" runat="server" Text="EXECUTE BROADCAST" ValidationGroup="Broadcast" OnClick="Broadcast_Click" CssClass="primary" /></div>
                    <asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" />
                </div>
            </section>
            <aside class="panel no-pad">
                <div class="panel-header">END-USER PREVIEW (STUDENT DASHBOARD)</div>
                <div class="panel-body">
                    <div style="background: #244780; color: #fff; padding: 14px">Campus Student Hub</div>
                    <div class="alert" style="margin-top: 20px"><b>URGENT: SERVER MAINTENANCE NOTICE</b><p>The Central Library servers will be offline for emergency maintenance starting at 10:00 PM tonight. Please save all work in progress before this time.</p>
                    </div>
                    <div style="height: 110px; background: #f1f2f4; margin-top: 15px"></div>
                </div>
            </aside>
        </div>
        <section class="panel no-pad">
            <div class="panel-header">BROADCAST TRANSMISSION HISTORY <span><span class="badge green">Active</span> <span class="badge yellow">Scheduled</span> <span class="badge gray">Expired</span></span></div>
            <div class="table-wrap" style="border: 0">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Audience</th>
                            <th>Status</th>
                            <th>Priority</th>
                            <th>Reach (Est.)</th>
                            <th>Time Remaining</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1092</td>
                            <td>Main Library Server Downtime</td>
                            <td>All Faculty &amp; Students</td>
                            <td><span class="badge green">ACTIVE</span></td>
                            <td>URGENT</td>
                            <td>12,450 users (88%)</td>
                            <td>2 h 15 m</td>
                            <td>
                                <button type="button" class="tiny" data-demo="Editing a sent broadcast needs a backend.">Edit</button></td>
                        </tr>
                        <tr>
                            <td>1091</td>
                            <td>New Policy on Research Grants</td>
                            <td>Faculty Only</td>
                            <td><span class="badge yellow">SCHEDULED</span></td>
                            <td>Normal</td>
                            <td>420 users (0%)</td>
                            <td>T-Minus 12h</td>
                            <td>
                                <button type="button" class="tiny" data-demo="Demo only.">Edit</button></td>
                        </tr>
                        <tr>
                            <td>1089</td>
                            <td>Welcome Back Semester 2!</td>
                            <td>Global</td>
                            <td><span class="badge gray">EXPIRED</span></td>
                            <td>Low</td>
                            <td>22,000 users (99%)</td>
                            <td>&#x2014;</td>
                            <td>
                                <button type="button" class="tiny" data-demo="Clone demo.">Clone</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>

</asp:Content>
