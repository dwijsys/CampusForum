using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CampusForum.Admin
{
    public partial class Students : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void StudentSearch_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus1.Text = "Student search applied to this sample interface; no database is connected.";
        }

        protected void ClearStudentSearch_Click(object sender, EventArgs e)
        {
            txtSearchName.Text = "";
            txtSearchStudentId.Text = "";
            ddlSearchDepartment.SelectedIndex = 0;
            ddlSearchStatus.SelectedIndex = 0;
            lblFormStatus1.Text = "Search filters cleared.";
        }
    }
}
