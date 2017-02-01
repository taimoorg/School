Imports System.Data
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Configuration

Public Class dispalyRecord
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    FillGrid()
    End Sub

    Private Sub FillGrid()
        Dim DT As DataTable

        DT = DataProvider.P_Student_GetAll

        GridView1.DataSource = DT
        GridView1.DataBind()

        'Dim A As New DepartmentInfo
        'A.DEPT_ID = 0
        'A.Name = "fdfd"
        'DepartmentDataProvider.P_Department_IU(A)
    End Sub

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim rowView As DataRowView = CType(e.Row.DataItem, DataRowView)

            Dim L_ST_ID As Integer = rowView("ST_ID")
            Dim Lb As LinkButton
            Dim LbDel As LinkButton

            Lb = e.Row.Cells(0).FindControl("lnkEdit")
            Lb.OnClientClick = String.Format("OpenDialog({0});return false;", L_ST_ID)

            LbDel = e.Row.Cells(0).FindControl("lnkDel")
            LbDel.OnClientClick = String.Format("Del_Record({0});return false;", L_ST_ID)
                
                'AddHandler Lb.Click, AddressOf EditRecord
            Lb.Visible = True
            LbDel.Visible = True
        End If
    End Sub

End Class