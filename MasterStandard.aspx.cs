using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;

public partial class MasterStandard : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    SqlInstitute cn = new SqlInstitute();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["loginid"].Value == "")
        {
            Response.Redirect("login.aspx");
        }
        DDLMedium.Focus();
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

                ds = cn.RunSql("usp_GetComboList 'Medium','','" + Request.Cookies["compid"].Value + "'", "s");
                DDLMedium.DataSource = ds;
                DDLMedium.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    ds = cn.RunSql("usp_SearchMaster 'Standard','" + Request.QueryString["id"] + "'", "search");
                    DDLMedium.SelectedValue = ds.Tables[0].Rows[0]["cMedium_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cMedium_ID"].ToString() : "";
                    TxtStandard.Text = ds.Tables[0].Rows[0]["cStandardName"] != DBNull.Value ? ds.Tables[0].Rows[0]["cStandardName"].ToString() : "";


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
                    ds = cn.RunSql("usp_CurdStandardMaster 'U','" + Request.QueryString["id"] + "','"+ DDLMedium.SelectedValue +"',N'" + TxtStandard.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                    Session["Msg"] = "You have sucessfully Update Standard !!";
                    Response.Redirect("ListStandard.aspx");
                }
                if (Request.QueryString["D"] == "1")
                {
                    if (ddldelete.SelectedValue == "Yes")
                    {
                        ds = cn.RunSql("usp_CurdStandardMaster 'D','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "',N'" + TxtStandard.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                        Session["Msg"] = "You have sucessfully Delete Standard !!";
                        Response.Redirect("ListStandard.aspx");
                    }
                }
            }
            else
            {
                ds = cn.RunSql("usp_CurdStandardMaster 'I','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "',N'" + TxtStandard.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                Session["Msg"] = "You have sucessfully insert Standard !!";
                Response.Redirect("MasterStandard.aspx");
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
        Response.Redirect("ListStandard.aspx");
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterStandard.aspx");
    }
}