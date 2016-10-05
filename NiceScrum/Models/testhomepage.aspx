<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testhomepage.aspx.cs" Inherits="NiceScrum.homepage" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> Welcome, <%= Session["name"].ToString() %>, accType &nbsp;<%= Session["accType"].ToString() %>  </h1>
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="NiceScrumDB" DataTextField="projectName" DataValueField="projectName" Height="214px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="294px"></asp:ListBox>
            <asp:SqlDataSource ID="NiceScrumDB" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\NiceScrumDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [projectName] FROM [projects]"></asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Height="37px" OnClick="Button1_Click" Text="Button" Width="169px" />
    </div>
    </form>
</body>
</html>
