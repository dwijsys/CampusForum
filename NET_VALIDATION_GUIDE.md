# CampusForum — .NET (ASP.NET Web Forms) Validation

This revision replaces HTML `required`/`type` validation for all data-entry submission forms with **ASP.NET Web Forms validation controls** in `.aspx` pages.

## What's included
- `asp:RequiredFieldValidator` (login, passwords, faculty details, broadcasts, posts, messages, reports, project requests).
- `asp:RegularExpressionValidator` (faculty email, report URL, staff ID, username).
- `asp:RangeValidator` (members needed, 1 to 99).
- `asp:CustomValidator` with `OnServerValidate` C# handlers (broadcast scheduling and image upload size/extension).
- `asp:ValidationSummary`, visible inline messages, separate validation groups for the two report forms.
- `asp:TextBox`, `asp:DropDownList`, `asp:FileUpload`, `asp:Button` with separate `*.aspx.cs` click handlers.
- Normal `.aspx.designer.cs` control declarations for the code-behind compilation model.
- One master `<form runat="server">` (ASP.NET requires this). The old inner HTML forms were converted into harmless `<div>` containers.
- Unrelated navigation buttons are explicitly `type="button"` so they don't accidentally post back.

## How validation works
Click a submit button with missing or invalid fields. A .NET validator shows an inline error and a summary. Browsers can execute Web Forms client validators for immediate messages; the validation **also runs server-side** before the C# event handler acts. On a valid submission the server handler shows a demo status or navigates to the original demo destination. Separate validation groups stop one form blocking another.

### Forms covered
- `Default.aspx`: MemberLogin
- `Admin/Login.aspx`: AdminLogin
- `Admin/Students.aspx`: StudentSearch
- `Admin/EditFaculty.aspx`: FacultyEdit
- `Admin/Broadcast.aspx`: Broadcast
- `Student/Messages.aspx`: ChatMessage
- `Student/EventDetails.aspx`: Discussion
- `Student/Feed.aspx`: PostFeed
- `Student/ProjectHub.aspx`: ProjectRequest
- `Student/Report.aspx`: ContentReport, UserFlag

## Important limitations
- This was a UI demonstration before and remains one: *sign-in does not authenticate anyone* and admin access is not secured. Validation is **not** authentication or authorization.
- Most form data is not written to a database. Feed posts and chat messages are displayed from temporary ASP.NET Session state only.
- Images are checked for file extension and size but are not uploaded or stored. Filename/size checks alone do not constitute image-content security checks.
- To test in Visual Studio 2022: open `CampusForum.sln`, make sure .NET Framework 4.8 and ASP.NET Web development tools are installed, press F5. This package could be structurally inspected here but could **not** be run under Windows IIS Express in this environment.
