﻿<%@ Page Title="Chapter Master" Language="C#" MasterPageFile="~/Institute.master"
    AutoEventWireup="true" CodeFile="MasterChapter.aspx.cs" Inherits="MasterChapter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                        <h4 class="widget-title">Chapter Master</h4>
                    </div>
                    <div style="float: right;">
                        <asp:Button ID="btnlist" Text="List" runat="server" class="btn btn-primary" Style="margin-top: 4px; margin-right: 3px;"
                            OnClick="btnlist_Click" TabIndex="10" UseSubmitBehavior="false" />
                    </div>
                </div>
                <asp:UpdatePanel runat="server" ID="up1">
                    <ContentTemplate>
                        <div class="widget-body">
                            <table class="commontable">
                                <tr>
                                    <th>Midium
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLMedium" DataTextField="cMedium" Width="300px"
                                            DataValueField="cMedium_ID" CssClass="common_select" AutoPostBack="true" OnSelectedIndexChanged="DDLMedium_SelectedIndexChanged"
                                            TabIndex="1">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DDLMedium"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Standard
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLStandard" DataTextField="cStandardName" DataValueField="cStandard_ID"
                                            CssClass="common_select" Width="300px" TabIndex="2" OnSelectedIndexChanged="DDLStandard_SelectedIndexChanged"
                                            AutoPostBack="true">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLStandard"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Subject
                                    </th>
                                    <td>
                                        <asp:DropDownList runat="server" ID="DDLSubject" DataTextField="cSubjectName" DataValueField="cSubject_ID"
                                            CssClass="common_select" Width="300px" TabIndex="3">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDLSubject"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            InitialValue="00000000-0000-0000-0000-000000000000" ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="100px;">Chapter Index :
                                    </th>
                                    <td>
                                        <asp:TextBox runat="server" ID="TxtChapterIndex" class="txtbox bgcolrblue" TabIndex="4"
                                            onkeypress="return validateKeyPress(event,validNums)" Width="300px" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtChapterIndex"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th width="100px;">Chapter Name :
                                    </th>
                                    <td >
                                        <asp:TextBox runat="server" ID="TxtChapterName" class="txtbox bgcolrblue" TabIndex="5"
                                            Width="300px" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtChapterName"
                                            ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                            ValidationGroup="Main"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Demo
                                    </th>
                                    <td>
                                        <asp:CheckBox runat="server" ID="ChkDemo" TabIndex="6" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:DropDownList ID="ddldelete" runat="server" Visible="false" TabIndex="7">
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button Text="Submit" runat="server" class="btn btn-info" ID="btnsubmit" OnClick="btnsubmit_Click"
                                            ValidationGroup="Main" TabIndex="8" />
                                        <asp:Button Text="Reset" runat="server" class="btn resetbtn" ID="btnreset" TabIndex="9"
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
