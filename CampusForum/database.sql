/*
    CAMPUSFORUM - DATABASE SETUP
    For Microsoft SQL Server / SQL Server Management Studio (SSMS)

    HOW TO RUN:
    1. Connect to your SQL Server in SSMS.
    2. Open this database.sql file.
    3. Press Execute (F5) once. The whole database will be created.

    Safe to run again: tables and demo records are only added if missing.
    This creates the database ONLY. Existing ASP.NET pages will continue
    showing their built-in demo data until C# database code is added.
*/

USE [master];
GO
IF DB_ID(N'CampusForumDB') IS NULL
BEGIN
    CREATE DATABASE [CampusForumDB];
    PRINT 'Created database CampusForumDB';
END;
GO
USE [CampusForumDB];
GO

-- 1. Departments used by students, faculty, posts and projects
IF OBJECT_ID(N'dbo.Departments', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Departments (
        DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
        DepartmentName NVARCHAR(100) NOT NULL UNIQUE,
        HeadOfDepartment NVARCHAR(100) NULL,
        Status NVARCHAR(20) NOT NULL DEFAULT N'Active'
    );
END;
GO

-- 2. One users table for students, faculty and administrators
-- PasswordHash is intentionally NULL in sample data. Never store plaintext passwords.
IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Users (
        UserID INT IDENTITY(1,1) PRIMARY KEY,
        UserCode NVARCHAR(30) NOT NULL UNIQUE,
        FullName NVARCHAR(100) NOT NULL,
        Email NVARCHAR(150) NOT NULL UNIQUE,
        PasswordHash NVARCHAR(255) NULL,
        UserRole NVARCHAR(20) NOT NULL CHECK (UserRole IN (N'Student', N'Faculty', N'Admin')),
        DepartmentID INT NULL REFERENCES dbo.Departments(DepartmentID),
        Semester INT NULL,
        Designation NVARCHAR(100) NULL,
        Bio NVARCHAR(MAX) NULL,
        ProfileImage NVARCHAR(255) NULL,
        Status NVARCHAR(20) NOT NULL DEFAULT N'Active',
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- 3. Follow button on student profile
IF OBJECT_ID(N'dbo.UserFollows', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.UserFollows (
        FollowerID INT NOT NULL REFERENCES dbo.Users(UserID),
        FollowingID INT NOT NULL REFERENCES dbo.Users(UserID),
        FollowedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (FollowerID, FollowingID),
        CHECK (FollowerID <> FollowingID)
    );
END;
GO

-- 4. Academic qualifications on Edit Faculty screen
IF OBJECT_ID(N'dbo.FacultyCredentials', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.FacultyCredentials (
        CredentialID INT IDENTITY(1,1) PRIMARY KEY,
        FacultyID INT NOT NULL REFERENCES dbo.Users(UserID),
        Degree NVARCHAR(100) NOT NULL,
        Institution NVARCHAR(150) NULL,
        CompletionYear INT NULL
    );
END;
GO

-- 5. Clubs Directory and Club Details
IF OBJECT_ID(N'dbo.Clubs', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Clubs (
        ClubID INT IDENTITY(1,1) PRIMARY KEY,
        ClubName NVARCHAR(100) NOT NULL UNIQUE,
        Category NVARCHAR(50) NOT NULL,
        Description NVARCHAR(1000) NULL,
        MeetingPlace NVARCHAR(120) NULL,
        CreatedBy INT NULL REFERENCES dbo.Users(UserID),
        Status NVARCHAR(20) NOT NULL DEFAULT N'Active'
    );
END;
GO

-- 6. Join Club button
IF OBJECT_ID(N'dbo.ClubMembers', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ClubMembers (
        ClubID INT NOT NULL REFERENCES dbo.Clubs(ClubID),
        UserID INT NOT NULL REFERENCES dbo.Users(UserID),
        MemberRole NVARCHAR(30) NOT NULL DEFAULT N'Member',
        JoinedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (ClubID, UserID)
    );
END;
GO

-- 7. Home Feed posts; optionally associated with department or club
IF OBJECT_ID(N'dbo.Posts', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Posts (
        PostID INT IDENTITY(1,1) PRIMARY KEY,
        AuthorID INT NOT NULL REFERENCES dbo.Users(UserID),
        DepartmentID INT NULL REFERENCES dbo.Departments(DepartmentID),
        ClubID INT NULL REFERENCES dbo.Clubs(ClubID),
        Title NVARCHAR(150) NULL,
        Content NVARCHAR(MAX) NOT NULL,
        AttachmentPath NVARCHAR(255) NULL,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        Status NVARCHAR(20) NOT NULL DEFAULT N'Visible'
    );
END;
GO

-- 8. Comments on feed posts
IF OBJECT_ID(N'dbo.Comments', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Comments (
        CommentID INT IDENTITY(1,1) PRIMARY KEY,
        PostID INT NOT NULL REFERENCES dbo.Posts(PostID),
        AuthorID INT NOT NULL REFERENCES dbo.Users(UserID),
        CommentText NVARCHAR(2000) NOT NULL,
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- 9. Like button (one like per user per post)
IF OBJECT_ID(N'dbo.PostLikes', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.PostLikes (
        PostID INT NOT NULL REFERENCES dbo.Posts(PostID),
        UserID INT NOT NULL REFERENCES dbo.Users(UserID),
        LikedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (PostID, UserID)
    );
END;
GO

-- 10. Saved posts
IF OBJECT_ID(N'dbo.SavedPosts', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.SavedPosts (
        PostID INT NOT NULL REFERENCES dbo.Posts(PostID),
        UserID INT NOT NULL REFERENCES dbo.Users(UserID),
        SavedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (PostID, UserID)
    );
END;
GO

-- 11. Project Hub collaboration requests
IF OBJECT_ID(N'dbo.Projects', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Projects (
        ProjectID INT IDENTITY(1,1) PRIMARY KEY,
        ProjectTitle NVARCHAR(150) NOT NULL,
        OwnerID INT NOT NULL REFERENCES dbo.Users(UserID),
        PrimaryDepartmentID INT NULL REFERENCES dbo.Departments(DepartmentID),
        TargetDepartmentID INT NULL REFERENCES dbo.Departments(DepartmentID),
        Description NVARCHAR(MAX) NULL,
        SkillsRequired NVARCHAR(500) NULL,
        MembersNeeded INT NOT NULL DEFAULT 1 CHECK (MembersNeeded >= 1),
        Duration NVARCHAR(50) NULL,
        Status NVARCHAR(25) NOT NULL DEFAULT N'Open',
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- 12. Apply / Withdraw / Accept project applications
IF OBJECT_ID(N'dbo.ProjectApplications', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ProjectApplications (
        ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
        ProjectID INT NOT NULL REFERENCES dbo.Projects(ProjectID),
        ApplicantID INT NOT NULL REFERENCES dbo.Users(UserID),
        Message NVARCHAR(1000) NULL,
        Status NVARCHAR(20) NOT NULL DEFAULT N'Pending',
        AppliedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        CONSTRAINT UQ_ProjectApplications UNIQUE (ProjectID, ApplicantID)
    );
END;
GO

-- 13. Events Discovery and Event Details
IF OBJECT_ID(N'dbo.Events', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Events (
        EventID INT IDENTITY(1,1) PRIMARY KEY,
        EventTitle NVARCHAR(150) NOT NULL,
        Category NVARCHAR(50) NOT NULL,
        Description NVARCHAR(MAX) NULL,
        Venue NVARCHAR(150) NULL,
        StartDate DATETIME2 NOT NULL,
        EndDate DATETIME2 NULL,
        OrganizerID INT NULL REFERENCES dbo.Users(UserID),
        ClubID INT NULL REFERENCES dbo.Clubs(ClubID),
        Status NVARCHAR(20) NOT NULL DEFAULT N'Open'
    );
END;
GO

-- 14. Register / Interested buttons on events
IF OBJECT_ID(N'dbo.EventRegistrations', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.EventRegistrations (
        EventID INT NOT NULL REFERENCES dbo.Events(EventID),
        UserID INT NOT NULL REFERENCES dbo.Users(UserID),
        RegistrationStatus NVARCHAR(20) NOT NULL DEFAULT N'Registered',
        RegisteredAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (EventID, UserID)
    );
END;
GO

-- 15. Chat rooms for departments, clubs, projects or direct messages
IF OBJECT_ID(N'dbo.Conversations', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Conversations (
        ConversationID INT IDENTITY(1,1) PRIMARY KEY,
        ConversationName NVARCHAR(150) NOT NULL,
        ConversationType NVARCHAR(20) NOT NULL DEFAULT N'Department',
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- 16. Users who belong to each chat
IF OBJECT_ID(N'dbo.ConversationMembers', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ConversationMembers (
        ConversationID INT NOT NULL REFERENCES dbo.Conversations(ConversationID),
        UserID INT NOT NULL REFERENCES dbo.Users(UserID),
        JoinedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        PRIMARY KEY (ConversationID, UserID)
    );
END;
GO

-- 17. Chat messages and optional attachments
IF OBJECT_ID(N'dbo.Messages', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Messages (
        MessageID INT IDENTITY(1,1) PRIMARY KEY,
        ConversationID INT NOT NULL REFERENCES dbo.Conversations(ConversationID),
        SenderID INT NOT NULL REFERENCES dbo.Users(UserID),
        MessageText NVARCHAR(MAX) NOT NULL,
        AttachmentPath NVARCHAR(255) NULL,
        SentAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

-- 18. Student reports and Admin Moderation Queue
IF OBJECT_ID(N'dbo.Reports', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Reports (
        ReportID INT IDENTITY(1,1) PRIMARY KEY,
        ReportedBy INT NOT NULL REFERENCES dbo.Users(UserID),
        PostID INT NULL REFERENCES dbo.Posts(PostID),
        CommentID INT NULL REFERENCES dbo.Comments(CommentID),
        ReportedUserID INT NULL REFERENCES dbo.Users(UserID),
        Category NVARCHAR(60) NOT NULL,
        ContentLink NVARCHAR(500) NULL,
        Description NVARCHAR(MAX) NOT NULL,
        EvidencePath NVARCHAR(255) NULL,
        Status NVARCHAR(25) NOT NULL DEFAULT N'Pending',
        ReviewedBy INT NULL REFERENCES dbo.Users(UserID),
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        ReviewedAt DATETIME2 NULL
    );
END;
GO

-- 19. Admin Broadcast Management
IF OBJECT_ID(N'dbo.Broadcasts', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Broadcasts (
        BroadcastID INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(150) NOT NULL,
        MessageBody NVARCHAR(MAX) NOT NULL,
        Audience NVARCHAR(50) NOT NULL DEFAULT N'All Users',
        Priority NVARCHAR(20) NOT NULL DEFAULT N'Normal',
        Status NVARCHAR(20) NOT NULL DEFAULT N'Draft',
        SendAt DATETIME2 NULL,
        ExpireAt DATETIME2 NULL,
        CreatedBy INT NOT NULL REFERENCES dbo.Users(UserID),
        CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
    );
END;
GO

/* SAMPLE DATA
   Small set of sample records based on the Figma screen content.
   Inserts are repeatable, without duplicating records on a second run.
   No usable login credentials or passwords are inserted.
*/

-- Departments
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Computer Science')
    INSERT dbo.Departments (DepartmentName, HeadOfDepartment) VALUES (N'Computer Science', N'Dr. Ayan Mehra');
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Computer Engineering')
    INSERT dbo.Departments (DepartmentName) VALUES (N'Computer Engineering');
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Engineering')
    INSERT dbo.Departments (DepartmentName) VALUES (N'Engineering');
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Business Administration')
    INSERT dbo.Departments (DepartmentName) VALUES (N'Business Administration');
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Arts & Humanities')
    INSERT dbo.Departments (DepartmentName) VALUES (N'Arts & Humanities');
IF NOT EXISTS (SELECT 1 FROM dbo.Departments WHERE DepartmentName = N'Physics')
    INSERT dbo.Departments (DepartmentName) VALUES (N'Physics');
GO

-- Student, faculty and admin examples (sample email addresses are not real accounts)
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'CS-2023-0142')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Semester)
    VALUES (N'CS-2023-0142',N'Akhil T.',N'akhil@example.com',N'Student',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Computer Science'),3);
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'ENG-2022-0089')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Semester)
    VALUES (N'ENG-2022-0089',N'Mukesh Gupta',N'mukesh@example.com',N'Student',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Engineering'),5);
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'BUS-2021-0301')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Semester,Bio,ProfileImage,Status)
    VALUES (N'BUS-2021-0301',N'Sarina Wangchuk',N'sarina@example.com',N'Student',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Business Administration'),6,N'Passionate about machine learning and open source.',N'images/sarina_profile.jpg',N'Active');
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'ART-2024-0012')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Semester,Status)
    VALUES (N'ART-2024-0012',N'Dhaval Kothari',N'dhaval@example.com',N'Student',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Arts & Humanities'),1,N'Pending');
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'CS-2022-0211')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Semester)
    VALUES (N'CS-2022-0211',N'Geeta Patel',N'geeta@example.com',N'Student',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Computer Science'),5);
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'FAC-PHY-001')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Designation)
    VALUES (N'FAC-PHY-001',N'Prof. Hansal Mehta',N'hansal@example.com',N'Faculty',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Physics'),N'Professor');
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'FAC-CS-001')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole,DepartmentID,Designation)
    VALUES (N'FAC-CS-001',N'Dr. Heli Shah',N'heli@example.com',N'Faculty',(SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Computer Science'),N'Senior Professor');
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE UserCode=N'ADMIN-001')
    INSERT dbo.Users (UserCode,FullName,Email,UserRole)
    VALUES (N'ADMIN-001',N'Campus Administrator',N'admin@example.com',N'Admin');
GO

-- Faculty qualification (example from Edit Faculty design)
IF NOT EXISTS (SELECT 1 FROM dbo.FacultyCredentials WHERE FacultyID=(SELECT UserID FROM dbo.Users WHERE UserCode=N'FAC-CS-001') AND Degree=N'Ph.D. in Physics')
    INSERT dbo.FacultyCredentials(FacultyID,Degree,Institution,CompletionYear)
    VALUES ((SELECT UserID FROM dbo.Users WHERE UserCode=N'FAC-CS-001'),N'Ph.D. in Physics',N'Massachusetts Institute of Technology',2008);
GO

-- Clubs and membership
IF NOT EXISTS (SELECT 1 FROM dbo.Clubs WHERE ClubName=N'Robotics Club')
    INSERT dbo.Clubs (ClubName,Category,Description,MeetingPlace)
    VALUES (N'Robotics Club',N'Academic',N'Explore and build autonomous and remote-controlled robotic systems.',N'Engineering Lab 3B');
IF NOT EXISTS (SELECT 1 FROM dbo.Clubs WHERE ClubName=N'Campus Coding Society')
    INSERT dbo.Clubs (ClubName,Category,Description,MeetingPlace)
    VALUES (N'Campus Coding Society',N'Academic',N'Weekly coding challenges and hackathon preparation.',N'CS Dept Lounge');
IF NOT EXISTS (SELECT 1 FROM dbo.Clubs WHERE ClubName=N'Lumina Photography')
    INSERT dbo.Clubs (ClubName,Category,Description,MeetingPlace)
    VALUES (N'Lumina Photography',N'Arts & Culture',N'Photography workshops and campus exhibitions.',N'Arts Annex');
IF NOT EXISTS (SELECT 1 FROM dbo.ClubMembers
    WHERE ClubID=(SELECT ClubID FROM dbo.Clubs WHERE ClubName=N'Robotics Club')
      AND UserID=(SELECT UserID FROM dbo.Users WHERE UserCode=N'BUS-2021-0301'))
    INSERT dbo.ClubMembers (ClubID,UserID,MemberRole)
    VALUES ((SELECT ClubID FROM dbo.Clubs WHERE ClubName=N'Robotics Club'),(SELECT UserID FROM dbo.Users WHERE UserCode=N'BUS-2021-0301'),N'President');
GO

-- Two home feed posts
IF NOT EXISTS (SELECT 1 FROM dbo.Posts WHERE Title=N'Hackathon server architecture')
    INSERT dbo.Posts (AuthorID,DepartmentID,Title,Content,AttachmentPath)
    VALUES ((SELECT UserID FROM dbo.Users WHERE UserCode=N'BUS-2021-0301'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Computer Science'),
        N'Hackathon server architecture',
        N'Just finished setting up the new server architecture for the upcoming hackathon. Looks solid!',
        N'images/server_room.jpg');
IF NOT EXISTS (SELECT 1 FROM dbo.Posts WHERE Title=N'Thermodynamics Week 4 Notes')
    INSERT dbo.Posts (AuthorID,DepartmentID,Title,Content)
    VALUES ((SELECT UserID FROM dbo.Users WHERE UserCode=N'FAC-PHY-001'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Physics'),
        N'Thermodynamics Week 4 Notes',
        N'Here are the lecture notes for Thermodynamics Week 4. Please review before the lab.');
GO

-- Example comment on first post
IF NOT EXISTS (SELECT 1 FROM dbo.Comments WHERE CommentText=N'Great work on the server setup!')
    INSERT dbo.Comments (PostID,AuthorID,CommentText)
    VALUES ((SELECT TOP (1) PostID FROM dbo.Posts WHERE Title=N'Hackathon server architecture'),
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'),N'Great work on the server setup!');
GO

-- Project Hub collaborations
IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ProjectTitle=N'Robotics Arm Automation')
    INSERT dbo.Projects (ProjectTitle,OwnerID,PrimaryDepartmentID,TargetDepartmentID,Description,SkillsRequired,MembersNeeded,Duration)
    VALUES (N'Robotics Arm Automation',(SELECT UserID FROM dbo.Users WHERE UserCode=N'ENG-2022-0089'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Computer Engineering'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Engineering'),
        N'Looking for a mechanical engineering student to help design and 3D print the chassis for a robotic arm.',
        N'CAD, 3D Printing, SolidWorks',2,N'1 Semester');
IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ProjectTitle=N'Startup Pitch Deck Design')
    INSERT dbo.Projects (ProjectTitle,OwnerID,PrimaryDepartmentID,TargetDepartmentID,Description,SkillsRequired,MembersNeeded,Duration)
    VALUES (N'Startup Pitch Deck Design',(SELECT UserID FROM dbo.Users WHERE UserCode=N'BUS-2021-0301'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Business Administration'),
        (SELECT DepartmentID FROM dbo.Departments WHERE DepartmentName=N'Arts & Humanities'),
        N'Need a graphic designer to help our pitch deck look professional.',
        N'Figma, Illustrator, Presentation Design',1,N'Short Term');
GO
IF NOT EXISTS (SELECT 1 FROM dbo.ProjectApplications
    WHERE ProjectID=(SELECT ProjectID FROM dbo.Projects WHERE ProjectTitle=N'Robotics Arm Automation')
      AND ApplicantID=(SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'))
    INSERT dbo.ProjectApplications (ProjectID,ApplicantID,Message)
    VALUES ((SELECT ProjectID FROM dbo.Projects WHERE ProjectTitle=N'Robotics Arm Automation'),
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'),N'I would like to collaborate on this project.');
GO

-- Event dates are illustrative demo data, not upcoming live event schedules
IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE EventTitle=N'Annual Tech Hackathon 2024')
    INSERT dbo.Events (EventTitle,Category,Description,Venue,StartDate,EndDate,OrganizerID)
    VALUES (N'Annual Tech Hackathon 2024',N'Hackathons',N'48-hour coding marathon for campus teams.',
        N'CS Building, Main Hall','2024-10-24T09:00:00','2024-10-26T17:00:00',
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'FAC-CS-001'));
IF NOT EXISTS (SELECT 1 FROM dbo.Events WHERE EventTitle=N'Guest Lecture: Future of AI')
    INSERT dbo.Events (EventTitle,Category,Description,Venue,StartDate,EndDate,OrganizerID)
    VALUES (N'Guest Lecture: Future of AI',N'Seminars',N'Discussion about the future and ethics of AI.',
        N'Auditorium A','2024-11-02T14:00:00','2024-11-02T15:30:00',
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'FAC-CS-001'));
GO
IF NOT EXISTS (SELECT 1 FROM dbo.EventRegistrations
    WHERE EventID=(SELECT EventID FROM dbo.Events WHERE EventTitle=N'Annual Tech Hackathon 2024')
      AND UserID=(SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'))
    INSERT dbo.EventRegistrations (EventID,UserID)
    VALUES ((SELECT EventID FROM dbo.Events WHERE EventTitle=N'Annual Tech Hackathon 2024'),
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'));
GO

-- Department chat example
IF NOT EXISTS (SELECT 1 FROM dbo.Conversations WHERE ConversationName=N'Computer Engineering | Batch 2024')
    INSERT dbo.Conversations (ConversationName,ConversationType)
    VALUES (N'Computer Engineering | Batch 2024',N'Department');
GO
IF NOT EXISTS (SELECT 1 FROM dbo.ConversationMembers
    WHERE ConversationID=(SELECT ConversationID FROM dbo.Conversations WHERE ConversationName=N'Computer Engineering | Batch 2024')
      AND UserID=(SELECT UserID FROM dbo.Users WHERE UserCode=N'ENG-2022-0089'))
    INSERT dbo.ConversationMembers (ConversationID,UserID)
    VALUES ((SELECT ConversationID FROM dbo.Conversations WHERE ConversationName=N'Computer Engineering | Batch 2024'),
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'ENG-2022-0089'));
IF NOT EXISTS (SELECT 1 FROM dbo.Messages WHERE MessageText=N'Has anyone finalized their circuit diagrams for the proposal?')
    INSERT dbo.Messages (ConversationID,SenderID,MessageText)
    VALUES ((SELECT ConversationID FROM dbo.Conversations WHERE ConversationName=N'Computer Engineering | Batch 2024'),
        (SELECT UserID FROM dbo.Users WHERE UserCode=N'ENG-2022-0089'),
        N'Has anyone finalized their circuit diagrams for the proposal?');
GO

-- Report Panel / Moderation example
IF NOT EXISTS (SELECT 1 FROM dbo.Reports WHERE Description=N'Sample report: spam posted in the student community.')
    INSERT dbo.Reports (ReportedBy,Category,Description,Status)
    VALUES ((SELECT UserID FROM dbo.Users WHERE UserCode=N'CS-2023-0142'),
        N'Spam Post',N'Sample report: spam posted in the student community.',N'Pending');
GO

-- Admin broadcast example
IF NOT EXISTS (SELECT 1 FROM dbo.Broadcasts WHERE Title=N'Main Library Server Downtime')
    INSERT dbo.Broadcasts (Title,MessageBody,Audience,Priority,Status,CreatedBy)
    VALUES (N'Main Library Server Downtime',
        N'The central library services will be offline for scheduled maintenance.',
        N'All Users',N'Urgent',N'Active',(SELECT UserID FROM dbo.Users WHERE UserCode=N'ADMIN-001'));
GO

-- Final check: shows all 19 tables and the number of saved records in each.
PRINT 'SUCCESS: CampusForumDB setup completed. Tables and sample data are ready.';
SELECT
    t.name AS TableName,
    SUM(p.rows) AS RecordCount
FROM sys.tables AS t
INNER JOIN sys.partitions AS p
    ON p.object_id = t.object_id AND p.index_id IN (0, 1)
WHERE t.schema_id = SCHEMA_ID(N'dbo')
GROUP BY t.name
ORDER BY t.name;
GO
