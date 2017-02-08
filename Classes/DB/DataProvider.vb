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
         Return CType(objDatabase.ExecuteDataSet("P_Student_IU", Obj.ST_ID, Obj.Name, Obj.Father_Name, Obj.Gender), DataSet).Tables(0).Rows(0).Item(0)
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
   Public Shared Function P_Student_GetByName(Name As String, sOptions As Integer) As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Select Case sOptions
            Case 1
                Name = String.Format("{0}%", Name)
            Case 2
                Name = String.Format("%{0}%", Name)
            Case 3
                Name = String.Format("%{0}", Name)
        End Select
        Return CType(objDatabase.ExecuteDataSet("P_Student_GetByName", Name), DataSet).Tables(0)

    End Function
End Class
