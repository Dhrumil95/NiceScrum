<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="NiceScrum.Models.Resources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resources</title>
    <style>
        h1{
            color: antiquewhite;
            text-align: center;
            font-size: x-large;
}

ul {
            list-style-type: none;
            display: table;
            margin: 0 auto;
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
        body{
            
            background-color: #2c3338;
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
</head>
<body>
    <form id="form1" runat="server">
        <h1 class ="h1" ><strong style="font-family: 'OCR A Extended'"> Resources</strong> </h1>

        <ul id="menulist1">
            <li><a href="#" onclick="window.location='homepage.aspx'">Home</a> </li>
            <li><a href="#" onclick="window.location='myWork.aspx'">MyWork</a> </li>
            <li><a href="#" onclick="window.location='message.aspx'">Messages</a></li>
            <li><a href="#" onclick="window.location='Sandbox.aspx'">Sandbox</a> </li>
            <li><a href="#" onclick="window.location='index.aspx'">Logout</a> </li>
         </ul>
<p>
<table border="2" bordercolor=lightgrey align = "center">

<tr>
  <th style="background-color: lightgrey">Technology</th>
  <th style="background-color: lightgrey">Quick link</th>
  </tr>
<tr>
  <td style="background-color: lightgrey">Java</td>
  <td style="background-color: lightgrey"><a href = https://www.tutorialspoint.com/java/>https://www.tutorialspoint.com/java/</a></td>
  </tr>
<tr>
  <td style="background-color: lightgrey">C#</td>
  <td style="background-color: lightgrey"><a href = https://www.tutorialspoint.com/csharp/>https://www.tutorialspoint.com/csharp/</a></td>
</tr>
<tr>
  <td style="background-color: lightgrey">ASP.NET</td>
  <td style="background-color: lightgrey"><a href = https://www.tutorialspoint.com/asp.net/>https://www.tutorialspoint.com/asp.net/</a></td>
</tr>
</p>

        </br>

<p>

<table border="2" bordercolor ="lightgrey" align = "center">

<tr>
  <th style="background-color: lightgrey">Technology</th>
  <th style="background-color: lightgrey">Video link</th>
  </tr>
<tr>
  <td style="background-color: lightgrey">Java</td>
  <td style="background-color: lightgrey"><a href = https://www.youtube.com/watch?v=Hl-zzrqQoSE&list=PLFE2CE09D83EE3E28>https://www.youtube.com/watch?v=Hl-zzrqQoSE&list=PLFE2CE09D83EE3E28</a></td>
  </tr>
<tr>
  <td style="background-color: lightgrey">C#</td>
  <td style="background-color: lightgrey"><a href = https://www.youtube.com/watch?v=_Btekrm9z_M&list=PLo80fWiInSIOCgfhtoPTU63IlNTFErvPs>https://www.youtube.com/watch?v=_Btekrm9z_M&list=PLo80fWiInSIOCgfhtoPTU63IlNTFErvPs</a></td>
</tr>
<tr>
  <td style="background-color: lightgrey">ASP.NET</td>
  <td style="background-color: lightgrey"><a href = https://www.youtube.com/watch?v=3AYoipyqOkQ&list=PL6n9fhu94yhXQS_p1i-HLIftB9Y7Vnxlo>https://www.youtube.com/watch?v=3AYoipyqOkQ&list=PL6n9fhu94yhXQS_p1i-HLIftB9Y7Vnxlo</a></td>
</tr>
</p>

        </form>
</body>
</html>
