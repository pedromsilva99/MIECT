<Serializable()> Public Class Veiculo
    Private _matricula As String
    Private _marca As String
    Private _tipo As String
    Private _dono As String
    Private _oficina As String
    Private _data_in As String
    Private _data_out As String

    Property Matricula As String
        Get
            Return _matricula
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira a matricula")
                Exit Property
            End If
            _matricula = value
        End Set
    End Property

    Property Marca() As String
        Get
            Marca = _marca
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira a marca")
                Exit Property
            End If
            _marca = value
        End Set
    End Property

    Property Tipo() As String
        Get
            Tipo = _tipo
        End Get
        Set(ByVal value As String)
            _tipo = value
        End Set
    End Property

    Property Dono() As String
        Get
            Dono = _dono
        End Get
        Set(ByVal value As String)
            _dono = value
        End Set
    End Property

    Property Oficina() As String
        Get
            Oficina = _oficina
        End Get
        Set(ByVal value As String)
            _oficina = value
        End Set
    End Property

    Property Data_In() As String
        Get
            Data_In = _data_in
        End Get
        Set(ByVal value As String)
            _data_in = value
        End Set
    End Property

    Property Data_Out() As String
        Get
            Data_Out = _data_out
        End Get
        Set(ByVal value As String)
            _data_out = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _matricula & "    " & _marca
    End Function

End Class