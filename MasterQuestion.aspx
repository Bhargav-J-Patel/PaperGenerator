<%@ Page Title="Question Master" Language="C#" MasterPageFile="~/Institute.master" AutoEventWireup="true" CodeFile="MasterQuestion.aspx.cs" Inherits="MasterQuestion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="tinymce/plugins/tiny_mce_wiris/wirisplugin-generic.js"></script>
    <script type="text/javascript">
        tinyMCE.init({
            selector: 'textarea',
            mode: "textareas",
            menubar: false,
            preview_styles: false,
            statusbar: false,
            toolbar: false,
            width: 847,
            height: 200
        });
    </script>

    <script type="text/x-mathjax-config">
       MathJax.Hub.Config({
        extensions: ["tex2jax.js"],
        jax: ["input/TeX", "output/HTML-CSS"],
        tex2jax: {
          inlineMath: [ ['$','$'], ["\\(","\\)"] ],
          displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
          processEscapes: true
        },
        "HTML-CSS": { fonts: ["STIX"] }
      });
    </script>
    <script src="MathJax/MathJax.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        function changeQuestion() {
            var content = tinyMCE.activeEditor.getContent();
            var LblQuestion = document.getElementById("<%=LblQuestion.ClientID%>");
            var TxtQuestion = document.getElementById("<%=TxtQuestion.ClientID%>");

            LblQuestion.innerHTML = content;

            alert(LblQuestion.innerHTML);
        }


    </script>--%>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="success" runat="server" id="divsucess" visible="false">
                <asp:Label ID="lblsucess" runat="server" Text=""></asp:Label>
            </div>
            <div class="warning" runat="server" id="DivWarning" visible="false">
                <asp:Label ID="LblWarning" runat="server" Text=""></asp:Label>
            </div>
            <div class="error" runat="server" id="diverror" visible="false">
                <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-xs-12 col-sm-11">
            <div class="widget-box">
                <div class="widget-header">
                    <div style="float: left">
                        <h4 class="widget-title">Question Master</h4>
                    </div>
                    <div style="float: right;">
                        <asp:Button ID="btnlist" Text="List" runat="server" class="btn btn-primary" Style="margin-top: 4px; margin-right: 3px;"
                            OnClick="btnlist_Click" TabIndex="9" UseSubmitBehavior="false" />
                    </div>
                </div>
                <div class="widget-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <table class="commontable" width="85%">
                                <tr>
                                    <th style="width: 130px;">Midium
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLMedium" DataTextField="cMedium" Width="300px"
                                            DataValueField="cMedium_ID" CssClass="common_select" AutoPostBack="true"
                                            OnSelectedIndexChanged="DDLMedium_SelectedIndexChanged" TabIndex="1">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLMedium"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>

                                    <th style="width: 130px;">Standard
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLStandard" DataTextField="cStandardName"
                                            DataValueField="cStandard_ID" CssClass="common_select" Width="300px" TabIndex="2"
                                            OnSelectedIndexChanged="DDLStandard_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDLStandard"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Subject
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLSubject" DataTextField="cSubjectName"
                                            DataValueField="cSubject_ID" CssClass="common_select" Width="300px" AutoPostBack="true"
                                            TabIndex="3" OnSelectedIndexChanged="DDLSubject_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDLSubject"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>

                                    <th>Chapter
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLChapter" DataTextField="cChapterName"
                                            DataValueField="cChapter_ID" CssClass="common_select" Width="300px" AutoPostBack="true"
                                            TabIndex="4" OnSelectedIndexChanged="DDLChapter_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDLChapter"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Topic
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLTopic" DataTextField="cTopicName" DataValueField="cTopic_ID" CssClass="common_select" Width="300px" TabIndex="5">
                                        </asp:DropDownList>

                                    </td>

                                    <th>Question Type
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLQuestionType" DataTextField="cDescription" DataValueField="cQuestion_Type_ID" CssClass="common_select" Width="300px" TabIndex="6" OnSelectedIndexChanged="DDLQuestionType_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <th>Question Heading
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLQuestionheading" DataTextField="cHeadingName" DataValueField="cQuestion_Heading_ID" CssClass="common_select" Width="300px" TabIndex="7">
                                        </asp:DropDownList>

                                    </td>

                                    <th>Level
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLLevel" DataTextField="cLevelName" DataValueField="cLevel_ID" CssClass="common_select" Width="300px" TabIndex="8">
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <table class="commontable" width="85%">
                        <tr>
                            <th style="width: 130px;">Question
                            </th>
                            <td>
                                <table>
                                    <tr>

                                        <td>

                                            <asp:TextBox ID="TxtQuestion" runat="server" TextMode="MultiLine" TabIndex="9"></asp:TextBox>


                                        </td>
                                        <td style="vertical-align: bottom;">
                                            <asp:Button Text="Check" runat="server" class="btn btn-info" ID="BtnQuestinCheck" OnClick="BtnQuestinCheck_Click" />
                                        </td>
                                    </tr>
                                </table>




                            </td>
                        </tr>
                        <tr>
                            <td></td>

                            <td>
                                <asp:Label ID="LblQuestion" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 130px;">Answer Key
                            </th>
                            <td>
                                <asp:TextBox runat="server" ID="TxtAnswerKey" class="txtbox bgcolrblue" TabIndex="10"
                                    Width="150px" MaxLength="1" Style="text-transform: uppercase;" />
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 130px;">Hint/Solution
                            </th>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TxtHint" runat="server" TextMode="MultiLine" TabIndex="11"></asp:TextBox>

                                        </td>
                                        <td style="vertical-align: bottom;">
                                            <asp:Button Text="Check" runat="server" class="btn btn-info" ID="BtnHintcheck" OnClick="BtnHintcheck_Click" />
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td></td>

                            <td>
                                <asp:Label ID="lblhint" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <asp:DropDownList ID="ddldelete" runat="server" Visible="false" TabIndex="12">
                                    <asp:ListItem>No</asp:ListItem>
                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button Text="Submit" runat="server" class="btn btn-info" ID="btnsubmit" OnClick="btnsubmit_Click"
                                    ValidationGroup="Main" TabIndex="13" />
                                <asp:Button Text="Reset" runat="server" class="btn resetbtn" ID="btnreset" TabIndex="14"
                                    OnClick="btnreset_Click" />
                            </td>
                        </tr>
                    </table>


                </div>

            </div>
        </div>
    </div>
</asp:Content>










