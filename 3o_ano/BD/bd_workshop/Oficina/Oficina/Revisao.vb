<Serializable()> Public Class Revisao
    Private _id As String
    Private _preço As String
    Private _veiculo As String
    Private _preçofinal As String
    Private _oficina As String
    Private _data_in As String
    Private _data_out As String
    Private _tipo As String

    Property ID As String
        Get
            Return _id
        End Get
        Set(ByVal value As String)
            _id = value
        End Set
    End Property

    Property Veiculo() As String
        Get
            Veiculo = _veiculo
        End Get
        Set(ByVal value As String)
            _veiculo = value
        End Set
    End Property

    Property PreçoFinal() As String
        Get
            PreçoFinal = _preçofinal
        End Get
        Set(ByVal value As String)
            _preçofinal = value
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

    Property Preço() As String
        Get
            Preço = _preço
        End Get
        Set(ByVal value As String)
            _preço = value
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

    Property Tipo() As String
        Get
            Tipo = _tipo
        End Get
        Set(ByVal value As String)
            _tipo = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _id & "    " & _veiculo
    End Function

End Class