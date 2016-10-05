<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myWork.aspx.cs" Inherits="NiceScrum.Models.myWork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
         Button {
            background-color: rgba(76, 175, 80, 0.89);
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 12px;
        }

            Button:hover {
                background-color: rgba(76, 175, 80, 1.00);
            }

            Button:active {
                background-color: #3e8e41;
                transform: translateY(4px);
            }

    </style>

      <script type="text/javascript">

        function hidePanel(panID) {
            var panel = document.getElementById(panID);
            panel.style.display = 'none';
        }
        function showPanel(panId) {
            var panel = document.getElementById(panId)
            panel.style.display = "";
        }
    </script>

    <title>My Work</title>
</head>
<body>
    <form id="form1" runat="server">
        <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Back</a> </li>
            <li><a href="#" class="active" onclick="showPanel('Panel1'); hidePanel('Panel2'); hidePanel('Panel3');" >My Task</a> </li>
            <li><a href="#" onclick="showPanel('Panel2'); hidePanel('Panel1'); hidePanel('Panel3');">My Backlogs</a> </li>
            <li><a href="#" onclick="showPanel('Panel3'); hidePanel('Panel1'); hidePanel('Panel2');">Current Status/Due Dates</a> </li>
            <li><a href="#" onclick="showPanel('Panel3'); hidePanel('Panel1'); hidePanel('Panel2');">Task Available</a> </li>
            <li><a href="#" onclick="showPanel('Panel3'); hidePanel('Panel1'); hidePanel('Panel2');">My Profile</a> </li>
            <%  if (Session["accType"].ToString().Equals("admin"))
                {   %>
                 <li><a href="#" onclick="showPanel('Panel2'); hidePanel('Panel1'); hidePanel('Panel3');">Projects</a> </li>
            <% } %>
        </ul>
  

    <div>
    
    </div>
        <p>
            &nbsp;</p>
        <p>
            </p>
        <asp:Panel ID="Panel2" runat="server" Height="487px" Style="display:none" >
            <asp:ListBox ID="ListBox1" runat="server" Height="366px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="496px" DataSourceID="SqlDataSource2" DataTextField="projectName" DataValueField="projectName"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [projectName] FROM [projects] WHERE ([Manager] = @Manager)">
                <SelectParameters>
                    <asp:SessionParameter Name="Manager" SessionField="name" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
            <asp:Button ID="Button1" runat="server" Height="36px" OnClick="Button1_Click" Text="Button" Width="157px" />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Height="542px">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="355px" Width="942px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Task" HeaderText="Task" SortExpression="Task" />
                        <asp:BoundField DataField="Task Desc." HeaderText="Task Desc." SortExpression="Task Desc." />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                        <asp:BoundField DataField="Project Name" HeaderText="Project Name" SortExpression="Project Name" />
                    </Columns>
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
              </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand=" SELECT tasks.Id AS ID, tasks.task as Task, tasks.taskDesc as 'Task Desc.', tasks.Type, projects.projectName AS 'Project Name' FROM tasks INNER JOIN projects ON tasks.Project = projects.Id WHERE ([AssignedTo] = @AssignedTo)">
                    <SelectParameters>
                        <asp:SessionParameter Name="AssignedTo" SessionField="name" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            
          </asp:Panel>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
