using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;

public partial class MasterQuestionHeading : System.Web.UI.Page
{
    DataSet ds, ds1 = new DataSet();
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
                    ds = cn.RunSql("usp_SearchMaster 'QuestionTypeMaster','" + Request.QueryString["id"] + "'", "search");
                    DDLMedium.SelectedValue = ds.Tables[0].Rows[0]["cMedium_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cMedium_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Standard','" + DDLMedium.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLStandard.DataSource = ds1;
                    DDLStandard.DataBind();
                    DDLStandard.SelectedValue = ds.Tables[0].Rows[0]["cStandard_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cStandard_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Subject','" + DDLStandard.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLSubject.DataSource = ds1;
                    DDLSubject.DataBind();
                    DDLSubject.SelectedValue = ds.Tables[0].Rows[0]["cSubject_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cSubject_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'QuestionType','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLQuestionType.DataSource = ds1;
                    DDLQuestionType.DataBind();
                    DDLQuestionType.SelectedValue = ds.Tables[0].Rows[0]["cSubject_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cSubject_ID"].ToString() : "";

                    TxtHeadingName.Text = ds.Tables[0].Rows[0]["cDescription"] != DBNull.Value ? ds.Tables[0].Rows[0]["cDescription"].ToString() : "";



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
            //ds.Dispose();
            //ds1.Dispose();
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
                    ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'U','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','" + DDLQuestionType.SelectedValue + "',N'" + TxtHeadingName.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                    Session["Msg"] = "You have sucessfully Update Question Heading !!";
                    Response.Redirect("ListQuestionHeading.aspx");
                }
                if (Request.QueryString["D"] == "1")
                {
                    if (ddldelete.SelectedValue == "Yes")
                    {
                        ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'D','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','" + DDLQuestionType.SelectedValue + "',N'" + TxtHeadingName.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                        Session["Msg"] = "You have sucessfully Delete Question Heading !!";
                        Response.Redirect("ListQuestionHeading.aspx");
                    }
                }
            }
            else
            {
                ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'I','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','"+ DDLQuestionType.SelectedValue +"',N'" + TxtHeadingName.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
                Session["Msg"] = "You have sucessfully insert Question Heading !!";
                Response.Redirect("MasterQuestionHeading.aspx");
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
        Response.Redirect("ListQuestionHeading.aspx");
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterQuestionHeading.aspx");
    }
    protected void DDLMedium_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ds = cn.RunSql("usp_GetComboList 'Standard','" + DDLMedium.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLStandard.DataSource = ds;
            DDLStandard.DataBind();
            DDLMedium.Focus();
        }
        catch (Exception ex)
        {

        }
    }
    protected void DDLStandard_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ds = cn.RunSql("usp_GetComboList 'Subject','" + DDLStandard.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLSubject.DataSource = ds;
            DDLSubject.DataBind();
            DDLStandard.Focus();
        }
        catch (Exception ex)
        {

        }
    }
    protected void DDLSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ds = cn.RunSql("usp_GetComboList 'QuestionType','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLQuestionType.DataSource = ds;
            DDLQuestionType.DataBind();
            DDLSubject.Focus();
        }
        catch (Exception ex)
        {

        }
    }
}