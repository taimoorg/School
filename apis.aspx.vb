Imports System.Web.Services
Public Class apis
    Inherits System.Web.UI.Page
    <WebMethod()> _
    Public Shared Function P_Student_GetByST_ID(ST_ID As Integer) As StudentInfo
        Dim Ret As New StudentInfo
        Dim DR As DataRow
        DR = DataProvider.P_Student_GetByST_ID(ST_ID)
        With Ret
            .ST_ID = DR.Item("ST_ID") ' edit by student id 
            .Name = DR.Item("Name")  'return name in the txtfeild   
            .Father_Name = DR.Item("Father_Name") 'retun father name in the txtfeild 
        End With
        Return Ret
    End Function

    <WebMethod()> _
    Public Shared Function P_Student_GetByName(Name As String, sOptions As Integer) As String
        Dim dt As DataTable
        dt = DataProvider.P_Student_GetByName(Name, sOptions)

        Return GetHtmlTable(dt)


    End Function



    <WebMethod()> _
    Public Shared Function P_Student_IU(ST_ID As Integer, Name As String, Father_Name As String) As Integer
        Return DataProvider.P_Student_IU(New StudentInfo(ST_ID, Name, Father_Name))
    End Function

    <WebMethod()> _
    Public Shared Function P_Student_Delete(ST_ID As Integer) As Integer

        DataProvider.P_Student_Delete(ST_ID)

        Return 1
    End Function
    <WebMethod()> _
    Public Shared Function GetStudentTable() As String

        Dim dt As DataTable
        dt = DataProvider.P_Student_GetAll
        Return GetHtmlTable(dt)
    End Function

    Private Shared Function GetHtmlTable(dt As DataTable) As String
        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table  bgcolor='#EAF7F9' border='1' cellpadding=4 cellspacing=2 width=70% >")
        htmlTable.Append("<tr>")

        htmlTable.Append("<th align='left' height='50' >ID</th>")
        htmlTable.Append("<th align='left'>Name</th>")
        htmlTable.Append("<th align='left'>Father Name</th>")
        htmlTable.Append("<th style ='color:#186A3B' align='left' >Edit</th>")
        htmlTable.Append("<th style ='color:#CC0000' align='left' >Delete</th>")
        htmlTable.Append("</tr>")
        For j As Integer = 0 To dt.Rows.Count - 1
            htmlTable.Append("<tr>")
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(j)("Name")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(j)("Father_Name")))
            'htmlTable.Append("<td>" & dt.Rows(j)("Name") & "</td>")
            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:#186A3B'>Edit</a></td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(j)("ST_ID")))
            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        Return htmlTable.ToString()
    End Function

End Class

