<%@ Page Title="" Language="C#" MasterPageFile="~/Institute.master" AutoEventWireup="true" CodeFile="tinySample.aspx.cs" Inherits="tinySample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%-- <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js">
    </script>--%>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="keywords" content="math,science" />
    <%--<script type="text/javascript" src="core/display.js"></script>--%>
    <script type="text/javascript" src="tinymce/tinymce.min.js"></script>
    <script type="text/javascript" src="tinymce/plugins/tiny_mce_wiris/wirisplugin-generic.js"></script>
    <script type="text/javascript">
        tinyMCE.init({
            mode: "textareas",
        });
    </script>
    <%--Original data--%>
    <%--<script type="text/x-mathjax-config">
  
        MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
      inlineMath: [ ['$','$'], ["\\(","\\)"] ],
      displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
      processEscapes: true
    },
    "HTML-CSS": { fonts: ["TeX"] }
  });
    </script>--%>
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

    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js">
    </script>--%>
    <script src="MathJax/MathJax.js" type="text/javascript"></script>
    <%--<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    jax: ["input/TeX","output/HTML-CSS"],
    tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
  });
</script>--%>
    <%--<script type="text/javascript" src="unpacked/MathJax.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox ID="RichTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    <div id="pdfgenerate" runat="server">
        <asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label>
    </div>
    <asp:Button ID="Button1" runat="server" Text="PDFConvert" OnClick="Button1_Click" />
</asp:Content>

