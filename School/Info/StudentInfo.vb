
Public Class StudentInfo
    Public Property ST_ID As Integer
    Public Property Name As String
    Sub New()

    End Sub
    Sub New(StdID As Integer, stdName As String)
        ST_ID = StdID
        Name = stdName

    End Sub

End Class
