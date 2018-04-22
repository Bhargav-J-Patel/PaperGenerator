using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    SqlInstitute cn = new SqlInstitute();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            try
            {

               
            }
            catch (Exception ex)
            {

            }
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            ds = cn.RunSql("usp_GetLogin '1','" + txtusername.Text + "','" + txtpassword.Text + "'", "select");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Cookies["compid"].Value = ds.Tables[0].Rows[0]["cCompany_ID"].ToString();
                Response.Cookies["compname"].Value = ds.Tables[0].Rows[0]["cCompName"].ToString();
                Response.Cookies["loginid"].Value = ds.Tables[0].Rows[0]["cLogin_ID"].ToString();
                Response.Cookies["cname"].Value = ds.Tables[0].Rows[0]["cname"].ToString();
                Response.Redirect("Home.aspx");
            }
        }
        catch (Exception ex)
        {

        }
    }
}