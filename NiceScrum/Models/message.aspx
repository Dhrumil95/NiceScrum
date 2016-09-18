﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="NiceScrum.message" %>

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
       <li><a href="#" class ="active" onclick="showPanel('Panel1'); hidePanel('Panel2')">Compose</a></li>
        <li> <a href="#" onclick="showPanel('Panel2'); hidePanel('Panel1');">Inbox</a> </li>
        <li> <a href="#" onclick="hidePanel('Panel1')">Sent</a> </li>
    </ul> 
       
        <p>
            </p>
        <p>
            </p>
        <asp:Panel ID="Panel3" runat="server">
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="412px" Width="845px">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="NiceScrumDB" HorizontalAlign="Left" OnRowDataBound="GridView1_RowDataBound" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FROM" HeaderText="FROM" SortExpression="FROM" />
                    <asp:BoundField DataField="SUBJECT" HeaderText="SUBJECT" SortExpression="SUBJECT" />
                    <asp:BoundField DataField="MESSAGE" HeaderText="MESSAGE" SortExpression="MESSAGE" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" Wrap="True" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" Wrap="True" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="NiceScrumDB" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [FROM], [SUBJECT], [MESSAGE] FROM [mess] WHERE ([TO] = @TO) ORDER BY [Id] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="TO" SessionField="Name" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Height="546px" style="display:none">
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
</body>
</html>
