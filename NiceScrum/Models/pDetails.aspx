<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDetails.aspx.cs" Inherits="NiceScrum.Models.pDetails" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            background-color: lightblue;
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
                    background-color: white;
                }


        body {
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
            background: #2c3338;
        }
         #Button1 {
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

            #Button1:hover {
                background-color: rgba(76, 175, 80, 1.00);
            }

            #Button1:active {
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

<head runat="server">
    <title></title>
</head>
<body class ="body">
    <form id="form1" runat="server">
          <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Home</a> </li>
            <li><a href="#" class="active" onclick="showPanel('Panel1'); hidePanel('Panel4'); hidePanel('Panel2'); hidePanel('Panel3');" >Details</a> </li>
            <li><a href="#" onclick="showPanel('Panel2'); hidePanel('Panel4'); hidePanel('Panel1'); hidePanel('Panel3');">Create Task</a> </li>
            <li><a href="#" onclick="showPanel('Panel3'); hidePanel('Panel4'); hidePanel('Panel1'); hidePanel('Panel2');">Update Tasks</a> </li>
            <li><a href="#" onclick="showPanel('Panel4'); hidePanel('Panel3'); hidePanel('Panel1'); hidePanel('Panel2');">Project Chart</a> </li>
            <li><a href="#" onclick="window.location='myWork.aspx'">MyWork</a> </li>
            <li><a href="#" onclick="window.location='message.aspx'">Messages</a></li>
            <li><a href="#" onclick="window.location='Sandbox.aspx'">Sandbox</a> </li>
            <li><a href="#" onclick="window.location='Resources.aspx'">Resources</a> </li>
        </ul>
    <div>
    <h1> <%=  Session["project"].ToString()  %> Details  </h1>
        <p> </p>
                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="Panel3" runat="server" Height="710px" Width="1418px" style="display:none" >
                    <br />
                    List of &quot;Available&quot; Task&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List of &quot;Assigned&quot; Task<br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" Height="247px" Width="501px"></asp:ListBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:ListBox ID="ListBox2" runat="server" Height="247px" Width="501px"></asp:ListBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    Assign to
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="16px" Width="132px">
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="Button2" runat="server" Text="Button" Width="106px" OnClick="Button2_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Button" Width="174px" OnClick="Button3_Click" />
                    <br />
                    <br />
                    <br />
             
                    <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="NiceScrumDB" ForeColor="Black" GridLines="Vertical" Height="307px" Width="1395px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?');" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="task" HeaderText="task" SortExpression="task" />
                            <asp:BoundField DataField="taskDesc" HeaderText="taskDesc" SortExpression="taskDesc" />
                            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
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
               
        </asp:Panel>
       
        <asp:Panel ID="Panel4" runat="server" Height="388px" style ="display:none">
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Height="377px" OnLoad="Chart1_Load" Width="572px">
                <series>
                    <asp:Series Name="Series1" YValueMembers="Column1">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT count(*) FROM tasks WHERE ([Project] = @Project) GROUP BY status">

                 <SelectParameters>
                             <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                         </SelectParameters>

            </asp:SqlDataSource>
        </asp:Panel>
       
        <p>
            </p>
        <asp:Panel ID="Panel2" runat="server" Height="614px" style="display:none" >
            Task ID &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Task Name&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Task Description<br />&nbsp;<asp:TextBox ID="TextBox3" runat="server" Height="97px" Width="346px" TextMode="MultiLine"></asp:TextBox>
            <br />
            &nbsp;&nbsp;<br />Due Date&nbsp;
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            Assign To&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="140px">
            </asp:DropDownList>
            &nbsp;&nbsp; Task Type
            <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" Width="137px">
                <asp:ListItem Selected="True">Urgent</asp:ListItem>
                <asp:ListItem>Recurrent</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp; Status&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="140px">
                <asp:ListItem>TODO</asp:ListItem>
                <asp:ListItem>In Progress</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="41px" OnClick="Button1_Click" Text="Button" Width="171px" />
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Height="458px">
            <br />
            <h3 class ="h1"><p> Start Date:   <%= Session["StartDate"] %> </p> 
                <h3></h3>
                <h3 class="h1">
                    <p>
                        End Date: <%= Session["EndDate"] %>
                    </p>
                    <h3></h3>
                    <h3 class="h1">
                        <p>
                            Team Members: <%= Session["tmembers"] %>
                        </p>
                        Tasks:
                        <h3></h3>
                        <p>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="274px" OnRowDataBound="GridView1_RowDataBound" Width="942px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                                    <asp:BoundField DataField="task" HeaderText="Task" SortExpression="task" />
                                    <asp:BoundField DataField="taskDesc" HeaderText="Task Desc" SortExpression="taskDesc" />
                                    <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" />
                                    <asp:BoundField DataField="AssignedTo" HeaderText="Assigned To" SortExpression="AssignedTo" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [task], [taskDesc], [DueDate], [AssignedTo], [Type], [Status] FROM [tasks] WHERE ([Project] = @Project)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="NiceScrumDB" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [tasks] WHERE [Id] = @original_Id AND (([task] = @original_task) OR ([task] IS NULL AND @original_task IS NULL)) AND (([taskDesc] = @original_taskDesc) OR ([taskDesc] IS NULL AND @original_taskDesc IS NULL)) AND (([DueDate] = @original_DueDate) OR ([DueDate] IS NULL AND @original_DueDate IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))" InsertCommand="INSERT INTO [tasks] ([Id], [task], [taskDesc], [DueDate], [Type], [Status]) VALUES (@Id, @task, @taskDesc, @DueDate, @Type, @Status)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [task], [taskDesc], [DueDate], [Type], [Status] FROM [tasks] WHERE ([Project] = @Project)" UpdateCommand="UPDATE [tasks] SET [task] = @task, [taskDesc] = @taskDesc, [DueDate] = @DueDate, [Type] = @Type, [Status] = @Status WHERE [Id] = @original_Id AND (([task] = @original_task) OR ([task] IS NULL AND @original_task IS NULL)) AND (([taskDesc] = @original_taskDesc) OR ([taskDesc] IS NULL AND @original_taskDesc IS NULL)) AND (([DueDate] = @original_DueDate) OR ([DueDate] IS NULL AND @original_DueDate IS NULL)) AND (([Type] = @original_Type) OR ([Type] IS NULL AND @original_Type IS NULL)) AND (([Status] = @original_Status) OR ([Status] IS NULL AND @original_Status IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_task" Type="String" />
                                    <asp:Parameter Name="original_taskDesc" Type="String" />
                                    <asp:Parameter DbType="Date" Name="original_DueDate" />
                                    <asp:Parameter Name="original_Type" Type="String" />
                                    <asp:Parameter Name="original_Status" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Id" Type="Int32" />
                                    <asp:Parameter Name="task" Type="String" />
                                    <asp:Parameter Name="taskDesc" Type="String" />
                                    <asp:Parameter DbType="Date" Name="DueDate" />
                                    <asp:Parameter Name="Type" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="task" Type="String" />
                                    <asp:Parameter Name="taskDesc" Type="String" />
                                    <asp:Parameter DbType="Date" Name="DueDate" />
                                    <asp:Parameter Name="Type" Type="String" />
                                    <asp:Parameter Name="Status" Type="String" />
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_task" Type="String" />
                                    <asp:Parameter Name="original_taskDesc" Type="String" />
                                    <asp:Parameter DbType="Date" Name="original_DueDate" />
                                    <asp:Parameter Name="original_Type" Type="String" />
                                    <asp:Parameter Name="original_Status" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </p>
                        <h3></h3>
                        <h3></h3>
                        <h3></h3>
                        <h3></h3>
                        <h3></h3>
                        <h3></h3>
                    </h3>
                </h3>
            </h3>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
