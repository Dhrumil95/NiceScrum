<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sandbox.aspx.cs" Inherits="Nicescrum_homepage.Sandbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sandbox</title>
    <style type="text/css">
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

        #btnpost {
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

         h1 {
            color: antiquewhite;
            text-align: center;
            font-size: 40px;
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
</head>
<body class ="Body">
    <form id="form1" runat="server">
        
    <div>
    
 <!--   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lnkbtnhome1" runat="server" OnClick="LinkButton1_Click">NICESRUM</asp:LinkButton> -->

        <br />
        <h1 class ="h1" > SandBox </h1>
        <br />
        <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Home</a> </li>
            <li><a href="#" onclick="showPanel('Panel1'); hidePanel('Panel2');">Ideas</a></li>
            <li><a href="#" class="active" onclick="showPanel('Panel2'); hidePanel('Panel1');">Posts</a> </li>
        </ul>
            
        <p>
        </p>
        <p>
        </p>
        
            <asp:Panel ID="Panel1" runat="server" Height ="300px">
                <asp:Label ID="Ideas" runat="server" Text="Ideas"></asp:Label>
                <br />
                <asp:TextBox ID="txtideas" runat="server" Height="150px" Width="435px" TextMode="MultiLine" style="margin-right: 0px"></asp:TextBox>
                
                <br />
                <br />
                <asp:Button ID="btnpost" runat="server" OnClick="btnpost_Click" Text="Post" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Green" style="text-align: left" Text="Label" Visible="False"></asp:Label>
                
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Height ="500px" Width = "845px" Style="display: none">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign="Left" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="idea" HeaderText="idea" SortExpression="idea" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" SelectCommand="SELECT [Name], [idea] FROM [sandbox]"></asp:SqlDataSource>
                </asp:Panel>
        <br />
            <br />
            <br />
        <br /> 
        <br />
        <br />
        <br />
            
        </div>
    </form>
</body>
</html>
