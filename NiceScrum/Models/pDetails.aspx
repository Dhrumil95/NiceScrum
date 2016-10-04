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
            <li><a href="#" onclick="window.location='homepage.aspx'">Back</a> </li>
            <li><a href="#" class="active" onclick="showPanel('Panel1'); hidePanel('Panel2'); hidePanel('Panel3');" >Details</a> </li>
            <li><a href="#" onclick="showPanel('Panel2'); hidePanel('Panel1'); hidePanel('Panel3');">Create Task</a> </li>
            <li><a href="#" onclick="showPanel('Panel3'); hidePanel('Panel1'); hidePanel('Panel2');">Update Tasks</a> </li>
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
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Button" Width="106px" OnClick="Button3_Click" />
                    <br />
                    <br />
                    <br />
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="NiceScrumDB" ForeColor="Black" GridLines="Vertical" Height="307px" Width="923px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="task" HeaderText="task" SortExpression="task" />
                            <asp:BoundField DataField="taskDesc" HeaderText="taskDesc" SortExpression="taskDesc" />
                            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
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
             <h3 class ="h1"><p> Team Members:   <%= Session["tmembers"] %> </p> Tasks: 
                 <h3></h3>
                 <p>
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Height="274px" Width="942px" OnRowDataBound="GridView1_RowDataBound" >
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
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [task], [taskDesc], [DueDate], [AssignedTo], [Type], [Status] FROM [tasks] WHERE ([Project] = @Project)">
                         <SelectParameters>
                             <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <asp:SqlDataSource ID="NiceScrumDB" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Id], [task], [taskDesc], [DueDate], [AssignedTo], [Type], [Status] FROM [tasks] WHERE ([Project] = @Project)" OldValuesParameterFormatString="original_{0}">
                         <SelectParameters>
                             <asp:SessionParameter Name="Project" SessionField="pID" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </p>
                 <h3></h3>
                 <h3></h3>
                 <h3></h3>
                 <h3></h3>
                 <h3></h3>
             </h3>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
