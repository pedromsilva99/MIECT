<Serializable()> Public Class Funcionario
    Private _NIF As String
    Private _oficina As String
    Private _salario As String
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

    Property Oficina() As String
        Get
            Oficina = _oficina
        End Get
        Set(ByVal value As String)
            _oficina = value
        End Set
    End Property

    Property Salario() As String
        Get
            Salario = _salario
        End Get
        Set(ByVal value As String)
            If value Is Nothing Or value = "" Then
                Throw New Exception("Insira o salário")
                Exit Property
            End If
            _salario = value
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

    Property Endereço() As String
        Get
            Endereço = _endereco
        End Get
        Set(ByVal value As String)
            _endereco = value
        End Set
    End Property

    Property Nome() As String
        Get
            Nome = _nome
        End Get
        Set(ByVal value As String)
            _nome = value
        End Set
    End Property

    Property Apelido() As String
        Get
            Apelido = _apelido
        End Get
        Set(ByVal value As String)
            _apelido = value
        End Set
    End Property

    Overrides Function ToString() As String
        Return _NIF & "    Oficina " & _oficina
    End Function

End Class