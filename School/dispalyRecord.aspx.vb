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
End Class