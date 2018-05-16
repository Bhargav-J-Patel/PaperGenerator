using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PdfShown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Data"] != null)
        {
            lblDisplay.Text = Session["Data"].ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "pagedata();", true);
        }
    }
}