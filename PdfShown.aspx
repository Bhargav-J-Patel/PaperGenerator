<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PdfShown.aspx.cs" Inherits="PdfShown" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <script type="text/javascript">

        function pagedata() {
            setTimeout(function () {
                printPage()
            }, 2000);

        }



        function printPage() {
            var divContents = document.getElementById("dvContents").innerHTML;
            var printWindow = window.open('', '', 'height=200,width=400');
          
            printWindow.document.write(divContents);
           
            printWindow.document.close();
            printWindow.print();
        };


    </script>



</head>
<body>
    <form id="form1" runat="server">
        <div id="dvContents">
            <asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label>
        </div>
        <input type="button" onclick="printPage();" value="Print" />
    </form>
</body>
</html>
