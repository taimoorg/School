Imports System.Data
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration
Public Class showRecordTable
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        BindHtmlTable()

    End Sub

    Private Sub BindHtmlTable()
        Dim dt As DataTable
        dt = DataProvider.P_Student_GetAll


        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table  bgcolor='#EAF7F9' border='1' cellpadding=4 cellspacing=2 width=70% >")
        htmlTable.Append("<tr>")

        htmlTable.Append("<th align='left' height='50' >ID</th>")
        htmlTable.Append("<th align='left'>Name</th>")
        htmlTable.Append("<th style ='color:#186A3B' align='left' >Edit</th>")
        htmlTable.Append("<th style ='color:#CC0000' align='left' >Delete</th>")
        htmlTable.Append("</tr>")
        For j As Integer = 0 To dt.Rows.Count - 1
            htmlTable.Append("<tr>")
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append("<td>" & dt.Rows(j)("Name") & "</td>")
            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:#186A3B'>Edit</a></td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        lblResult.Text = htmlTable.ToString()

    End Sub

End Class