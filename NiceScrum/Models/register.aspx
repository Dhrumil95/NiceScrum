<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="NiceScrum.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);

        body {
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
            background: #2c3338;
        }

        h1 {
            color: antiquewhite;
            text-align: center;
            font-size: 40px;
        }

        p {
            text-align: center;
            font-size: 25px;
        }

        ::-webkit-input-placeholder {
            text-align: center;
        }

        #Button1 {
            background-color: rgb(255, 0, 220);
            border: none;
            color: white;
            padding: 15px 32px;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 12px;
        }

            #Button1:hover {
                background-color: rgba(255, 0, 220, 0.94);
            }

            #Button1:active {
                background-color: rgba(255, 0, 220, 0.63);
                transform: translateY(4px);
            }
    </style>

</head>
<body class="body">
    <form id="form1" runat="server" align="middle">
        <div>
            <h1 class="h1">Register </h1>

            &nbsp;
        </div>
        Name<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Username<br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        Password<br />
        <asp:TextBox ID="TextBox3" type="password" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="147px" Height="54px" />
    </form>
</body>
</html>
