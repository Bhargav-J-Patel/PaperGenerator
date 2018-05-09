<%@ Page Title="Question Heading Master" Language="C#" MasterPageFile="~/Institute.master" AutoEventWireup="true" CodeFile="MasterQuestionHeading.aspx.cs" Inherits="MasterQuestionHeading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="success" runat="server" id="divsucess" visible="false">
                <asp:Label ID="lblsucess" runat="server" Text=""></asp:Label></div>
            <div class="warning" runat="server" id="DivWarning" visible="false">
                <asp:Label ID="LblWarning" runat="server" Text=""></asp:Label></div>
            <div class="error" runat="server" id="diverror" visible="false">
                <asp:Label ID="lblerror" runat="server" Text=""></asp:Label></div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-xs-12 col-sm-11">
            <div class="widget-box">
                <div class="widget-header">
                    <div style="float: left">
                        <h4 class="widget-title">
                            Question Heading Master</h4>
                    </div>
                    <div style="float: right;">
                        <asp:Button ID="btnlist" Text="List" runat="server" class="btn btn-primary" Style="margin-top: 4px;
                            margin-right: 3px;" OnClick="btnlist_Click" TabIndex="9" UseSubmitBehavior="false" />
                    </div>
                </div>

                <asp:UpdatePanel runat="server" ID="up1">
                <ContentTemplate>
                

                <div class="widget-body">
                    <table class="commontable">
                        <tr>
                            <th>
                                Midium
                            </th>
                            <td>
                                <asp:DropDownList runat="server" ID="DDLMedium" DataTextField="cMedium"  Width="150px"
                                    DataValueField="cMedium_ID" CssClass="common_select" AutoPostBack="true"
                                    onselectedindexchanged="DDLMedium_SelectedIndexChanged" TabIndex="1">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDLMedium"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                 InitialValue="00000000-0000-0000-0000-000000000000"  ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Standard
                            </th>
                            <td>
                                <asp:DropDownList runat="server" ID="DDLStandard" DataTextField="cStandardName" 
                                    DataValueField="cStandard_ID" CssClass="common_select" Width="150px"  TabIndex="2"
                                    onselectedindexchanged="DDLStandard_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLStandard"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                 InitialValue="00000000-0000-0000-0000-000000000000"  ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <th>
                                Subject
                            </th>
                            <td>
                                <asp:DropDownList runat="server" ID="DDLSubject" DataTextField="cSubjectName" 
                                    DataValueField="cSubject_ID" CssClass="common_select" Width="150px" AutoPostBack="true"
                                    TabIndex="3" onselectedindexchanged="DDLSubject_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDLSubject"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                 InitialValue="00000000-0000-0000-0000-000000000000"  ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Question Type
                            </th>
                            <td>
                                <asp:DropDownList runat="server" ID="DDLQuestionType" DataTextField="cDescription" DataValueField="cQuestion_Type_ID" CssClass="common_select" Width="150px" TabIndex="3">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DDLQuestionType"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                 InitialValue="00000000-0000-0000-0000-000000000000"  ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th width="100px;">
                                Heading Name:
                            </th>
                            <td width="200px">
                                <asp:TextBox runat="server" ID="TxtHeadingName" class="txtbox bgcolrblue" TabIndex="4"  
                                    Width="150px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtHeadingName"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                       
                       
                        <tr>
                            <td colspan="2">
                                <asp:DropDownList ID="ddldelete" runat="server" Visible="false" TabIndex="6">
                                    <asp:ListItem>No</asp:ListItem>
                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button Text="Submit" runat="server" class="btn btn-info" ID="btnsubmit" OnClick="btnsubmit_Click"
                                    ValidationGroup="Main" TabIndex="7" />
                                <asp:Button Text="Reset" runat="server" class="btn resetbtn" ID="btnreset" TabIndex="8"
                                    OnClick="btnreset_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>








