<Serializable()> Public Class Pessoa
    Private _NIF As String
    Private _telefone As String
    Private _endereco As String
    Private _nome As String
    Private _apelido As String

    Property NIF As String
        Get
            Return _NIF
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o NIF")
                Exit Property
            End If
            _NIF = value
        End Set
    End Property

    Property Telefone() As String
        Get
            Telefone = _telefone
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o telefone")
                Exit Property
            End If
            _telefone = value
        End Set
    End Property

    Property Endereco() As String
        Get
            Endereco = _endereco
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o endereço")
                Exit Property
            End If
            _endereco = value
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

    Property Apelido() As String
        Get
            Apelido = _apelido
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o apelido")
                Exit Property
            End If
            _apelido = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _nome & " " & _apelido
    End Function



End Class
