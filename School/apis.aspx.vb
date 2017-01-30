Imports System.Web.Services
Public Class apis
    Inherits System.Web.UI.Page
    <WebMethod()> _
    Public Shared Function P_Student_GetByST_ID(ST_ID As Integer) As StudentInfo
        Dim Ret As New StudentInfo
        Dim DR As DataRow
        DR = DataProvider.P_Student_GetByST_ID(ST_ID)
        With Ret
            .ST_ID = DR.Item("ST_ID")
            .Name = DR.Item("Name")
        End With
        Return Ret
    End Function

    <WebMethod()> _
    Public Shared Function P_Student_IU(ST_ID As Integer, Name As String) As Integer
        Return DataProvider.P_Student_IU(New StudentInfo(ST_ID, Name))
    End Function

    <WebMethod()> _
Public Shared Function P_Student_Delete(ST_ID As Integer) As Integer
        
        DataProvider.P_Student_Delete(ST_ID)

        Return 1
    End Function

End Class
