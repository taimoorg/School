<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showRecordTable.aspx.vb" Inherits="School.showRecordTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.7.1.min.js"></script>

    <script src="js/jquery-1.8.3.js"></script>
    <link href="css/ui-darkness/jquery-ui-1.9.2.custom.css" rel="stylesheet" />
    <script src="js/jquery-ui-1.9.2.custom.js"></script>
    <link href="css/ui-darkness/jquery-ui-1.9.2.custom.min.css" rel="stylesheet" />
    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>

    <%--    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>--%>


    <script type="text/javascript">

        var editdialog
        $(document).ready(function () {
            SetDialog();
            FillTable();
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
                //data: '{ST_ID: ' + $("#id").html() + ',Name:"' + $("#txtName").val() +'"}',
                data: '{ST_ID: ' + $("#id").html() + ',Name:"' + $("#txtName").val() + '",Father_Name:"'+$("#txtFname").val()+'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $('#overlay').hide();
                    editdialog.dialog("close");
                    FillTable();
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
            //var a = confirm("Do You Want To Delete");
            //if (a) {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_Delete",
                data: '{ST_ID: ' + ST_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    FillTable();
                }

            });
            //return true;
        }
        //else {
        //    return false;
        //}

        //}

        function AddNewSt() {
            $("#id").html(0);
            $("#txtName").val("");
            $("#txtFname").val("");

            editdialog.dialog("open");
        }
        function FillTable() {
            $.ajax({
                type: "POST",
                url: "apis.aspx/GetStudentTable",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $("#divtbl").html(response.d);

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
                    $("#txtFname").val(response.d.Father_Name);

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

        function NameSearch() {
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_GetByName",
                data: '{Name: "' + $("#textbox").val() + '",sOptions:"' + $("#ddlName").val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () { $('#overlay').show(); },
                success: function (response) {
                    $("#divtbl").html(response.d);
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <select id="ddlName">
                <%-- <option value="" disabled="disabled" selected="selected">Select a Option</option>--%>
                <option value="1">Starting with </option>
                <option value="2">containing </option>
                <option value="3">Ending with </option>
            </select>
        </div>
        <br />

        <div>
            <input id="textbox" type="text" />
            <input id="Button1" type="button" value="Filter" onclick="NameSearch()" />
        </div>
        <br />



        <div class="ui-dialog-buttonset">
            <button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" onclick="AddNewSt();return false;">
                <span class="ui-button-text">NEW STUDENT</span></button>
        </div>

        <br />
        <div id="divtbl"></div>

        <div id="dialog" style="display: none">
            <b>Id:</b> <span id="id"></span>
            <br />
            <b>Name:</b>
            <input id="txtName" type="text" />
            <br />
            <b>Father Name:</b>
            <input id="txtFname" type="text" />
        </div>

    </form>
</body>
</html>
