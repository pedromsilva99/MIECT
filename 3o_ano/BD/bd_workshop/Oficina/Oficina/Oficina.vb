<Serializable()> Public Class Oficina
    Private _numero As String
    Private _telefone As String
    Private _cidade As String
    Private _email As String
    Private _gerente As String

    Property Numero As String
        Get
            Return _numero
        End Get
        Set(ByVal value As String)
            _numero = value
        End Set
    End Property

    Property Telefone() As String
        Get
            Telefone = _telefone
        End Get
        Set(ByVal value As String)
            _telefone = value
        End Set
    End Property

    Property Cidade() As String
        Get
            Cidade = _cidade
        End Get
        Set(ByVal value As String)
            _cidade = value
        End Set
    End Property

    Property Email() As String
        Get
            Email = _email
        End Get
        Set(ByVal value As String)
            _email = value
        End Set
    End Property

    Property Gerente() As String
        Get
            Gerente = _gerente
        End Get
        Set(ByVal value As String)
            _gerente = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _numero & "    " & _cidade
    End Function

End Class