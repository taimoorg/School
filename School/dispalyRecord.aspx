<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dispalyRecord.aspx.vb" Inherits="School.dispalyRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />

    <title></title>
    <script type="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
        });
        function SetDialog() {
            editdialog = $("#dialog").dialog({
                autoOpen: false,
                title: "View Details",
                modal: true,
                buttons: {
                    "Save": SaveData,
                    Cancel: function () {
                        $(this).dialog("close");
                    }
                },

            });
        }

            function SaveData() {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_IU",
                data: '{ST_ID: ' + $("#id").html() + ',Name:"' + $("#txtName").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }

        function Del_Record(ST_ID) {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_Delete",
                data: '{ST_ID: ' + ST_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
 
            });
        }

        function AddNewSt() {
            $("#id").html(0);
            $("#txtName").val("");

            editdialog.dialog("open");
        }

        function OpenDialog(ST_ID) {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_GetByST_ID",
                data: '{ST_ID: ' + ST_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    $("#id").html(response.d.ST_ID);
                    $("#txtName").val(response.d.Name);

                    editdialog.dialog("open");

                },
                failure: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                },
                error: function (response) {
                    $('#overlay').hide();
                    alert(response.d);
                }
            });
        }
    </script>

    <style>
        .btn {
            background-color: #008CBA;
            border: none;
            color: white;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <%-- <a class="btn" href="insertData.aspx">ADD NEW STUDENT</a>--%>

            <button class="btn" type="button" onclick="AddNewSt();return false;">NEW STUDENT</button>

        </div>
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="5"
                HeaderStyle-BackColor="LightBlue" HeaderStyle-Font="Bold" BorderStyle="Groove" DataKeyNames="ST_ID">
                
                <Columns>
                    <asp:BoundField DataField="ST_ID" ItemStyle-CssClass="ST_ID" HeaderText="Id" ItemStyle-Width="30" />
                    <asp:BoundField DataField="Name" ItemStyle-CssClass="Name" HeaderText="Name" ItemStyle-Width="930" />

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton Text="Edit" ID="lnkEdit" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton Text="Delete" ID="lnkDel" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <div id="dialog" style="display: none">
                <b>Id:</b> <span id="id"></span>
                <br />
                <b>Name:</b>
                <input id="txtName" type="text" />
                <br />

            </div>

        </div>
    </form>
</body>
</html>
