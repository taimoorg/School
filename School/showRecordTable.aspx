<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showRecordTable.aspx.vb" Inherits="School.showRecordTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


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
            var a = confirm("Do You Want To Delete");
            if(a){
            $.ajax({
                type: "POST",
                url: "apis.aspx/P_Student_Delete",
                data: '{ST_ID: ' + ST_ID + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",

            });
            return true;
            }
            else {
                return false;
            }
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="ui-dialog-buttonset">

          <%--  <button type="button"  onclick="AddNewSt();return false;">NEW STUDENT</button>--%>

            <button type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"onclick="AddNewSt();return false;" ><span class="ui-button-text"> NEW STUDENT</span></button>


        </div>
        <br />

        <asp:Label ID="lblResult" runat="server" />
        <div id="dialog" style="display: none">
            <b>Id:</b> <span id="id"></span>
            <br />
            <b>Name:</b>
            <input id="txtName" type="text" />
            <br />
        </div>

    </form>
</body>
</html>
