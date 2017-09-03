<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MyFirstChallenge._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            How old are you?&nbsp;
            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
            <br />
            <br />
            How much money do you have in your pocket?&nbsp;
            <asp:TextBox ID="txtCash" runat="server" OnTextChanged="txtCash_TextChanged"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnFortune" runat="server" OnClick="btnFortune_Click" Text="Click Me to See Your Fortune" />
            <br />
            <br />
            <asp:Label ID="lblSarcasm" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
