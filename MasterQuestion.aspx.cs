using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using App_Code;
using System.Data;
using System.Data.SqlClient;

public partial class MasterQuestion : System.Web.UI.Page
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

                ds = cn.RunSql("usp_GetComboList 'Level','','" + Request.Cookies["compid"].Value + "'", "s");
                DDLLevel.DataSource = ds;
                DDLLevel.DataBind();


                if (Request.QueryString["id"] != null)
                {
                    ds = cn.RunSql("usp_SearchMaster 'QuestionMaster','" + Request.QueryString["id"] + "'", "search");
                    DDLMedium.SelectedValue = ds.Tables[0].Rows[0]["cMedium_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cMedium_ID"].ToString() : "";
                    DDLLevel.SelectedValue = ds.Tables[0].Rows[0]["cLevel_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cLevel_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Standard','" + DDLMedium.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLStandard.DataSource = ds1;
                    DDLStandard.DataBind();
                    DDLStandard.SelectedValue = ds.Tables[0].Rows[0]["cStandard_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cStandard_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Subject','" + DDLStandard.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLSubject.DataSource = ds1;
                    DDLSubject.DataBind();
                    DDLSubject.SelectedValue = ds.Tables[0].Rows[0]["cSubject_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cSubject_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Chapter','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLChapter.DataSource = ds1;
                    DDLChapter.DataBind();
                    DDLChapter.SelectedValue = ds.Tables[0].Rows[0]["cChapter_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cChapter_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'Topic','" + DDLChapter.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLTopic.DataSource = ds1;
                    DDLTopic.DataBind();
                    DDLTopic.SelectedValue = ds.Tables[0].Rows[0]["cTopic_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cTopic_ID"].ToString() : "";


                    ds1 = cn.RunSql("usp_GetComboList 'QuestionType','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLQuestionType.DataSource = ds1;
                    DDLQuestionType.DataBind();
                    DDLQuestionType.SelectedValue = ds.Tables[0].Rows[0]["cQuestion_Type_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cQuestion_Type_ID"].ToString() : "";

                    ds1 = cn.RunSql("usp_GetComboList 'QuestionHeading','" + DDLQuestionType.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
                    DDLQuestionheading.DataSource = ds1;
                    DDLQuestionheading.DataBind();
                    DDLQuestionheading.SelectedValue= ds.Tables[0].Rows[0]["cQuestion_Heading_ID"] != DBNull.Value ? ds.Tables[0].Rows[0]["cQuestion_Heading_ID"].ToString() : "";

                    TxtQuestion.Text = ds.Tables[0].Rows[0]["cQuestion"] != DBNull.Value ? ds.Tables[0].Rows[0]["cQuestion"].ToString() : "";
                    TxtAnswerKey.Text = ds.Tables[0].Rows[0]["cAnswerKey"] != DBNull.Value ? ds.Tables[0].Rows[0]["cAnswerKey"].ToString() : "";
                    TxtHint.Text = ds.Tables[0].Rows[0]["cHint"] != DBNull.Value ? ds.Tables[0].Rows[0]["cHint"].ToString() : "";

                    // TxtHeadingName.Text = ds.Tables[0].Rows[0]["cDescription"] != DBNull.Value ? ds.Tables[0].Rows[0]["cDescription"].ToString() : "";



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
            TxtQuestion.Text = (TxtQuestion.Text.ToString().Replace(@"\[", @"\(")).ToString().Replace(@"\]", @"\)");
            TxtHint.Text = (TxtHint.Text.ToString().Replace(@"\[", @"\(")).ToString().Replace(@"\]", @"\)");
            string Type = "";
            string ID = "";
            if (Request.QueryString["id"] != null)
            {
                if (Request.QueryString["E"] == "1")
                {
                    Type = "U";
                }
                else if (Request.QueryString["D"] == "1")
                {
                    Type = "D";
                }
                ID = Request.QueryString["id"].ToString();

            }
            else
            {
                Type = "I";
                ID = "";
            }
            using (SqlConnection sqlconn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["PavanCourier"].ToString()))
            {
                using (SqlCommand cmd = new SqlCommand("usp_CurdQuestionMaster", sqlconn))
                {



                    string medium = DDLMedium.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLMedium.SelectedValue;
                    string chapter = DDLChapter.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLChapter.SelectedValue;
                    string topic = DDLTopic.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLTopic.SelectedValue;
                    string questionheading = DDLQuestionheading.SelectedValue == "00000000-0000-0000-0000-000000000000" || DDLQuestionheading.SelectedValue == "" ? null : DDLQuestionheading.SelectedValue;
                    string level = DDLLevel.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLLevel.SelectedValue;
                    string standard = DDLStandard.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLStandard.SelectedValue;
                    string subject = DDLSubject.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLSubject.SelectedValue;
                    string questiontype = DDLQuestionType.SelectedValue == "00000000-0000-0000-0000-000000000000" ? null : DDLQuestionType.SelectedValue;

                    cmd.Parameters.Add("@Type", SqlDbType.VarChar).Value = Type;
                    cmd.Parameters.Add("@cquestion_id", SqlDbType.VarChar).Value = ID;
                    cmd.Parameters.Add("@cmedium_id", SqlDbType.VarChar).Value = medium;
                    cmd.Parameters.Add("@cstandard_id", SqlDbType.VarChar).Value = standard;
                    cmd.Parameters.Add("@csubject_id", SqlDbType.VarChar).Value = subject;
                    cmd.Parameters.Add("@cchapter_id", SqlDbType.VarChar).Value = chapter;
                    if (topic != null)
                    {
                        cmd.Parameters.Add("@ctopic_id", SqlDbType.VarChar).Value = topic;
                    }

                    if (questionheading != null)
                    {
                        cmd.Parameters.Add("@cquestion_heading_id", SqlDbType.VarChar).Value = questionheading;
                    }
                    if (level != null)
                    {
                        cmd.Parameters.Add("@clevel_id", SqlDbType.VarChar).Value = level;
                    }
                    cmd.Parameters.Add("@cquestion", SqlDbType.NVarChar).Value = TxtQuestion.Text;
                    cmd.Parameters.Add("@canswerkey", SqlDbType.VarChar).Value = TxtAnswerKey.Text;
                    cmd.Parameters.Add("@chint", SqlDbType.NVarChar).Value = TxtHint.Text;
                    cmd.Parameters.Add("@ccompany_id", SqlDbType.VarChar).Value = Request.Cookies["compid"].Value.ToString();
                    cmd.Parameters.Add("@cinsetedby", SqlDbType.VarChar).Value = Request.Cookies["loginid"].Value.ToString();
                    if (questiontype != null)
                    {
                        cmd.Parameters.Add("@cQuestion_Type_ID", SqlDbType.VarChar).Value = questiontype;
                    }
                    cmd.CommandType = CommandType.StoredProcedure;
                    sqlconn.Open();
                    cmd.ExecuteNonQuery();
                    sqlconn.Close();
                }
            }
            if (Type == "I")
            {
                Session["Msg"] = "You have sucessfully Insert Record!!";
                Response.Redirect("MasterQuestion.aspx");
            }
            else if (Type == "U" || Type == "D")
            {
                Session["Msg"] = "You have sucessfully Update Record !!";
                Response.Redirect("ListMasterQuestion.aspx");
            }
            


            //if (Request.QueryString["id"] != null)
            //{
            //    if (Request.QueryString["E"] == "1")
            //    {
            //        ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'U','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','" + DDLChapter.SelectedValue + "','" + DDLTopic.Text + "','" + DDLQuestionType.SelectedValue + "','" + DDLQuestionheading.SelectedValue + "','" + DDLLevel.SelectedValue + "','" + RichTextBox.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
            //        Session["Msg"] = "You have sucessfully Update Question Heading !!";
            //        Response.Redirect("ListQuestionHeading.aspx");
            //    }
            //    if (Request.QueryString["D"] == "1")
            //    {
            //        if (ddldelete.SelectedValue == "Yes")
            //        {
            //            ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'D','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','" + DDLChapter.SelectedValue + "','" + DDLTopic.Text + "','" + DDLQuestionType.SelectedValue + "','" + DDLQuestionheading.SelectedValue + "','" + DDLLevel.SelectedValue + "','" + RichTextBox.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
            //            Session["Msg"] = "You have sucessfully Delete Question Heading !!";
            //            Response.Redirect("ListQuestionHeading.aspx");
            //        }
            //    }
            //}
            //else
            //{
            //    ds = cn.RunSql("usp_CurdTbl_Question_HeadingMaster 'I','" + Request.QueryString["id"] + "','" + DDLMedium.SelectedValue + "','" + DDLStandard.SelectedValue + "','" + DDLSubject.SelectedValue + "','" + DDLChapter.SelectedValue + "','" + DDLTopic.Text + "','" + DDLQuestionType.SelectedValue + "','" + DDLQuestionheading.SelectedValue + "','" + DDLLevel.SelectedValue + "','" + RichTextBox.Text + "','" + Request.Cookies["compid"].Value + "','" + Request.Cookies["loginid"].Value + "'", "insert");
            //    Session["Msg"] = "You have sucessfully insert Question Heading !!";
            //    Response.Redirect("MasterQuestionHeading.aspx");
            //}
        }
        catch (Exception ex)
        {
            lblerror.Text = ex.Message;
            diverror.Visible = true;
        }
        finally
        {
            //ds.Dispose();
        }
    }
    protected void btnlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListMasterQuestion.aspx");
    }
    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterQuestion.aspx");
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

            ds = cn.RunSql("usp_GetComboList 'Chapter','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLChapter.DataSource = ds;
            DDLChapter.DataBind();

            ds1 = cn.RunSql("usp_GetComboList 'QuestionType','" + DDLSubject.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLQuestionType.DataSource = ds1;
            DDLQuestionType.DataBind();

        }
        catch (Exception ex)
        {

        }
    }
    protected void DDLChapter_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            ds = cn.RunSql("usp_GetComboList 'Topic','" + DDLChapter.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLTopic.DataSource = ds;
            DDLTopic.DataBind();

        }
        catch (Exception ex)
        {

        }
    }
    protected void DDLQuestionType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            ds = cn.RunSql("usp_GetComboList 'QuestionHeading','" + DDLQuestionType.SelectedValue + "','" + Request.Cookies["compid"].Value + "'", "s");
            DDLQuestionheading.DataSource = ds;
            DDLQuestionheading.DataBind();

        }
        catch (Exception ex)
        {

        }
    }

    protected void BtnQuestinCheck_Click(object sender, EventArgs e)
    {
        TxtQuestion.Text = (TxtQuestion.Text.ToString().Replace(@"\[", @"\(")).ToString().Replace(@"\]", @"\)");
        LblQuestion.Text = TxtQuestion.Text;
    }

    protected void BtnHintcheck_Click(object sender, EventArgs e)
    {
        TxtHint.Text = (TxtHint.Text.ToString().Replace(@"\[", @"\(")).ToString().Replace(@"\]", @"\)");
        lblhint.Text = TxtHint.Text;
    }
}