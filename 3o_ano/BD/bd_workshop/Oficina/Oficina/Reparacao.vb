<Serializable()> Public Class Reparacao
    Private _id As String
    Private _preço As String
    Private _veiculo As String
    Private _preçofinal As String
    Private _oficina As String
    Private _data_in As String
    Private _data_out As String
    Private _peça As String
    Private _num_pecas As String

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
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o veículo")
                Exit Property
            End If
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

    Property Peça() As String
        Get
            Peça = _peça
        End Get
        Set(ByVal value As String)
            'If value Is Nothing Or value = "" Then
            'Throw New Exception("Insira a peça")
            'Exit Property
            'End If
            _peça = value
        End Set
    End Property

    Property Num_Pecas() As String
        Get
            Num_Pecas = _num_pecas
        End Get
        Set(ByVal value As String)
            _num_pecas = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _id & "    " & _veiculo
    End Function

End Class