Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class DataProvider

    Sub New()
    End Sub

    Public Shared Function P_Student_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_GetAll"), DataSet).Tables(0)
    End Function
    Public Shared Function P_Student_IU(Obj As StudentInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_IU", Obj.ST_ID, Obj.Name), DataSet).Tables(0).Rows(0).Item(0)
    End Function
    Public Shared Function P_Student_GetByST_ID(ST_ID As Integer) As DataRow
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Student_GetByST_ID", ST_ID), DataSet).Tables(0).Rows(0)
    End Function
    Public Shared Sub P_Student_Delete(ST_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Student_Delete", ST_ID)
    End Sub

End Class
