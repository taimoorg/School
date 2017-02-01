Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Public Class insertData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim id As Integer
        Dim name As String
        id = 0
        name = txtName.Text
        DataProvider.P_Student_IU(New School.StudentInfo(id, name))

        'Second METHOD

        'Dim obj As New StudentInfo
        'Dim id As Integer
        'obj.ST_ID = id

        'CHANGE MA<E AT FIX ID
        'obj .ST_ID =5

        'obj.Name = txtName.Text
        'DataProvider.P_Student_IU(obj)
        Server.Transfer("showRecordTable.aspx", True)
    End Sub

End Class