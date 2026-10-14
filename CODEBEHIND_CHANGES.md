# CampusForum code-behind separation

Each of the 24 `.aspx` pages now has a corresponding `.aspx.cs` file, for example:

- `Default.aspx` -> `Default.aspx.cs`
- `Student/Feed.aspx` -> `Student/Feed.aspx.cs`
- `Admin/Login.aspx` -> `Admin/Login.aspx.cs`
- `Common/Search.aspx` -> `Common/Search.aspx.cs`

The master page also has a separate `Site.Master.cs`. Each .aspx directive links its
C# class using `CodeBehind` and `Inherits`, and all 25 code-behind files are included
in `CampusForum.csproj` as Compile items.

All original page HTML content, HTML5 form validation attributes (`required`,
`type="email"`, etc.), styles, navigation, JavaScript demo interactions,
images and SQL script are preserved. The project has **not** been converted to
real database-backed authentication or saving, and the empty Page_Load methods
are ready for future server-side logic.

The original project references to the missing `App_Data/Database1.mdf` and
`Database1_log.ldf` were removed from the project file. These files were not
in the supplied archive; this does not modify `database.sql`.

To open: `CampusForum.sln` in Visual Studio 2022 with ASP.NET and web development
and the .NET Framework 4.8 targeting pack installed. .NET Framework Web Forms
cannot be tested via a Linux-only .NET Core SDK; compile and run on Windows
using IIS Express.
