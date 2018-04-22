using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;

public partial class MasterMedium : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    SqlInstitute cn = new SqlInstitute();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["loginid"].Value == "")
        {
            Response.Redirect("login.aspx");
        }
        TxtMedium.Focus();
        if (Session["Msg"] != null)
        {
            lblsucess.Text = Session["Msg"].ToString();
            divsucess.Visible = true;
            Session["Msg"] = null;
        }

        try
        {
            if (IsPostBack == false)
            {
               

                if (Request.QueryString["id"] != null)
                {
                    ds = cn.RunSql("usp_SearchMaster 'Medium','" + Request.QueryString["id"] + "'", "search");
                    TxtMedium.Text = ds.Tables[0].Rows[0]["cMedium"] != DBNull.Value ? ds.Tables[0].Rows[0]["cMedium"].ToString() : "";
                    

                    if (Request.QueryString["D"] == "1")
                    {
                        ddldelete.Visible = true;
                        btnsubmit.Text = "Delete";
                    }
                   

                }
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message;
            diverror.Visible = true;
        }
        finally
        {
            ds.Dispose();
        }

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["id"] != null)
            {
                if (Request.QueryString["E"] == "1")
                {
                    ds = cn.RunSql("usp_CurdMediumMaster 'U',N'" + TxtMedium.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "','" + Request.QueryString["id"] + "'", "insert");
                    Session["Msg"] = "You have sucessfully Update Medium !!";
                    Response.Redirect("ListMedium.aspx");
                }
                if (Request.QueryString["D"] == "1")
                {
                    if (ddldelete.SelectedValue == "Yes")
                    {
                        ds = cn.RunSql("usp_CurdMediumMaster 'D',N'" + TxtMedium.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "','" + Request.QueryString["id"] + "'", "insert");
                        Session["Msg"] = "You have sucessfully Delete Medium !!";
                        Response.Redirect("ListMedium.aspx");
                    }
                }
            }
            else
            {
                ds = cn.RunSql("usp_CurdMediumMaster 'I',N'" + TxtMedium.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "',''", "insert");
                Session["Msg"] = "You have sucessfully insert Medium !!";
                Response.Redirect("MasterMedium.aspx");
            }
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message;
            diverror.Visible = true;
        }
        finally
        {
            ds.Dispose();
        }
    }
    protected void btnlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListMedium.aspx");
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterMedium.aspx");
    }
}