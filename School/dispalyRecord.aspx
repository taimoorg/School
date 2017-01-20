<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dispalyRecord.aspx.vb" Inherits="School.dispalyRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

    <title></title>

    <script type="text/javascript">
        $(document).on("click", "[id*=lnkView]", function () {
            $("#id").html($(".ST_ID", $(this).closest("tr")).html());
            $("#name").html($(".Name", $(this).closest("tr")).html());

            $("#dialog").dialog({
                title: "View Details",
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
            return false;
        });
    </script>

    <style>
        .btn {
            background-color: #008CBA; 
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius :12px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <%-- <a class="btn" href="insertData.aspx">ADD NEW STUDENT</a>--%>

            <button class="btn" type="button"onclick="window.location.href='insertData.aspx'">NEW STUDENT</button>

        </div>
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
                CellPadding="5"
                HeaderStyle-BackColor="LightBlue" HeaderStyle-Font="Bold" BorderStyle="Groove">
                <Columns>
                    <asp:BoundField DataField="ST_ID" ItemStyle-CssClass="ST_ID" HeaderText="Id" ItemStyle-Width="30" />
                    <asp:BoundField DataField="Name" ItemStyle-CssClass="Name" HeaderText="Name" ItemStyle-Width="930" />

                    <%--<asp:BoundField DataField="ST_ID" HeaderStyle-HorizontalAlign="Left" HeaderText="ID" ItemStyle-Width="100px" />
                    <asp:BoundField DataField="Name" HeaderStyle-HorizontalAlign="Left" HeaderText="Name" ItemStyle-Width="900px" />--%>
                    <asp:TemplateField HeaderText="View">
                        <ItemTemplate>
                            <asp:LinkButton Text="View" ID="lnkView" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <div id="dialog" style="display: none">
                <b>Id:</b> <span id="id"></span>
                <br />
                <b>Name:</b> <span id="name"></span>
                <br />

            </div>

        </div>
    </form>
</body>
</html>
