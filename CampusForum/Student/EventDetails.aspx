<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Annual Hackathon" CodeBehind="EventDetails.aspx.cs" Inherits="CampusForum.Student.EventDetails" %>

<asp:Content ID="PageContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="cols">
        <div class="stack">
            <img src="/images/hackathon_auditorium.jpg" alt="Students attending a hackathon" class="cover" style="height: 240px" />
            <section class="panel"><small>TECHNOLOGY / COMPETITION</small><h1>Annual Inter-College Hackathon</h1>
                <p>Hosted by the Computer Science Department &amp; Turing Club</p>
                <div class="actions">
                    <button type="button" data-demo="Share link demo">Share</button>
                    <button type="button" data-toggle data-on="&#x2713; Saved" data-off="Save">Save</button></div>
            </section>
            <section class="panel">
                <h2>Event Overview</h2>
                <p>Get ready for 48 hours of intense coding, collaboration, and innovation. The Annual Inter-College Hackathon returns, challenging student teams to build solutions addressing real-world campus problems.</p>
                <p>This year's theme is <b>&#x201C;Smart Campus.&#x201D;</b> Participants are encouraged to leverage IoT, AI, and mobile technologies to create applications that improve student life.</p>
                <div class="soft" style="padding: 14px"><b>Prerequisites:</b><ul>
                    <li>Teams of 2-4 currently enrolled undergraduate students.</li>
                    <li>Basic proficiency in at least one modern programming language.</li>
                    <li>Bring your own laptop and necessary hardware components.</li>
                </ul>
                </div>
            </section>
            <section class="panel no-pad">
                <div class="panel-header">Event Schedule</div>
                <div class="table-wrap" style="border: 0">
                    <table>
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Activity</th>
                                <th>Location / Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Friday, 5:00 PM</td>
                                <td>Registration &amp; Kickoff</td>
                                <td>Main Auditorium - Opening remarks</td>
                            </tr>
                            <tr>
                                <td>Friday, 7:00 PM</td>
                                <td>Hacking Begins</td>
                                <td>CS Labs (Rooms 301-305)</td>
                            </tr>
                            <tr>
                                <td>Saturday, 12:00 PM</td>
                                <td>Mentorship Sessions</td>
                                <td>Student Lounge</td>
                            </tr>
                            <tr>
                                <td>Sunday, 3:00 PM</td>
                                <td>Project Submissions</td>
                                <td>Online via Devpost</td>
                            </tr>
                            <tr>
                                <td>Sunday, 5:00 PM</td>
                                <td>Demos &amp; Awards</td>
                                <td>Main Auditorium</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <section class="panel">
                <div class="section-heading">
                    <h3>Discussion (12 Posts)</h3>
                    <a href="/Student/Events.aspx">View All</a></div>
                <div class="form-section">
                    <asp:ValidationSummary ID="summary1" runat="server" ValidationGroup="Discussion" CssClass="validation-summary" HeaderText="Please correct these fields:" DisplayMode="BulletList" />
                    <div class="field">
                        <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Text="" placeholder="Ask a question or find teammates..." /><asp:RequiredFieldValidator ID="rfvTxtReply" runat="server" ControlToValidate="txtReply" ValidationGroup="Discussion" ErrorMessage="Reply is required." Text="Reply is required." CssClass="validation-message" Display="Dynamic" /></div>
                    <asp:Button ID="btnPostReply" runat="server" Text="Post Reply" ValidationGroup="Discussion" OnClick="PostReply_Click" CssClass="primary" /><asp:Label ID="lblFormStatus1" runat="server" CssClass="demo-status" EnableViewState="false" /></div>
                <hr class="subtle-rule" />
                <p><b>jay99:</b> Is hardware provided, or do we need to bring our own Arduinos/Raspberry Pis for the IoT projects?</p>
                <p><b>Organizer:</b> We have a limited supply of basic Arduino kits available on a first-come, first-served basis.</p>
            </section>
        </div>
        <aside class="stack">
            <section class="panel lightblue" style="text-align: center">
                <h3>Registration Closes In</h3>
                <div class="three-cols">
                    <div>
                        <h1>14</h1>
                        <small>DAYS</small></div>
                    <div>
                        <h1>08</h1>
                        <small>HRS</small></div>
                    <div>
                        <h1>45</h1>
                        <small>MIN</small></div>
                </div>
                <p>Spots remaining: <b>12/50 teams</b></p>
                <button type="button" class="primary wide" data-toggle data-on="&#x2713; Registered" data-off="REGISTER TEAM NOW">REGISTER TEAM NOW</button></section>
            <section class="panel">
                <h3>Event Details</h3>
                <p><b>Date</b><br />
                    Oct 27 - Oct 29, 2023</p>
                <p><b>Venue</b><br />
                    Computer Science Building, Main Auditorium &amp; Labs</p>
                <p><b>Organizer</b><br />
                    Turing Club (CS Dept)</p>
            </section>
            <section class="panel">
                <h3>Attendees &nbsp; 114</h3>
                <p class="muted">12 of your connections are attending.</p>
            </section>
        </aside>
    </div>

</asp:Content>
