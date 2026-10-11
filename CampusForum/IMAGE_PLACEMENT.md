# Images extracted from the supplied Figma PDF

These are **actual photographic elements embedded in the user's PDF**, extracted without needing the original Figma file. The PDF also contains many flattened UI shapes; those are rendered with CSS instead of exporting unreadable black/transparent overlay images.

Place **all** these files in the existing `images/` folder. Use them in HTML as `<img src="/images/filename.jpg" ... />` or as CSS `background-image: url('/images/filename.jpg')`.

| Image filename | Original PDF page | Where it is used in this solution |
| --- | --- | --- |
| `campus_students.jpg` | 1 | Welcome/landing main hero (`Pages/Index.cshtml`) |
| `campus_cover.jpg` | 2 | Student profile banner (`Pages/Student/Profile.cshtml`) |
| `sarina_profile.jpg` | 2 | Student profile photo and Home Feed author image |
| `server_room.jpg` | 3 | First Home Feed post image |
| `robotics_lab.jpg` | 7 | First Robotics Club gallery photograph |
| `robotics_team.jpg` | 7 | Second Robotics Club gallery photograph |
| `hackathon_auditorium.jpg` | 9 | Event Details top hero image |
| `faculty_profile.jpg` | 17 | Edit Faculty portrait (cropped from the PDF-embedded element) |

**If a design reference contains an icon but there is no clean image asset**, this starter currently uses a simple Unicode symbol or CSS. Replacing these with icon assets or actual Figma exports is a good final-polish step.

**Source limitations:** PDF page 2 has a cover with a small UI edge in the original embedded image; the file is cropped to emphasize the campus. PDF page 9's event image similarly contains a little overlay, so it is cropped. This means the files are usable image assets, but not necessarily the pristine Figma source exports.
