﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CS_006.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            width: 42%;
        }
        .auto-style4 {
            background-color: #FFFF66;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1 style="font-family: Arial, Helvetica, sans-serif">Head Line 1</h1>
    <h2>Head Line 2</h2>
    <h3>Head Line 3</h3>
    <h4>Head Line 4</h4>
    <h5>Head Line 5</h5>
    <h6>Head Line 6</h6>
    <p class="auto-style1">
        This is some text that I want to <span class="auto-style2">apply</span> some style to.</p>
    <p>
        &nbsp;</p>

    <div>

        <a href="http://www.learnvisualstudio.net">Add a hyperlink</a><br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="http://www.microsoft.com" Target="_blank">This is another hyperlink</asp:HyperLink>
        <br />
        <br />

    </div>
        <asp:Image ID="Image1" runat="server" BorderStyle="Groove" Height="137px" Width="141px" ImageUrl="~/yunmi.jpg" />
        <br />
        <br />
        <br />
    </form>
    <table class="auto-style3">
        <tr>
            <td>Player</td>
            <td>Year</td>
            <td>Home Runs</td>
        </tr>
        <tr>
            <td>Sammy Sosa</td>
            <td>2005</td>
            <td>100</td>
        </tr>
        <tr>
            <td>Mark MacGuire</td>
            <td>2005</td>
            <td>102</td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <ol>
        <li>First&nbsp; Item</li>
        <li>Second Item</li>
        <li>Third Item</li>
    </ol>
    <ul>
        <li class="auto-style4">This is an idea</li>
        <li class="auto-style4">This is an equally good idea</li>
        <li class="auto-style4">Yet one more idea to consider</li>
    </ul>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
