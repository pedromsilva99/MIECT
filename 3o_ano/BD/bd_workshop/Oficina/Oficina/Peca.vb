<Serializable()> Public Class Peca
    Private _referencia As String
    Private _nome As String
    Private _preço As String
    Private _numstock As String
    Private _numCompra As String

    Property Referencia As String
        Get
            Return _referencia
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira a referência")
                Exit Property
            End If
            _referencia = value
        End Set
    End Property

    Property Nome() As String
        Get
            Nome = _nome
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o nome")
                Exit Property
            End If
            _nome = value
        End Set
    End Property

    Property Preço() As String
        Get
            Preço = _preço
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o preço")
                Exit Property
            End If
            _preço = value
        End Set
    End Property

    Property Num_Stock() As String
        Get
            Num_Stock = _numstock
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o numero em stock")
                Exit Property
            End If
            _numstock = value
        End Set
    End Property

    Property NumCompra() As String
        Get
            NumCompra = _numCompra
        End Get
        Set(ByVal value As String)
            'If value Is Nothing Or value = "" Then
            '    Throw New Exception("Insira o numero de peças que comprou")
            '    Exit Property
            'End If
            _numCompra = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _referencia & "      " & _nome
    End Function

End Class