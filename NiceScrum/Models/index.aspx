<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NiceScrum.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style type="text/css">
        #Text1 {
            width: 224px;
            height: 18px;
        }
        #Text2 {
            width: 224px;
            height: 18px;
        }
    </style>
</head>
<body style ="background: #F0F8FF">
    <center>
    <form id="form1" runat="server" align ="middle">
    <h1>
        Login Page</h1>
    <p>
        &nbsp;</p>
    <p  style="font-size:25px">
        &nbsp;&nbsp; Username&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="18px"  Width="224px"></asp:TextBox>
        </p>
        <p  style="font-size:25px">
        &nbsp;&nbsp; Password&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="18px" Width="224px"></asp:TextBox>
        </p>
        <p style="font-size:25px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="121px" />
        </p>
    </form>
        </center>
    </body>
</html>
