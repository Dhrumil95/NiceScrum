<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NiceScrum.WebForm1" %>

<!DOCTYPE html>

<head runat="server">
    <title>Login Page</title>
    <style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300);

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

        #form1 {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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

        #Button2 {
            background-color: #808080;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 12px;
        }

            #Button2:hover {
                background-color: rgba(128, 128, 128, 0.75);
            }

            #Button2:active {
                background-color: rgba(128, 128, 128, 0.75);
                transform: translateY(4px);
            }

        body {
            font-family: 'Source Sans Pro', sans-serif;
            color: white;
            font-weight: 300;
            background: #2c3338;
        }
    </style>
</head>
<body class="body">
    <form id="form1" runat="server">
        <h1 class="h1">Welcome To NiceScrum</h1>
        <p class="p">
            <%     bool valid = string.IsNullOrWhiteSpace(Request.QueryString["inval"]);
                if (!valid)
                {  %>  Invalid Credentials... Please Try Again!  <% } %>
        </p>
        <p class="p">
            <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="313px" placeholder="USERNAME"></asp:TextBox>
        </p>
        <p class="p">
            <asp:TextBox ID="TextBox2" type="password" runat="server" Height="18px" Width="312px" placeholder="PASSWORD"></asp:TextBox>
        </p>
        <p style="font-size: 25px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="121px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Width="121px" />
        </p>
    </form>
</body>
