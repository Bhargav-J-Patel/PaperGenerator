<%@ Page Title="Subject Master" Language="C#" MasterPageFile="~/Institute.master" AutoEventWireup="true" CodeFile="MasterSubject.aspx.cs" Inherits="MasterSubject" %>

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
                            Subject Master</h4>
                    </div>
                    <div style="float: right;">
                        <asp:Button ID="btnlist" Text="List" runat="server" class="btn btn-primary" Style="margin-top: 4px;
                            margin-right: 3px;" OnClick="btnlist_Click" TabIndex="7" UseSubmitBehavior="false" />
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
                                <asp:DropDownList runat="server" ID="DDLMedium" DataTextField="cMedium"  Width="300px"
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
                                <asp:DropDownList runat="server" ID="DDLStandard" DataTextField="cStandardName" DataValueField="cStandard_ID" CssClass="common_select" Width="300px" TabIndex="2">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DDLStandard"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                 InitialValue="00000000-0000-0000-0000-000000000000"  ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th width="100px;">
                                Subject :
                            </th>
                            <td >
                                <asp:TextBox runat="server" ID="TxtSubject" class="txtbox bgcolrblue" TabIndex="3"
                                    Width="300px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtSubject"
                                    ErrorMessage="&lt;img src='assets/img/writing-icon.jpg' title='DELETE' alt='View' border='0'/&gt;"
                                    ValidationGroup="Main"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:DropDownList ID="ddldelete" runat="server" Visible="false" TabIndex="4">
                                    <asp:ListItem>No</asp:ListItem>
                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button Text="Submit" runat="server" class="btn btn-info" ID="btnsubmit" OnClick="btnsubmit_Click"
                                    ValidationGroup="Main" TabIndex="5" />
                                <asp:Button Text="Reset" runat="server" class="btn resetbtn" ID="btnreset" TabIndex="6"
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


