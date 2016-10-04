<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDetails.aspx.cs" Inherits="NiceScrum.Models.pDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

     <style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);

         h1 {
            color: antiquewhite;
            text-align: center;
            font-size: 40px;
        }

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

<head runat="server">
    <title></title>
</head>
<body class ="body">
    <form id="form1" runat="server">
          <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Back</a> </li>
            <li><a href="#" class="active" >Details</a> </li>
            <li><a href="#" onclick="showPanel('Panel1');">Create Task</a> </li>
        </ul>
    <div>
    <h1> <%=  Session["project"].ToString()  %> Details  </h1>
        <p> &nbsp;</p>
        <h3 class ="h1"><p> Team Members:   <%= Session["tmembers"] %> </p> Tasks: </h3>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="NiceScrumDB" ForeColor="Black" GridLines="Vertical" Height="274px" Width="942px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="task" HeaderText="task" SortExpression="task" />
                    <asp:BoundField DataField="taskDesc" HeaderText="taskDesc" SortExpression="taskDesc" />
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                    <asp:BoundField DataField="AssignedTo" HeaderText="AssignedTo" SortExpression="AssignedTo" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="NiceScrumDB" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [task], [taskDesc], [DueDate], [AssignedTo], [Type], [Status] FROM [tasks] WHERE ([Project] = @Project)">
                <SelectParameters>
                    <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
        <p> &nbsp;</p>
        <p> &nbsp;</p> 
    </div>
    </form>
</body>
</html>
