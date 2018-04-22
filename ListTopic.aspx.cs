using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Msg"] != null)
        {
            lblsucess.Text = Session["Msg"].ToString();
            divsucess.Visible = true;
            Session["Msg"] = null;
        }

        if (Request.Cookies["loginid"].Value == "")
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void btnaddnew_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterTopic.aspx");
    }
}