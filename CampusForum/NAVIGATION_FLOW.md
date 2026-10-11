# CampusForum navigation map

## Guest / student

- `/Default.aspx` Welcome page -> **Sign In** -> `/Student/Feed` (navigational demo, not credential authentication).
- Welcome page -> **Department Communities** -> `/Common/Departments` (missing-screen placeholder).
- Welcome page -> **Project Collaboration** -> `/Student/ProjectHub`.
- Welcome page -> **Campus Events** -> `/Student/Events`.
- Student header/side menu -> Feed, Departments, Events, Project Hub, Clubs, Messages, Profile, Saved, Report.
- Feed -> **Save/Like** toggles on page; **Post** adds a visible temporary post; club and event links open their respective screens.
- Profile -> **Follow** toggles; Projects -> Project Hub; Saved -> placeholder.
- Project Hub -> **My Requests & Applications** -> Applications. **Message** -> Messages. **Apply** toggles on page.
- Applications -> **Accept/Decline** demo messages; **Back to Project Hub** -> Project Hub.
- Messages -> **Send** inserts a temporary message bubble.
- Clubs Directory -> **View Details** -> Robotics Club Details; **Join Club** toggles.
- Club Details -> **Message Board** -> Messages; **Join Club** toggles.
- Events Discovery -> **Annual Tech Hackathon / Register** -> Event Details.
- Event Details -> **REGISTER TEAM NOW** toggles; **Post Reply** is a demo form.
- Report Panel -> **Submit Content Report / Submit User Flag** show demo confirmation only.

## Administrator

- `/Admin/Login` -> **AUTHENTICATE** -> `/Admin/Dashboard` (navigation-only demo; no authentication).
- Admin sidebar: Dashboard, Students, Faculty, Departments, Moderation, Broadcast.
- Dashboard -> **VIEW** logs -> Students or Moderation according to the item.
- Students -> **Search / Bulk Actions / Edit / Export CSV** demo controls.
- Faculty -> clicking a faculty name or **Edit** -> `/Admin/EditFaculty`.
- Edit Faculty -> **Cancel** -> Faculty; **Save Changes/Update Profile** demo form.
- Departments -> clicking a department name or **View** -> `/Admin/DepartmentDetails`.
- Department Details -> **Manage All** -> Faculty; **Investigate** -> Moderation; **Edit faculty** -> Edit Faculty.
- Moderation -> **Approve / Delete / Warn** demo controls (no real effect).
- Broadcast -> **Execute Broadcast / Save Draft** demo controls (no real transmissions).
- **Logout** -> `/Default.aspx`.

## Before making this a real college website

Add real role-based authentication and authorization, persistent database tables, secure data validation, file upload handling, and permissions checks. Do not deploy this demonstration as a real admin interface.

Note: All normal routes end in `.aspx` in the ASP.NET Framework version.
