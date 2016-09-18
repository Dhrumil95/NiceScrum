<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="NiceScrum.message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Messages</title>
    <style type ="text/css">
  @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: white;
}

li {
    float: left;
}

li a {
    display: block;
    color: #111;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #808080;
}


 body {
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
            background: #2c3338;
        }

</style>

<script type ="text/javascript">
        function showPanel(panId)
       {
          var panel=document.getElementById(panId)
          panel.style.display = "";
        }

</script>

</head>
<body class ="body">
    <form id="form1" runat="server">
    <ul id="menulist1">
       <li>
           <a href="#" onclick="showPanel('Panel1')">Back</a>
       </li>
       <li><a href="#" class ="active" onclick="showPanel('Panel2')">Compose</a></li>
        <li>
            <br />
        </li>
    </ul> 
        <p>
            &nbsp;</p>
        <asp:Panel ID="Panel1" runat="server" Height="336px" style="display:none">
            Panel1</asp:Panel>
    </form>
</body>
</html>
