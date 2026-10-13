# CampusForum - One-Click Database Setup

## Run on Windows

1. Extract this folder (keep the three files together).
2. **Double-click `RUN_DATABASE.bat`.**
3. Wait for the final **SUCCESS: CampusForumDB is ready** message.

The launcher looks for a local SQL Server instance, connects with Windows Authentication, creates the `CampusForumDB` database, creates the 19 tables and inserts sample data. It can be run again without intentionally deleting any existing data.

### Requirements

- An installed and running **Microsoft SQL Server** instance (for example, SQL Server Express or LocalDB).
- Windows Authentication access with permission to create a database and its tables.
- Windows PowerShell (built into Windows).

If the launcher cannot find SQL Server or lacks permissions, it displays an error rather than reporting success. Visual Studio by itself does not necessarily include SQL Server.

**Alternative:** Open `database.sql` in SQL Server Management Studio (SSMS), connect to SQL Server and press **F5** once.

**Scope:** This sets up the database only. The existing CampusForum ASP.NET Web Forms pages still use their demo content until database access is implemented in C#.
