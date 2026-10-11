# CampusForum (ASP.NET Web Forms, .NET Framework 4.8)

This is now a **complete Visual Studio solution package**. The ZIP includes `CampusForum.sln`, `CampusForum/CampusForum.csproj`, the Web Forms pages, CSS, JavaScript and Figma-extracted images.

## Run

1. Extract the entire ZIP to a location such as `Documents/CampusForum_Project`.
2. Open **`CampusForum.sln`** in Visual Studio 2022 (purple app) via File > Open > Project/Solution.
3. If prompted to install components, install **ASP.NET and web development** and **.NET Framework 4.8 targeting pack**.
4. In Solution Explorer, right-click the `CampusForum` project and select **Set as Startup Project**.
5. Right-click `Default.aspx` > **Set as Start Page**.
6. Press **F5**. Choose **IIS Express** if Visual Studio offers an option.

Do not choose or run `CampusForum.dll`: a web application library must be hosted by IIS Express.

## Where the files are

- `Default.aspx`: welcome and demo student login
- `Site.Master`: shared navigation
- `Student/`: student pages
- `Admin/`: admin pages
- `Common/`: placeholder links for missing PDF designs
- `Content/site.css`: main website styling
- `Scripts/site.js`: simple demo interactions
- `images/`: eight images extracted from the PDF

## Limitations

This package implements UI and page navigation. Login is not secure and does not verify users. Forms don't save to a database. Figma pixel perfection and compilation must be checked on a Windows machine with the .NET Framework web development tools installed; the ZIP was structurally verified here but cannot be compiled in this environment.
