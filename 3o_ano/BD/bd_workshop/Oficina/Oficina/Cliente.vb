<Serializable()> Public Class Cliente
    Private _NIF As String
    Private _parceiro As String
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

    Property Parceiro() As String
        Get
            Parceiro = _parceiro
        End Get
        Set(ByVal value As String)
            'If value Is Nothing Or value = "" Then
            'Throw New Exception("Insira se é parceiro")
            'Exit Property
            'End If
            _parceiro = value
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

    Property Endereco() As String
        Get
            Endereco = _endereco
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
        Return _NIF & "   " & _nome & " " & _apelido
    End Function

    Public Sub New()
        MyBase.New()
    End Sub

    'Public Sub New(ByVal CompanyName As String,
    '               ByVal LastName As String, ByVal FirstName As String)
    '    MyBase.New()
    '    Me.ContactName = LastName & ", " & FirstName
    '    Me.CompanyName = CompanyName
    'End Sub

    'Public Sub New(ByVal CompanyName As String)
    '    MyBase.New()
    '    Me.CompanyName = CompanyName
    'End Sub

End Class
