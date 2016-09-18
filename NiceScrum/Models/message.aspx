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

  #Button1 {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                transition-duration: 0.4s;
            }
       

</style>

<script type ="text/javascript">

    function hidePanel(panID) {
        var panel = document.getElementById(panID);
        panel.style.display = 'none';
    }
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
       <li> <a href="#" onclick="window.location='homepage.aspx'">Back</a> </li>
       <li><a href="#" class ="active" onclick="showPanel('Panel1')">Compose</a></li>
        <li> <a href="#" onclick="hidePanel('Panel1')">Inbox</a> </li>
        <li> <a href="#" onclick="hidePanel('Panel1')">Sent</a> </li>
    </ul> 
       
        <p>
            &nbsp;</p>
        <asp:Panel ID="Panel1" runat="server" Height="546px" style="margin-top: 0px">
            From:&nbsp; <%= Session["Name"].ToString() %> 
            <br />
            <br />
            To:&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Subject:-<br />
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="638px"></asp:TextBox>
            <br />
            <br />
            Message:-<br />
            <asp:TextBox ID="TextBox2" runat="server" Height="239px" Width="643px" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="151px" />
        </asp:Panel>
       
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
