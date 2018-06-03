using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using App_Code;
using System.Data;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class ListPage : System.Web.Services.WebService {

    public ListPage () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    public class ListAll
    {
        public string cAnswerKey { get; set; }
        public string NID { get; set; }
        public string cMedium, cStandardName, cSubjectName, nChaper_Index, cChapterName, nTopic_Index, cTopicName, cDescription, cLevelName, cedit, cdelete;

    }

    [WebMethod]
    public void ListMedium(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetMediumMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("Midium", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }

    [WebMethod]
    public void ListStandard(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetStandardMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("Standard", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }

    [WebMethod]
    public void ListSubject(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetSubjectMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("Subject", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }

    [WebMethod]
    public void ListChapter(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetChapterMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.nChaper_Index = DS.Tables[0].Rows[i]["nChaper_Index"] != DBNull.Value ? DS.Tables[0].Rows[i]["nChaper_Index"].ToString() : "";
                    cls.cChapterName = DS.Tables[0].Rows[i]["cChapterName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cChapterName"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("Chapter", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }

    [WebMethod]
    public void ListTopic(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetTopicMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.cChapterName = DS.Tables[0].Rows[i]["cChapterName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cChapterName"].ToString() : "";
                    cls.nTopic_Index = DS.Tables[0].Rows[i]["nTopic_Index"] != DBNull.Value ? DS.Tables[0].Rows[i]["nTopic_Index"].ToString() : "";
                    cls.cTopicName = DS.Tables[0].Rows[i]["cTopicName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cTopicName"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("Topic", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }

    [WebMethod]
    public void ListQuestionType(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetQuetionTypeMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.cDescription = DS.Tables[0].Rows[i]["cDescription"] != DBNull.Value ? DS.Tables[0].Rows[i]["cDescription"].ToString() : "";
                    
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("QuestionTypeMaster", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }



    [WebMethod]
    public void ListQuestionHeading(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetQuetionHeadingMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.cDescription = DS.Tables[0].Rows[i]["cHeadingName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cHeadingName"].ToString() : "";

                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("QuestionHeadingMaster", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }



    [WebMethod]
    public void ListLevel(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetLevelMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cLevelName = DS.Tables[0].Rows[i]["cLevelName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cLevelName"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("LevelMaster", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }
    [WebMethod]
    public void ListQuestion(int iDisplayLength, int iDisplayStart, int iSortCol_0, string sSortDir_0, string sSearch)
    {
        int displayLength = iDisplayLength;
        int displayStart = iDisplayStart;
        int sortCol = iSortCol_0;
        string sortDir = sSortDir_0;
        string search = sSearch;


        ListAll cls2 = new ListAll();
        List<ListAll> myList = new List<ListAll>();



        int filteredCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetQuestionMaster '" + displayLength + "','" + displayStart + "','" + sortCol + "','" + sortDir + "','" + search + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "List");


        if (DS.Tables.Count > 0)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                {
                    ListAll cls = new ListAll();
                    filteredCount = Convert.ToInt32(DS.Tables[0].Rows[i]["TotalCount"] != DBNull.Value ? DS.Tables[0].Rows[i]["TotalCount"].ToString() : "0");
                    cls.cMedium = DS.Tables[0].Rows[i]["cMedium"] != DBNull.Value ? DS.Tables[0].Rows[i]["cMedium"].ToString() : "";
                    cls.cStandardName = DS.Tables[0].Rows[i]["cStandardName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cStandardName"].ToString() : "";
                    cls.cSubjectName = DS.Tables[0].Rows[i]["cSubjectName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cSubjectName"].ToString() : "";
                    cls.cChapterName = DS.Tables[0].Rows[i]["cChapterName"] != DBNull.Value ? DS.Tables[0].Rows[i]["cChapterName"].ToString() : "";
                    cls.cAnswerKey = DS.Tables[0].Rows[i]["cAnswerKey"] != DBNull.Value ? DS.Tables[0].Rows[i]["cAnswerKey"].ToString() : "";
                    cls.NID = DS.Tables[0].Rows[i]["NID"] != DBNull.Value ? DS.Tables[0].Rows[i]["NID"].ToString() : "";
                    cls.cedit = DS.Tables[0].Rows[i]["cedit"] != DBNull.Value ? DS.Tables[0].Rows[i]["cedit"].ToString() : "";
                    cls.cdelete = DS.Tables[0].Rows[i]["cdelete"] != DBNull.Value ? DS.Tables[0].Rows[i]["cdelete"].ToString() : "";
                    myList.Add(cls);
                }
            }
        }

        var result = new
        {
            iTotalRecords = GetTotalCount("LevelMaster", ""),
            //iTotalRecords = 5000,
            iTotalDisplayRecords = filteredCount,
            aaData = myList
        };
        JavaScriptSerializer js = new JavaScriptSerializer();
        Context.Response.Write(js.Serialize(result));
    }
    

    private int GetTotalCount(string pageName, string cType)
    {
        ListAll m = new ListAll();

        int totalCount = 0;
        DataSet DS = new DataSet();
        SqlInstitute CN = new SqlInstitute();

        DS = CN.RunSql("usp_GetTotalCount '" + pageName + "','" + HttpContext.Current.Request.Cookies["compid"].Value.ToString() + "'", "Count");
        totalCount = Convert.ToInt32(DS.Tables[0].Rows[0][0].ToString());
        return totalCount;
    }

    
}
