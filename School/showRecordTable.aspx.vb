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
        Table1.DataBind()

        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table border='1' cellpadding=4 cellspacing=2 width=70% headertext-align='left'>")
        htmlTable.Append("<tr>")
        For i As Integer = 0 To dt.Columns.Count - 1
            htmlTable.Append("<th>" & dt.Columns(i).ColumnName & "</th>")
        Next
        htmlTable.Append("</tr>")
        For j As Integer = 0 To dt.Rows.Count - 1
            htmlTable.Append("<tr>")
            htmlTable.Append("<td>" & dt.Rows(j)("ST_ID") & "</td>")
            htmlTable.Append("<td>" & dt.Rows(j)("Name") & "</td>")
          
            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        lblResult.Text = htmlTable.ToString()

    End Sub

End Class