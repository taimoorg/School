<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="insertData.aspx.vb" Inherits="School.insertData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label><br />
            <table>

                <tr>
                    <td style="width: 100px">Name:</td>
                    <td style="width: 100px">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Submit" />
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
