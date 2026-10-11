CAMPUSFORUM: FIX STRANGE SYMBOLS (TEXT ENCODING)

1. Stop debugging in Visual Studio (Shift+F5).
2. CLOSE Visual Studio.
3. Back up your working CampusForum project folder.
4. Extract this PATCH zip to a temporary folder.
5. Copy EVERYTHING INSIDE the extracted PATCH folder into your current
   Visual Studio CampusForum project folder -- the folder containing
   CampusForum.csproj.
6. Choose REPLACE for matching files. The patch does NOT include or touch
   your CampusForum.csproj, .sln, images or existing CSS.
7. Open the existing project in Visual Studio. Build > Rebuild Solution.
8. Run with IIS Express (F5), then press Ctrl+F5 in the browser to hard-refresh.

CAUSE: Unicode characters were being decoded/served using the wrong encoding.
FIX: Web.config specifies UTF-8 and symbols in ASPX/MASTER use safe HTML entities.
NOTE: Source codes such as &#x2302; show the correct icon in the browser.
