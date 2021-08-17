Imports System.IO
Imports System.Runtime.Serialization.Formatters.Binary
Imports System.Data.SqlClient

Public Class Form1

    Dim CN As SqlConnection
    Dim CMD As SqlCommand
    'Dim CMD2 As SqlCommand
    Dim currentCliente As Integer
    Dim currentPessoa As Integer
    Dim currentMecanico As Integer
    Dim currentGerente As Integer
    Dim currentVeiculo As Integer
    Dim currentServiço As Integer
    Dim currentFuncionario As Integer
    Dim currentPeca As Integer
    Dim currentReparacao As Integer
    Dim currentRevisao As Integer
    Dim currentOficina As Integer
    Dim adding As Boolean
    Dim compra As Boolean
    Dim motociclo1 As String = "Motociclo"
    Dim ligeiro1 As String = "Ligeiro"
    Dim pesado1 As String = "Pesado"
    Dim pesqCliente As String
    Dim pesqFunc As String
    Dim pesqVeiculo As String
    Dim pesqServico As String
    Dim pesqPeca As String
    Dim verServicos As String
    ''Apenas se pode ler
    Sub LockControls()
        TextBoxNIF.ReadOnly = True
        TextBoxParceiro.ReadOnly = True
        TextBoxNome.ReadOnly = True
        TextBoxApelido.ReadOnly = True
        TextBoxEndereço.ReadOnly = True
        TextBoxTelefone.ReadOnly = True
        TextBoxTipo.ReadOnly = True
        TextBoxMatricula.ReadOnly = True
        TextBoxMarca.ReadOnly = True
        TextBoxDono.ReadOnly = True
        TextBoxOficina.ReadOnly = True
        TextBoxEntrada.ReadOnly = True
        TextBoxSaida.ReadOnly = True
        TextBoxSalario.ReadOnly = True
        TextBoxOficina2.ReadOnly = True
        TextBoxNIF2.ReadOnly = True
        TextBoxReferencia.ReadOnly = True
        TextBoxPreço2.ReadOnly = True
        TextBoxNome2.ReadOnly = True
        TextBoxNumStock.ReadOnly = True
        TextBoxPeças.ReadOnly = True
        TextBoxTipoRevisao.ReadOnly = True
        TextBoxNumeroOf.ReadOnly = True
        TextBoxTelefoneOf.ReadOnly = True
        TextBoxCidadeOf.ReadOnly = True
        TextBoxEmailOf.ReadOnly = True
        TextBoxGerenteOf.ReadOnly = True
        TextBoxPrecoFinal.ReadOnly = True
        TextBoxNumPecas.ReadOnly = True
        ComboBoxParceiro.Enabled = True
        ComboBoxParceiro.Visible = False
        ComboBoxTipo.Visible = False
        ComboBoxTipo.Enabled = True
        TextBox_MecanicoServico.ReadOnly = True
    End Sub

    ''Também se pode escrever
    Sub UnlockEditControls()
        TextBoxParceiro.ReadOnly = False
        TextBoxNome.ReadOnly = False
        TextBoxApelido.ReadOnly = False
        TextBoxEndereço.ReadOnly = False
        TextBoxTelefone.ReadOnly = False
        'TextBoxTipo.ReadOnly = False
        TextBoxMarca.ReadOnly = False
        TextBoxDono.ReadOnly = False
        TextBoxOficina.ReadOnly = False
        TextBoxEntrada.ReadOnly = False
        TextBoxSaida.ReadOnly = False
        TextBoxSalario.ReadOnly = False
        TextBoxOficina2.ReadOnly = False
        TextBoxNIF2.ReadOnly = False
        TextBoxPreço2.ReadOnly = False
        TextBoxNome2.ReadOnly = False
        TextBoxNumStock.ReadOnly = False
        TextBoxPeças.ReadOnly = False
        TextBoxTipoRevisao.ReadOnly = False
        TextBoxNumeroOf.ReadOnly = False
        TextBoxTelefoneOf.ReadOnly = False
        TextBoxCidadeOf.ReadOnly = False
        TextBoxEmailOf.ReadOnly = False
        TextBoxGerenteOf.ReadOnly = False
        TextBoxPrecoFinal.ReadOnly = False
        ComboBoxParceiro.Enabled = True
        ComboBoxTipo.Visible = False
        ComboBoxTipo.Enabled = False
        TextBox_MecanicoServico.ReadOnly = False
    End Sub

    Sub UnlockAddControls()
        TextBoxNIF.ReadOnly = False
        TextBoxParceiro.ReadOnly = False
        TextBoxNome.ReadOnly = False
        TextBoxApelido.ReadOnly = False
        TextBoxEndereço.ReadOnly = False
        TextBoxTelefone.ReadOnly = False
        'TextBoxTipo.ReadOnly = False
        TextBoxMatricula.ReadOnly = False
        TextBoxMarca.ReadOnly = False
        TextBoxDono.ReadOnly = False
        TextBoxOficina.ReadOnly = False
        TextBoxEntrada.ReadOnly = False
        TextBoxSaida.ReadOnly = False
        TextBoxSalario.ReadOnly = False
        TextBoxOficina2.ReadOnly = False
        TextBoxNIF2.ReadOnly = False
        TextBoxReferencia.ReadOnly = False
        TextBoxPreço2.ReadOnly = False
        TextBoxNome2.ReadOnly = False
        TextBoxNumStock.ReadOnly = False
        TextBoxPeças.ReadOnly = False
        TextBoxTipoRevisao.ReadOnly = False
        'TextBoxNumeroOf.ReadOnly = False
        TextBoxTelefoneOf.ReadOnly = False
        TextBoxCidadeOf.ReadOnly = False
        TextBoxEmailOf.ReadOnly = False
        TextBoxGerenteOf.ReadOnly = False
        'TextBoxPrecoFinal.ReadOnly = False
        TextBoxNumPecas.ReadOnly = False
        ComboBoxParceiro.Enabled = True
        ComboBoxTipo.Enabled = True
        TextBox_MecanicoServico.ReadOnly = False
    End Sub

    'Limpar os campos de texto
    Sub ClearFields()
        TextBoxNIF.Text = ""
        TextBoxParceiro.Text = ""
        TextBoxNome.Text = ""
        TextBoxApelido.Text = ""
        TextBoxEndereço.Text = ""
        TextBoxTelefone.Text = ""
        TextBoxTipo.Text = ""
        TextBoxMatricula.Text = ""
        TextBoxMarca.Text = ""
        TextBoxDono.Text = ""
        TextBoxOficina.Text = ""
        TextBoxEntrada.Text = ""
        TextBoxSaida.Text = ""
        TextBoxSalario.Text = ""
        TextBoxOficina2.Text = ""
        TextBoxNIF2.Text = ""
        TextBoxReferencia.Text = ""
        TextBoxPreço2.Text = ""
        TextBoxNome2.Text = ""
        TextBoxNumStock.Text = ""
        TextBoxPeças.Text = ""
        TextBoxTipoRevisao.Text = ""
        TextBoxNumeroOf.Text = ""
        TextBoxTelefoneOf.Text = ""
        TextBoxCidadeOf.Text = ""
        TextBoxEmailOf.Text = ""
        TextBoxGerenteOf.Text = ""
        TextBoxPrecoFinal.Text = ""
        TextBoxComprar.Text = ""
        TextBoxNumPecas.Text = ""
        ComboBoxParceiro.SelectedIndex = 0
        ComboBoxTipo.SelectedIndex = 0
        TextBox_MecanicoServico.Text = ""
    End Sub

    'Esconder todos os campos
    Sub HideEverything()
        TextBoxNIF.Visible = False
        TextBoxParceiro.Visible = False
        TextBoxNome.Visible = False
        TextBoxApelido.Visible = False
        TextBoxEndereço.Visible = False
        TextBoxTelefone.Visible = False
        TextBoxTipo.Visible = False
        TextBoxMatricula.Visible = False
        TextBoxMarca.Visible = False
        TextBoxDono.Visible = False
        TextBoxOficina.Visible = False
        TextBoxEntrada.Visible = False
        TextBoxSaida.Visible = False
        TextBoxSalario.Visible = False
        TextBoxOficina2.Visible = False
        TextBoxNIF2.Visible = False
        TextBoxReferencia.Visible = False
        TextBoxPreço2.Visible = False
        TextBoxNome2.Visible = False
        TextBoxNumStock.Visible = False
        TextBoxPeças.Visible = False
        TextBoxTipoRevisao.Visible = False
        TextBoxNumeroOf.Visible = False
        TextBoxTelefoneOf.Visible = False
        TextBoxCidadeOf.Visible = False
        TextBoxEmailOf.Visible = False
        TextBoxGerenteOf.Visible = False
        TextBoxPrecoFinal.Visible = False
        TextBoxComprar.Visible = False
        TextBoxNumPecas.Visible = False
        LabelNIF.Visible = False
        LabelParceiro.Visible = False
        LabelNome.Visible = False
        LabelApelido.Visible = False
        LabelEndereço.Visible = False
        LabelTelefone.Visible = False
        LabelDono.Visible = False
        LabelMatrícula.Visible = False
        LabelMarca.Visible = False
        LabelTipo.Visible = False
        LabelOficina.Visible = False
        LabelDataIn.Visible = False
        LabelDataSaida.Visible = False
        LabelID.Visible = False
        LabelPreço.Visible = False
        LabelPreçoFinal.Visible = False
        LabelVeículo.Visible = False
        LabelSalario.Visible = False
        LabelNIF2.Visible = False
        LabelOficina2.Visible = False
        LabelReferencia.Visible = False
        LabelNome2.Visible = False
        LabelPreço2.Visible = False
        LabelNumStock.Visible = False
        LabelPeças.Visible = False
        LabelTipoRevisao.Visible = False
        LabelNumeroOf.Visible = False
        LabelTelefoneOf.Visible = False
        LabelCidadeOf.Visible = False
        LabelEmailOf.Visible = False
        LabelGerenteOf.Visible = False
        LabelBonus.Visible = False
        LabelEspecialidade.Visible = False
        LabelNumPecas.Visible = False
        ListBoxCliente.Visible = False
        ListBoxPessoa.Visible = False
        ListBoxMecanico.Visible = False
        ListBoxGerente.Visible = False
        ListBoxVeiculo.Visible = False
        ListBoxServiço.Visible = False
        ListBoxFuncionario.Visible = False
        ListBoxPeca.Visible = False
        ListBoxReparacao.Visible = False
        ListBoxRevisao.Visible = False
        ListBoxOficina.Visible = False
        ButtonAdicionarCliente.Visible = False
        ButtonEditarCliente.Visible = False
        ButtonEliminarCliente.Visible = False
        ButtonCancelarCliente.Visible = False
        ButtonOKCliente.Visible = False
        ButtonAdicionarVeiculo.Visible = False
        ButtonEditarVeiculo.Visible = False
        ButtonEliminarVeiculo.Visible = False
        ButtonCancelarVeiculo.Visible = False
        ButtonOKVeiculo.Visible = False
        ButtonAdicionarPeca.Visible = False
        ButtonEditarPeca.Visible = False
        ButtonEliminarPeca.Visible = False
        ButtonCancelarPeca.Visible = False
        ButtonOKPeca.Visible = False
        ButtonAdicionarOficina.Visible = False
        ButtonEditarOficina.Visible = False
        ButtonEliminarOficina.Visible = False
        ButtonOKOficina.Visible = False
        ButtonCancelarOficina.Visible = False
        ButtonAdicionarRevisao.Visible = False
        ButtonEditarRevisao.Visible = False
        ButtonEliminarRevisao.Visible = False
        ButtonOKRevisao.Visible = False
        ButtonCancelarRevisao.Visible = False
        ButtonAdicionarReparacao.Visible = False
        ButtonEditarReparacao.Visible = False
        ButtonEliminarReparacao.Visible = False
        ButtonOKReparacao.Visible = False
        ButtonCancelarReparacao.Visible = False
        ButtonAdicionarGerente.Visible = False
        ButtonEditarGerente.Visible = False
        ButtonEliminarGerente.Visible = False
        ButtonOKGerente.Visible = False
        ButtonCancelarGerente.Visible = False
        ButtonAdicionarMecanico.Visible = False
        ButtonEditarMecanico.Visible = False
        ButtonEliminarMecanico.Visible = False
        ButtonOKMecanico.Visible = False
        ButtonCancelarMecanico.Visible = False
        ButtonComprar.Visible = False
        ButtonConfirmarCompra.Visible = False
        ButtonPesquisarCliente.Visible = False
        ButtonPesquisarFunc.Visible = False
        ButtonPesquisarPeca.Visible = False
        ButtonPesquisarServico.Visible = False
        ButtonPesquisarVeiculo.Visible = False
        ComboBoxParceiro.Visible = False
        ComboBoxTipo.Visible = False

        LabelOrdenadosView.Visible = False
        LabelOficinaView.Visible = False
        LabelFuncionariosView.Visible = False
        LabelLucroView.Visible = False
        ListBoxView.Visible = False
        ButtonLucroOficina.Visible = False
        ButtonTotalOrdenados.Visible = False

        TextBoxPesquisarCliente.Visible = False
        LabelPesquisarCliente.Visible = False
        ButtonPesqCliente.Visible = False
        TextBoxPesquisarFunc.Visible = False
        LabelPesquisarFunc.Visible = False
        ButtonPesqFunc.Visible = False
        TextBoxPesquisarVeiculo.Visible = False
        LabelPesquisarVeiculo.Visible = False
        ButtonPesqVeiculo.Visible = False
        TextBoxPesquisarPeca.Visible = False
        LabelPesquisarPeca.Visible = False
        ButtonPesqPeca.Visible = False
        TextBoxPesquisarServico.Visible = False
        LabelPesquisarServico.Visible = False
        ButtonPesqServico.Visible = False
        ButtonVerServicos.Visible = False

        TextBox_MecanicoServico.Visible = False
        Label_MecanicoServico.Visible = False
    End Sub

    Sub Hide3ButtonsCliente()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarCliente.Visible = False
        ButtonEditarCliente.Visible = False
        ButtonEliminarCliente.Visible = False
        ButtonCancelarCliente.Visible = True
        ButtonOKCliente.Visible = True

        ComboBoxParceiro.Visible = True
    End Sub

    Sub Show3ButtonsCliente()
        LockControls()
        ButtonAdicionarCliente.Visible = True
        ButtonEditarCliente.Visible = True
        ButtonEliminarCliente.Visible = True
        ButtonCancelarCliente.Visible = False
        ButtonOKCliente.Visible = False

        ComboBoxParceiro.Visible = False
    End Sub

    Sub Hide3ButtonsVeiculo()

        ButtonAdicionarVeiculo.Visible = False
        ButtonEditarVeiculo.Visible = False
        ButtonEliminarVeiculo.Visible = False
        ButtonCancelarVeiculo.Visible = True
        ButtonOKVeiculo.Visible = True
        ComboBoxTipo.Visible = True
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If
    End Sub

    Sub Show3ButtonsVeiculo()
        LockControls()
        ButtonAdicionarVeiculo.Visible = True
        ButtonEditarVeiculo.Visible = True
        ButtonEliminarVeiculo.Visible = True
        ButtonCancelarVeiculo.Visible = False
        ButtonOKVeiculo.Visible = False
        ComboBoxTipo.Visible = False
    End Sub

    Sub Hide3ButtonsPeca()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarPeca.Visible = False
        ButtonEditarPeca.Visible = False
        ButtonEliminarPeca.Visible = False
        ButtonCancelarPeca.Visible = True
        ButtonOKPeca.Visible = True
        ButtonComprar.Visible = False
    End Sub

    Sub Show3ButtonsPeca()
        LockControls()
        ButtonAdicionarPeca.Visible = True
        ButtonEditarPeca.Visible = True
        ButtonEliminarPeca.Visible = True
        ButtonCancelarPeca.Visible = False
        ButtonOKPeca.Visible = False
        ButtonComprar.Visible = True
        ButtonConfirmarCompra.Visible = False
        TextBoxComprar.Visible = False
    End Sub

    Sub ShowComprarPeca()
        ButtonAdicionarPeca.Visible = False
        ButtonEditarPeca.Visible = False
        ButtonEliminarPeca.Visible = False
        ButtonCancelarPeca.Visible = False
        ButtonOKPeca.Visible = False
        ButtonComprar.Visible = False
        ButtonConfirmarCompra.Visible = True
        TextBoxComprar.Visible = True
    End Sub

    Sub Hide3ButtonsOficina()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarOficina.Visible = False
        ButtonEditarOficina.Visible = False
        ButtonEliminarOficina.Visible = False
        ButtonOKOficina.Visible = True
        ButtonCancelarOficina.Visible = True
    End Sub

    Sub Show3ButtonsOficina()
        LockControls()
        ButtonAdicionarOficina.Visible = True
        ButtonEditarOficina.Visible = True
        ButtonEliminarOficina.Visible = True
        ButtonOKOficina.Visible = False
        ButtonCancelarOficina.Visible = False
    End Sub

    Sub Hide3ButtonsRevisao()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarRevisao.Visible = False
        ButtonEditarRevisao.Visible = False
        ButtonEliminarRevisao.Visible = False
        ButtonOKRevisao.Visible = True
        ButtonCancelarRevisao.Visible = True
    End Sub

    Sub Show3ButtonsRevisao()
        LockControls()
        ButtonAdicionarRevisao.Visible = True
        ButtonEditarRevisao.Visible = True
        ButtonEliminarRevisao.Visible = True
        ButtonOKRevisao.Visible = False
        ButtonCancelarRevisao.Visible = False
    End Sub

    Sub Hide3ButtonsReparacao()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarReparacao.Visible = False
        ButtonEditarReparacao.Visible = False
        ButtonEliminarReparacao.Visible = False
        ButtonOKReparacao.Visible = True
        ButtonCancelarReparacao.Visible = True
    End Sub

    Sub Show3ButtonsReparacao()
        LockControls()
        ButtonAdicionarReparacao.Visible = True
        ButtonEditarReparacao.Visible = True
        ButtonEliminarReparacao.Visible = True
        ButtonOKReparacao.Visible = False
        ButtonCancelarReparacao.Visible = False
    End Sub

    Sub Hide3ButtonsGerente()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarGerente.Visible = False
        ButtonEditarGerente.Visible = False
        ButtonEliminarGerente.Visible = False
        ButtonOKGerente.Visible = True
        ButtonCancelarGerente.Visible = True
    End Sub

    Sub Show3ButtonsGerente()
        LockControls()
        ButtonAdicionarGerente.Visible = True
        ButtonEditarGerente.Visible = True
        ButtonEliminarGerente.Visible = True
        ButtonOKGerente.Visible = False
        ButtonCancelarGerente.Visible = False
    End Sub

    Sub Hide3ButtonsMecanico()
        If adding Then
            UnlockAddControls()
        End If
        If adding = False Then
            UnlockEditControls()
        End If

        ButtonAdicionarMecanico.Visible = False
        ButtonEditarMecanico.Visible = False
        ButtonEliminarMecanico.Visible = False
        ButtonOKMecanico.Visible = True
        ButtonCancelarMecanico.Visible = True
    End Sub

    Sub Show3ButtonsMecanico()
        LockControls()
        ButtonAdicionarMecanico.Visible = True
        ButtonEditarMecanico.Visible = True
        ButtonEliminarMecanico.Visible = True
        ButtonOKMecanico.Visible = False
        ButtonCancelarMecanico.Visible = False
    End Sub


    'Ao entrar no cliente mostrar os seus Labels e Campos de texto
    Sub ShowClienteButtons()
        TextBoxNIF.Visible = True
        TextBoxParceiro.Visible = True
        TextBoxNome.Visible = True
        TextBoxApelido.Visible = True
        TextBoxEndereço.Visible = True
        TextBoxTelefone.Visible = True
        LabelNIF.Visible = True
        LabelParceiro.Visible = True
        LabelNome.Visible = True
        LabelApelido.Visible = True
        LabelEndereço.Visible = True
        LabelTelefone.Visible = True
        ListBoxCliente.Visible = True
        ButtonAdicionarCliente.Visible = True
        ButtonEditarCliente.Visible = True
        ButtonEliminarCliente.Visible = True
        ComboBoxParceiro.Visible = True
        LockControls()
    End Sub

    'Ao entrar na pessoa mostrar os seus Labels e Campos de Texto
    Sub ShowPessoaButtons()
        TextBoxNIF.Visible = True
        TextBoxNome.Visible = True
        TextBoxApelido.Visible = True
        TextBoxEndereço.Visible = True
        TextBoxTelefone.Visible = True
        LabelNIF.Visible = True
        LabelNome.Visible = True
        LabelApelido.Visible = True
        LabelEndereço.Visible = True
        LabelTelefone.Visible = True
        ListBoxPessoa.Visible = True
        LockControls()
    End Sub

    Sub ShowMecanicoButtons()
        TextBoxNIF.Visible = True
        TextBoxParceiro.Visible = True
        TextBoxNome.Visible = True
        TextBoxApelido.Visible = True
        TextBoxEndereço.Visible = True
        TextBoxTelefone.Visible = True
        TextBoxOficina2.Visible = True
        TextBoxSalario.Visible = True
        LabelNIF.Visible = True
        LabelEspecialidade.Visible = True
        LabelNome.Visible = True
        LabelApelido.Visible = True
        LabelEndereço.Visible = True
        LabelTelefone.Visible = True
        LabelOficina2.Visible = True
        LabelSalario.Visible = True
        ListBoxMecanico.Visible = True
        ButtonVerServicos.Visible = True
        LockControls()
        Show3ButtonsMecanico()
    End Sub

    Sub ShowGerenteButtons()
        TextBoxNIF.Visible = True
        TextBoxParceiro.Visible = True
        TextBoxNome.Visible = True
        TextBoxApelido.Visible = True
        TextBoxEndereço.Visible = True
        TextBoxTelefone.Visible = True
        TextBoxOficina2.Visible = True
        TextBoxSalario.Visible = True
        LabelNIF.Visible = True
        LabelBonus.Visible = True
        LabelNome.Visible = True
        LabelApelido.Visible = True
        LabelEndereço.Visible = True
        LabelTelefone.Visible = True
        LabelOficina2.Visible = True
        LabelSalario.Visible = True
        ListBoxGerente.Visible = True
        LockControls()
        Show3ButtonsGerente()
    End Sub

    Sub ShowVeiculoButtons()
        TextBoxTipo.Visible = True
        TextBoxMatricula.Visible = True
        TextBoxMarca.Visible = True
        TextBoxDono.Visible = True
        TextBoxOficina.Visible = True
        TextBoxEntrada.Visible = True
        TextBoxSaida.Visible = True
        LabelDono.Visible = True
        LabelMatrícula.Visible = True
        LabelMarca.Visible = True
        LabelTipo.Visible = True
        LabelOficina.Visible = True
        LabelDataIn.Visible = True
        LabelDataSaida.Visible = True
        ListBoxVeiculo.Visible = True
        Show3ButtonsVeiculo()
        LockControls()
    End Sub

    Sub ShowServiçoButtons()
        TextBoxTipo.Visible = True
        TextBoxMatricula.Visible = True
        TextBoxMarca.Visible = True
        TextBoxPrecoFinal.Visible = True
        TextBoxOficina.Visible = True
        TextBoxEntrada.Visible = True
        TextBoxSaida.Visible = True
        LabelPreço.Visible = True
        LabelVeículo.Visible = True
        LabelPreçoFinal.Visible = True
        LabelID.Visible = True
        LabelOficina.Visible = True
        LabelDataIn.Visible = True
        LabelDataSaida.Visible = True
        ListBoxServiço.Visible = True
        LockControls()
    End Sub

    Sub ShowFuncionarioButtons()
        TextBoxOficina2.Visible = True
        TextBoxSalario.Visible = True
        TextBoxNIF2.Visible = True
        LabelOficina2.Visible = True
        LabelSalario.Visible = True
        LabelNIF2.Visible = True
        ListBoxFuncionario.Visible = True
        LockControls()
    End Sub

    Sub ShowPecaButtons()
        TextBoxPreço2.Visible = True
        TextBoxReferencia.Visible = True
        TextBoxNome2.Visible = True
        TextBoxNumStock.Visible = True
        LabelNumStock.Visible = True
        LabelPreço2.Visible = True
        LabelReferencia.Visible = True
        LabelNome2.Visible = True
        ListBoxPeca.Visible = True
        Show3ButtonsPeca()
        LockControls()
    End Sub

    Sub ShowReparacaoButtons()
        TextBoxTipo.Visible = True
        TextBoxMatricula.Visible = True
        TextBoxMarca.Visible = True
        TextBoxPrecoFinal.Visible = True
        TextBoxOficina.Visible = True
        TextBoxEntrada.Visible = True
        TextBoxSaida.Visible = True
        TextBoxPeças.Visible = True
        TextBoxNumPecas.Visible = True
        LabelPreço.Visible = True
        LabelVeículo.Visible = True
        LabelPreçoFinal.Visible = True
        LabelID.Visible = True
        LabelOficina.Visible = True
        LabelDataIn.Visible = True
        LabelDataSaida.Visible = True
        LabelPeças.Visible = True
        LabelNumPecas.Visible = True
        ListBoxReparacao.Visible = True
        TextBox_MecanicoServico.Visible = True
        Label_MecanicoServico.Visible = True
        LockControls()
        Show3ButtonsReparacao()
    End Sub

    Sub ShowRevisaoButtons()
        TextBoxTipo.Visible = True
        TextBoxMatricula.Visible = True
        TextBoxMarca.Visible = True
        TextBoxPrecoFinal.Visible = True
        TextBoxOficina.Visible = True
        TextBoxEntrada.Visible = True
        TextBoxSaida.Visible = True
        TextBoxTipoRevisao.Visible = True
        LabelPreço.Visible = True
        LabelVeículo.Visible = True
        LabelPreçoFinal.Visible = True
        LabelID.Visible = True
        LabelOficina.Visible = True
        LabelDataIn.Visible = True
        LabelDataSaida.Visible = True
        LabelTipoRevisao.Visible = True
        ListBoxRevisao.Visible = True
        TextBox_MecanicoServico.Visible = True
        Label_MecanicoServico.Visible = True
        LockControls()
        Show3ButtonsRevisao()
    End Sub

    Sub ShowOficinaButtons()
        TextBoxNumeroOf.Visible = True
        TextBoxTelefoneOf.Visible = True
        TextBoxCidadeOf.Visible = True
        TextBoxEmailOf.Visible = True
        TextBoxGerenteOf.Visible = True
        LabelNumeroOf.Visible = True
        LabelTelefoneOf.Visible = True
        LabelCidadeOf.Visible = True
        LabelEmailOf.Visible = True
        LabelGerenteOf.Visible = True
        ListBoxOficina.Visible = True
        Show3ButtonsOficina()
        LockControls()
    End Sub

    Sub ShowPesquisaClienteButtons()
        ButtonPesquisarFunc.Visible = False
        ButtonPesquisarPeca.Visible = False
        ButtonPesquisarServico.Visible = False
        ButtonPesquisarVeiculo.Visible = False
        TextBoxPesquisarCliente.Visible = True
        LabelPesquisarCliente.Visible = True
        ButtonPesqCliente.Visible = True

    End Sub

    Sub ShowPesquisaFuncButtons()
        ButtonPesquisarCliente.Visible = False
        ButtonPesquisarPeca.Visible = False
        ButtonPesquisarServico.Visible = False
        ButtonPesquisarVeiculo.Visible = False
        TextBoxPesquisarFunc.Visible = True
        LabelPesquisarFunc.Visible = True
        ButtonPesqFunc.Visible = True

    End Sub

    Sub ShowPesquisaVeiculoButtons()
        ButtonPesquisarCliente.Visible = False
        ButtonPesquisarFunc.Visible = False
        ButtonPesquisarPeca.Visible = False
        ButtonPesquisarServico.Visible = False
        TextBoxPesquisarVeiculo.Visible = True
        LabelPesquisarVeiculo.Visible = True
        ButtonPesqVeiculo.Visible = True
    End Sub

    Sub ShowPesquisaServicoButtons()
        ButtonPesquisarCliente.Visible = False
        ButtonPesquisarFunc.Visible = False
        ButtonPesquisarPeca.Visible = False
        ButtonPesquisarVeiculo.Visible = False
        TextBoxPesquisarServico.Visible = True
        LabelPesquisarServico.Visible = True
        ButtonPesqServico.Visible = True
    End Sub

    Sub ShowPesquisaPecaButtons()
        ButtonPesquisarCliente.Visible = False
        ButtonPesquisarFunc.Visible = False
        ButtonPesquisarServico.Visible = False
        ButtonPesquisarVeiculo.Visible = False
        TextBoxPesquisarPeca.Visible = True
        LabelPesquisarPeca.Visible = True
        ButtonPesqPeca.Visible = True
    End Sub


    Private Sub Form1_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles MyBase.KeyDown
        If e.KeyCode = Keys.F10 Then
            MsgBox("There are " & ListBoxCliente.Items.Count.ToString &
                      " contacts in the database")
            e.Handled = True
        End If
    End Sub

    Private Sub Form1_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles MyBase.KeyPress
        ' If we're not in EDIT mode, reject keystrokes
        If Not ButtonOKCliente.Visible Then
            e.Handled = True
        End If
    End Sub



    'As seguintes funções servem para alterar os dados quando clicamos noutra pessoa/cliente/etc
    Private Sub ListBoxCliente_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxCliente.SelectedIndexChanged
        If ListBoxCliente.SelectedIndex > -1 Then
            currentCliente = ListBoxCliente.SelectedIndex
            ShowCliente()
        End If
    End Sub

    Private Sub ListBoxPessoa_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxPessoa.SelectedIndexChanged
        If ListBoxPessoa.SelectedIndex > -1 Then
            currentPessoa = ListBoxPessoa.SelectedIndex
            ShowPessoa()
        End If
    End Sub

    Private Sub ListBoxMecanico_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxMecanico.SelectedIndexChanged
        If ListBoxMecanico.SelectedIndex > -1 Then
            currentMecanico = ListBoxMecanico.SelectedIndex
            ShowMecanico()
        End If
    End Sub

    Private Sub ListBoxGerente_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxGerente.SelectedIndexChanged
        If ListBoxGerente.SelectedIndex > -1 Then
            currentGerente = ListBoxGerente.SelectedIndex
            ShowGerente()
        End If
    End Sub

    Private Sub ListBoxVeiculo_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxVeiculo.SelectedIndexChanged
        If ListBoxVeiculo.SelectedIndex > -1 Then
            currentVeiculo = ListBoxVeiculo.SelectedIndex
            ShowVeiculo()
        End If
    End Sub

    Private Sub ListBoxServiço_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxServiço.SelectedIndexChanged
        If ListBoxServiço.SelectedIndex > -1 Then
            currentServiço = ListBoxServiço.SelectedIndex
            ShowServiço()
        End If
    End Sub

    Private Sub ListBoxFuncionario_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxFuncionario.SelectedIndexChanged
        If ListBoxFuncionario.SelectedIndex > -1 Then
            currentFuncionario = ListBoxFuncionario.SelectedIndex
            ShowFuncionario()
        End If
    End Sub

    Private Sub ListBoxPeca_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxPeca.SelectedIndexChanged
        If ListBoxPeca.SelectedIndex > -1 Then
            currentPeca = ListBoxPeca.SelectedIndex
            ShowPeca()
        End If
    End Sub

    Private Sub ListBoxReparacao_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxReparacao.SelectedIndexChanged
        If ListBoxReparacao.SelectedIndex > -1 Then
            currentReparacao = ListBoxReparacao.SelectedIndex
            ShowReparacao()
        End If
    End Sub

    Private Sub ListBoxRevisao_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxRevisao.SelectedIndexChanged
        If ListBoxRevisao.SelectedIndex > -1 Then
            currentRevisao = ListBoxRevisao.SelectedIndex
            ShowRevisao()
        End If
    End Sub

    Private Sub ListBoxOficina_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ListBoxOficina.SelectedIndexChanged
        If ListBoxOficina.SelectedIndex > -1 Then
            currentOficina = ListBoxOficina.SelectedIndex
            ShowOficina()
        End If
    End Sub

    'Sair do programa
    Private Sub SairToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SairToolStripMenuItem.Click
        End
    End Sub

    Sub ShowCliente()
        If ListBoxCliente.Items.Count = 0 Or currentCliente < 0 Then Exit Sub
        Dim cliente As New Cliente
        cliente = CType(ListBoxCliente.Items.Item(currentCliente), Cliente)
        TextBoxNIF.Text = cliente.NIF
        TextBoxParceiro.Text = cliente.Parceiro
        If TextBoxParceiro.Text = "0" Then
            TextBoxParceiro.Text = False
        ElseIf TextBoxParceiro.Text = "1" Then
            TextBoxParceiro.Text = True
        End If
        TextBoxNome.Text = cliente.Nome
        TextBoxApelido.Text = cliente.Apelido
        TextBoxEndereço.Text = cliente.Endereco
        TextBoxTelefone.Text = cliente.Telefone
    End Sub

    Sub ShowPessoa()
        If ListBoxPessoa.Items.Count = 0 Or currentCliente < 0 Then Exit Sub
        Dim pessoa As New Pessoa
        pessoa = CType(ListBoxPessoa.Items.Item(currentPessoa), Pessoa)
        TextBoxNIF.Text = pessoa.NIF
        TextBoxNome.Text = pessoa.Nome
        TextBoxApelido.Text = pessoa.Apelido
        TextBoxEndereço.Text = pessoa.Endereco
        TextBoxTelefone.Text = pessoa.Telefone
    End Sub

    Sub ShowMecanico()
        If ListBoxMecanico.Items.Count = 0 Or currentMecanico < 0 Then Exit Sub
        Dim mecanico As New Mecanico
        mecanico = CType(ListBoxMecanico.Items.Item(currentMecanico), Mecanico)
        TextBoxNIF.Text = mecanico.NIF
        TextBoxParceiro.Text = mecanico.Especialidade
        TextBoxNome.Text = mecanico.Nome
        TextBoxApelido.Text = mecanico.Apelido
        TextBoxEndereço.Text = mecanico.Endereco
        TextBoxTelefone.Text = mecanico.Telefone
        TextBoxSalario.Text = mecanico.Salario
        TextBoxOficina2.Text = mecanico.Oficina
        verServicos = mecanico.NIF
    End Sub

    Sub ShowGerente()
        If ListBoxGerente.Items.Count = 0 Or currentGerente < 0 Then Exit Sub
        Dim gerente As New Gerente
        gerente = CType(ListBoxGerente.Items.Item(currentGerente), Gerente)
        TextBoxNIF.Text = gerente.NIF
        TextBoxParceiro.Text = gerente.Bonus
        TextBoxNome.Text = gerente.Nome
        TextBoxApelido.Text = gerente.Apelido
        TextBoxEndereço.Text = gerente.Endereco
        TextBoxTelefone.Text = gerente.Telefone
        TextBoxSalario.Text = gerente.Salario
        TextBoxOficina2.Text = gerente.Oficina
    End Sub

    Sub ShowVeiculo()
        If ListBoxVeiculo.Items.Count = 0 Or currentVeiculo < 0 Then Exit Sub
        Dim veiculo As New Veiculo
        veiculo = CType(ListBoxVeiculo.Items.Item(currentVeiculo), Veiculo)
        TextBoxTipo.Text = veiculo.Tipo
        If TextBoxTipo.Text = 1 Then
            TextBoxTipo.Text = ligeiro1

        ElseIf TextBoxTipo.Text = 2 Then
            TextBoxTipo.Text = pesado1

        Else
            TextBoxTipo.Text = motociclo1
        End If
        TextBoxMatricula.Text = veiculo.Matricula
        TextBoxMarca.Text = veiculo.Marca
        TextBoxDono.Text = veiculo.Dono
        TextBoxOficina.Text = veiculo.Oficina
        TextBoxEntrada.Text = veiculo.Data_In
        TextBoxSaida.Text = veiculo.Data_Out
    End Sub

    Sub ShowServiço()
        If ListBoxServiço.Items.Count = 0 Or currentServiço < 0 Then Exit Sub
        Dim serviço As New Servico
        serviço = CType(ListBoxServiço.Items.Item(currentServiço), Servico)
        TextBoxTipo.Text = serviço.ID
        TextBoxMatricula.Text = serviço.Veiculo
        TextBoxMarca.Text = serviço.Preço
        TextBoxPrecoFinal.Text = serviço.PreçoFinal
        TextBoxOficina.Text = serviço.Oficina
        TextBoxEntrada.Text = serviço.Data_In
        TextBoxSaida.Text = serviço.Data_Out
    End Sub

    Sub ShowFuncionario()
        If ListBoxFuncionario.Items.Count = 0 Or currentFuncionario < 0 Then Exit Sub
        Dim funcionario As New Funcionario
        funcionario = CType(ListBoxFuncionario.Items.Item(currentFuncionario), Funcionario)
        TextBoxSalario.Text = funcionario.Salario
        TextBoxNIF2.Text = funcionario.NIF
        TextBoxOficina2.Text = funcionario.Oficina
    End Sub

    Sub ShowPeca()
        If ListBoxPeca.Items.Count = 0 Or currentPeca < 0 Then Exit Sub
        Dim peca As New Peca
        peca = CType(ListBoxPeca.Items.Item(currentPeca), Peca)
        TextBoxNome2.Text = peca.Nome
        TextBoxReferencia.Text = peca.Referencia
        TextBoxPreço2.Text = peca.Preço
        TextBoxNumStock.Text = peca.Num_Stock
    End Sub

    Sub ShowReparacao()
        If ListBoxReparacao.Items.Count = 0 Or currentReparacao < 0 Then Exit Sub
        Dim reparacao As New Reparacao
        reparacao = CType(ListBoxReparacao.Items.Item(currentReparacao), Reparacao)
        TextBoxTipo.Text = reparacao.ID
        TextBoxMatricula.Text = reparacao.Veiculo
        TextBoxMarca.Text = reparacao.Preço
        TextBoxPrecoFinal.Text = reparacao.PreçoFinal
        TextBoxOficina.Text = reparacao.Oficina
        TextBoxEntrada.Text = reparacao.Data_In
        TextBoxSaida.Text = reparacao.Data_Out
        TextBoxPeças.Text = reparacao.Peça
        TextBoxNumPecas.Text = reparacao.Num_Pecas
        Dim mecanico As Integer
        mecanico = MecanicoServico(reparacao.ID)
        If mecanico = -1 Then
            TextBox_MecanicoServico.Text = ""
        Else
            TextBox_MecanicoServico.Text = mecanico
        End If
    End Sub

    Sub ShowRevisao()
        If ListBoxRevisao.Items.Count = 0 Or currentRevisao < 0 Then Exit Sub
        Dim revisao As New Revisao
        revisao = CType(ListBoxRevisao.Items.Item(currentRevisao), Revisao)
        TextBoxTipo.Text = revisao.ID
        TextBoxMatricula.Text = revisao.Veiculo
        TextBoxMarca.Text = revisao.Preço
        TextBoxPrecoFinal.Text = revisao.PreçoFinal
        TextBoxOficina.Text = revisao.Oficina
        TextBoxEntrada.Text = revisao.Data_In
        TextBoxSaida.Text = revisao.Data_Out
        TextBoxTipoRevisao.Text = revisao.Tipo
        Dim mecanico As Integer
        mecanico = MecanicoServico(revisao.ID)
        If mecanico = -1 Then
            TextBox_MecanicoServico.Text = ""
        Else
            TextBox_MecanicoServico.Text = mecanico
        End If
    End Sub

    Sub ShowOficina()
        If ListBoxOficina.Items.Count = 0 Or currentOficina < 0 Then Exit Sub
        Dim oficina As New Oficina
        oficina = CType(ListBoxOficina.Items.Item(currentOficina), Oficina)
        TextBoxNumeroOf.Text = oficina.Numero
        TextBoxTelefoneOf.Text = oficina.Telefone
        TextBoxCidadeOf.Text = oficina.Cidade
        TextBoxEmailOf.Text = oficina.Email
        TextBoxGerenteOf.Text = oficina.Gerente
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        '' Change this line...
        'CN = New SqlConnection("data source= LAPTOP-DRATRPA2\MSSQLSERVER01;integrated security=true;initial catalog=Oficina_DB")
        'CN = New SqlConnection("data source = DESKTOP-3FVHM7B ; integrated security = true ; initial catalog = BD.Oficina_DB")
        CN = New SqlConnection("data source = tcp:mednat.ieeta.pt\SQLSERVER,8101 ; initial catalog = p7g1 ; uid = p7g1 ; password = BD2020.pedro.hugo")
        CMD = New SqlCommand
        CMD.Connection = CN
        HideEverything()
        InícioToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ClienteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ClienteToolStripMenuItem.Click
        HideEverything()
        ShowClienteButtons()
        CMD.CommandText = "SELECT C.nif, C.parceiro, P.nome, P.apelido, P.endereco, P.telefone FROM Oficina_DB.Cliente AS C, Oficina_DB.Pessoa AS P WHERE P.nif=C.nif;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxCliente.Items.Clear()
        While RDR.Read
            Dim C As New Cliente
            C.NIF = RDR.Item("nif")
            C.Parceiro = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("parceiro")), "", RDR.Item("parceiro")))
            C.Nome = RDR.Item("nome")
            C.Apelido = RDR.Item("apelido")
            C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            ListBoxCliente.Items.Add(C)
        End While
        CN.Close()
        currentCliente = 0
        ShowCliente()
    End Sub

    Private Sub InícioToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InícioToolStripMenuItem.Click
        HideEverything()
        ListBoxView.Items.Clear()
        ButtonLucroOficina.Visible = True
        ButtonTotalOrdenados.Visible = True
        ButtonPesquisarCliente.Visible = True
        ButtonPesquisarFunc.Visible = True
        ButtonPesquisarPeca.Visible = True
        ButtonPesquisarServico.Visible = True
        ButtonPesquisarVeiculo.Visible = True
        ListBoxView.Visible = True
    End Sub

    Private Sub PessoasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PessoasToolStripMenuItem.Click
        HideEverything()
        ShowPessoaButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Pessoa"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxPessoa.Items.Clear()
        While RDR.Read
            Dim C As New Pessoa
            C.NIF = RDR.Item("nif")
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("apelido")) Then C.Apelido = RDR.Item("apelido")
            If Not IsDBNull(RDR.Item("endereco")) Then C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            ListBoxPessoa.Items.Add(C)
        End While
        CN.Close()
        currentPessoa = 0
        ShowPessoa()

    End Sub

    Private Sub MecanicoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MecânicoToolStripMenuItem.Click
        HideEverything()
        ShowMecanicoButtons()
        CMD.CommandText = "SELECT M.nif, M.especialidade, P.nome, P.apelido, P.endereco, P.telefone, F.salario, F.n_oficina FROM Oficina_DB.Mecanico AS M, Oficina_DB.Pessoa AS P, Oficina_DB.Funcionario AS F WHERE P.nif=M.nif and M.nif=F.nif;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxMecanico.Items.Clear()
        While RDR.Read
            Dim C As New Mecanico
            C.NIF = RDR.Item("nif")
            If Not IsDBNull(RDR.Item("especialidade")) Then C.Especialidade = RDR.Item("especialidade")
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("apelido")) Then C.Apelido = RDR.Item("apelido")
            If Not IsDBNull(RDR.Item("endereco")) Then C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            If Not IsDBNull(RDR.Item("n_oficina")) Then C.Oficina = RDR.Item("n_oficina")
            If Not IsDBNull(RDR.Item("salario")) Then C.Salario = RDR.Item("salario")
            ListBoxMecanico.Items.Add(C)
        End While
        CN.Close()
        currentMecanico = 0
        ShowMecanico()
    End Sub

    Private Sub GerenteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles GerenteToolStripMenuItem.Click
        HideEverything()
        ShowGerenteButtons()
        CMD.CommandText = "SELECT G.nif, G.bonus, P.nome, P.apelido, P.endereco, P.telefone, F.salario, F.n_oficina FROM Oficina_DB.Gerente AS G, Oficina_DB.Pessoa AS P, Oficina_DB.Funcionario AS F WHERE P.nif=G.nif and G.nif=F.nif;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxGerente.Items.Clear()
        While RDR.Read
            Dim C As New Gerente
            C.NIF = RDR.Item("nif")
            If Not IsDBNull(RDR.Item("bonus")) Then C.Bonus = RDR.Item("bonus")
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("apelido")) Then C.Apelido = RDR.Item("apelido")
            If Not IsDBNull(RDR.Item("endereco")) Then C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            If Not IsDBNull(RDR.Item("n_oficina")) Then C.Oficina = RDR.Item("n_oficina")
            If Not IsDBNull(RDR.Item("salario")) Then C.Salario = RDR.Item("salario")
            ListBoxGerente.Items.Add(C)
        End While
        CN.Close()
        currentGerente = 0
        ShowGerente()
    End Sub

    Private Sub VeículoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles VeículoToolStripMenuItem.Click
        HideEverything()
        ShowVeiculoButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Veiculo;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxVeiculo.Items.Clear()
        While RDR.Read
            Dim C As New Veiculo
            If Not IsDBNull(RDR.Item("tipo")) Then C.Tipo = RDR.Item("tipo")
            C.Matricula = RDR.Item("matricula")
            If Not IsDBNull(RDR.Item("marca")) Then C.Marca = RDR.Item("marca")
            C.Dono = RDR.Item("dono")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_in")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_in")), "", RDR.Item("data_in")))
            If Not IsDBNull(RDR.Item("data_out")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_out")), "", RDR.Item("data_out")))
            ListBoxVeiculo.Items.Add(C)
        End While
        CN.Close()
        currentVeiculo = 0
        ShowVeiculo()
    End Sub

    Private Sub TodosToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles TodosToolStripMenuItem1.Click
        HideEverything()
        ShowServiçoButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Servico"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxServiço.Items.Clear()
        While RDR.Read
            Dim C As New Servico
            C.ID = RDR.Item("id")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            If Not IsDBNull(RDR.Item("preco_final")) Then If Not IsDBNull(RDR.Item("preco_final")) Then C.PreçoFinal = RDR.Item("preco_final")
            C.Veiculo = RDR.Item("veiculo")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_inic")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_inic")), "", RDR.Item("data_inic")))
            If Not IsDBNull(RDR.Item("data_conc")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_conc")), "", RDR.Item("data_conc")))
            ListBoxServiço.Items.Add(C)
        End While
        CN.Close()
        currentServiço = 0
        ShowServiço()
    End Sub

    Private Sub TodosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles TodosToolStripMenuItem.Click
        HideEverything()
        ShowFuncionarioButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Funcionario;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxFuncionario.Items.Clear()
        While RDR.Read
            Dim C As New Funcionario
            C.NIF = RDR.Item("nif")
            If Not IsDBNull(RDR.Item("salario")) Then C.Salario = RDR.Item("salario")
            If Not IsDBNull(RDR.Item("n_oficina")) Then C.Oficina = RDR.Item("n_oficina")
            ListBoxFuncionario.Items.Add(C)
        End While
        CN.Close()
        currentFuncionario = 0
        ShowFuncionario()
    End Sub

    Private Sub PeçaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PeçaToolStripMenuItem.Click
        HideEverything()
        ShowPecaButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Peca;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxPeca.Items.Clear()
        While RDR.Read
            Dim C As New Peca
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("num_stock")) Then C.Num_Stock = RDR.Item("num_stock")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            C.Referencia = RDR.Item("referencia")
            ListBoxPeca.Items.Add(C)
        End While
        CN.Close()
        currentPeca = 0
        ShowPeca()
    End Sub

    Private Sub ReparaçãoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ReparaçãoToolStripMenuItem.Click
        HideEverything()
        ShowReparacaoButtons()
        CMD.CommandText = "SELECT R.id, R.peca, R.n_pecas, S.data_inic, S.data_conc, S.preco, S.preco_final, S.veiculo, S.oficina FROM Oficina_DB.Reparacao AS R, Oficina_DB.Servico AS S WHERE R.id = S.id;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxReparacao.Items.Clear()
        While RDR.Read
            Dim C As New Reparacao
            C.ID = RDR.Item("id")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            If Not IsDBNull(RDR.Item("preco_final")) Then C.PreçoFinal = RDR.Item("preco_final")
            C.Veiculo = RDR.Item("veiculo")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_inic")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_inic")), "", RDR.Item("data_inic")))
            If Not IsDBNull(RDR.Item("data_conc")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_conc")), "", RDR.Item("data_conc")))
            If Not IsDBNull(RDR.Item("peca")) Then C.Peça = RDR.Item("peca")
            If Not IsDBNull(RDR.Item("n_pecas")) Then C.Num_Pecas = RDR.Item("n_pecas")
            ListBoxReparacao.Items.Add(C)
        End While
        CN.Close()
        currentReparacao = 0
        ShowReparacao()
    End Sub

    Private Sub RevisãoToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RevisãoToolStripMenuItem.Click
        HideEverything()
        ShowRevisaoButtons()
        CMD.CommandText = "SELECT R.id, R.tipo, S.data_inic, S.data_conc, S.preco, S.preco_final, S.veiculo, S.oficina FROM Oficina_DB.Revisao AS R, Oficina_DB.Servico AS S WHERE R.id = S.id;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxRevisao.Items.Clear()
        While RDR.Read
            Dim C As New Revisao
            C.ID = RDR.Item("id")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            If Not IsDBNull(RDR.Item("preco_final")) Then C.PreçoFinal = RDR.Item("preco_final")
            C.Veiculo = RDR.Item("veiculo")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_inic")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_inic")), "", RDR.Item("data_inic")))
            If Not IsDBNull(RDR.Item("data_conc")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_conc")), "", RDR.Item("data_conc")))
            If Not IsDBNull(RDR.Item("tipo")) Then C.Tipo = RDR.Item("tipo")
            ListBoxRevisao.Items.Add(C)
        End While
        CN.Close()
        currentRevisao = 0
        ShowRevisao()
    End Sub

    Private Sub OficinaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles OficinaToolStripMenuItem.Click
        HideEverything()
        ShowOficinaButtons()
        CMD.CommandText = "SELECT * FROM Oficina_DB.Oficina;"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxOficina.Items.Clear()
        While RDR.Read
            Dim O As New Oficina
            O.Numero = RDR.Item("numero")
            O.Telefone = RDR.Item("telefone")
            If Not IsDBNull(RDR.Item("cidade")) Then O.Cidade = RDR.Item("cidade")
            O.Email = RDR.Item("email")
            If Not IsDBNull(RDR.Item("gerente")) Then O.Gerente = RDR.Item("gerente")
            ListBoxOficina.Items.Add(O)
        End While
        CN.Close()
        currentOficina = 0
        ShowOficina()
    End Sub

    Private Function SubmitCliente(ByVal C As Cliente) As Boolean
        CMD.CommandText = "EXEC newClientePerson @nif, @telefone, @endereco, @nome, @apelido , @parceiro"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", C.NIF)
        CMD.Parameters.AddWithValue("@parceiro", C.Parceiro)
        CMD.Parameters.AddWithValue("@telefone", C.Telefone)
        If Not C.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", C.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.value)
        End If
        CMD.Parameters.AddWithValue("@nome", C.Nome)
        If Not C.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", C.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar novo Cliente na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
            Return False
        Finally
            CN.Close()
        End Try
        Return True
    End Function

    Private Sub UpdateCliente(ByVal C As Cliente)
        'CMD.CommandText = "UPDATE Oficina_DB.Cliente " &
        '    "SET parceiro = @parceiro " &
        '    "WHERE nif = @nif"
        CMD.CommandText = "EXEC UpdateCliente @nif, @telefone, @endereco, @nome, @apelido, @parceiro"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", C.NIF)
        CMD.Parameters.AddWithValue("@parceiro", C.Parceiro)
        CMD.Parameters.AddWithValue("@telefone", C.Telefone)
        If Not C.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", C.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@nome", C.Nome)
        If Not C.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", C.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar o Cliente na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveCliente(ByVal NIF As String)
        CMD.CommandText = "EXEC deleteCliente @nif"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", NIF)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar o Cliente na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub SubmitGerente(ByVal G As Gerente)
        CMD.CommandText = "EXEC newGerentePerson @nif, @telefone, @endereco, @nome, @apelido, @salario, @oficina, @bonus"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", G.NIF)
        CMD.Parameters.AddWithValue("@telefone", G.Telefone)
        CMD.Parameters.AddWithValue("@nome", G.Nome)
        If Not G.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", G.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        If Not G.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", G.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.Value)
        End If
        If Not G.Salario = "" Then
            CMD.Parameters.AddWithValue("@salario", G.Salario)
        Else CMD.Parameters.AddWithValue("@salario", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@oficina", G.Oficina)
        CMD.Parameters.AddWithValue("@bonus", G.Bonus)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar novo Gerente na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
        CN.Close()
    End Sub

    Private Sub UpdateGerente(ByVal G As Gerente)
        'CMD.CommandText = "update Oficina_DB.Gerente " &
        '    "set bonus = @bonus " &
        '    "where nif = @nif"
        CMD.CommandText = "EXEC UpdateGerente  @nif, @telefone, @endereco, @nome, @apelido, @oficina, @salario, @bonus"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", G.NIF)
        CMD.Parameters.AddWithValue("@telefone", G.Telefone)
        CMD.Parameters.AddWithValue("@nome", G.Nome)
        If Not G.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", G.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        If Not G.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", G.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.Value)
        End If
        If Not G.Salario = "" Then
            CMD.Parameters.AddWithValue("@salario", G.Salario)
        Else CMD.Parameters.AddWithValue("@salario", DBNull.Value)
        End If
        If Not G.Oficina = "" Then
            CMD.Parameters.AddWithValue("@oficina", G.Oficina)
        Else CMD.Parameters.AddWithValue("@oficina", DBNull.Value)
        End If
        If Not G.Bonus = "" Then
            CMD.Parameters.AddWithValue("@bonus", G.Bonus)
        Else CMD.Parameters.AddWithValue("@bonus", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar o Gerente na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveGerente(ByVal NIF As String)
        'CMD.CommandText = "DELETE Oficina_DB.Gerente WHERE nif=@nif "
        CMD.CommandText = "EXEC deleteFuncionario @nif"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", NIF)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar o Gerente na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub SubmitMecanico(ByVal M As Mecanico)
        CMD.CommandText = "EXEC newMecanicoPerson @nif, @telefone, @endereco, @nome, @apelido, @salario, @oficina, @especialidade"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", M.NIF)
        CMD.Parameters.AddWithValue("@telefone", M.Telefone)
        CMD.Parameters.AddWithValue("@nome", M.Nome)
        If Not M.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", M.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        If Not M.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", M.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.Value)
        End If
        If Not M.Salario = "" Then
            CMD.Parameters.AddWithValue("@salario", M.Salario)
        Else CMD.Parameters.AddWithValue("@salario", DBNull.Value)
        End If
        If Not M.Oficina = "" Then
            CMD.Parameters.AddWithValue("@oficina", M.Oficina)
        Else CMD.Parameters.AddWithValue("@oficina", DBNull.Value)
        End If
        If Not M.Especialidade = "" Then
            CMD.Parameters.AddWithValue("@especialidade", M.Especialidade)
        Else CMD.Parameters.AddWithValue("@especialidade", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar novo Mecanico na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
        CN.Close()
    End Sub

    Private Sub UpdateMecanico(ByVal M As Mecanico)
        'CMD.CommandText = "update Oficina_DB.Mecanico " &
        '    "set especialidade = @especialidade " &
        '    "where nif = @nif"

        CMD.CommandText = "EXEC UpdateMecanico  @nif, @telefone, @endereco, @nome, @apelido, @oficina, @salario, @especialidade"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", M.NIF)
        CMD.Parameters.AddWithValue("@telefone", M.Telefone)
        CMD.Parameters.AddWithValue("@nome", M.Nome)
        If Not M.Apelido = "" Then
            CMD.Parameters.AddWithValue("@apelido", M.Apelido)
        Else CMD.Parameters.AddWithValue("@apelido", DBNull.Value)
        End If
        If Not M.Endereco = "" Then
            CMD.Parameters.AddWithValue("@endereco", M.Endereco)
        Else CMD.Parameters.AddWithValue("@endereco", DBNull.Value)
        End If
        If Not M.Salario = "" Then
            CMD.Parameters.AddWithValue("@salario", M.Salario)
        Else CMD.Parameters.AddWithValue("@salario", DBNull.Value)
        End If
        If Not M.Oficina = "" Then
            CMD.Parameters.AddWithValue("@oficina", M.Oficina)
        Else CMD.Parameters.AddWithValue("@oficina", DBNull.Value)
        End If
        If Not M.Especialidade = "" Then
            CMD.Parameters.AddWithValue("@especialidade", M.Especialidade)
        Else CMD.Parameters.AddWithValue("@especialidade", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar o Mecanico na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try

    End Sub

    Private Sub RemoveMecanico(ByVal NIF As String)
        'CMD.CommandText = "DELETE Oficina_DB.Mecanico WHERE nif=@nif "
        CMD.CommandText = "EXEC deleteFuncionario @nif"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@nif", NIF)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar o Mecanico na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try

    End Sub

    Private Sub SubmitVeiculo(ByVal V As Veiculo)
        CMD.CommandText = "EXEC newVeiculo @matricula, @marca, @tipo, @dono, @oficina, @data_in, @data_out"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@matricula", V.Matricula)
        CMD.Parameters.AddWithValue("@marca", V.Marca)
        CMD.Parameters.AddWithValue("@tipo", V.Tipo)
        CMD.Parameters.AddWithValue("@dono", V.Dono)
        CMD.Parameters.AddWithValue("@oficina", V.Oficina)
        If Not V.Data_In = "" Then
            CMD.Parameters.AddWithValue("@data_in", Convert.ToDateTime(V.Data_In))
        Else CMD.Parameters.AddWithValue("@data_in", DBNull.Value)
        End If
        If Not V.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@data_out", Convert.ToDateTime(V.Data_Out))
        Else CMD.Parameters.AddWithValue("@data_out", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar novo Veiculo na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
        CN.Close()
    End Sub

    Private Sub UpdateVeiculo(ByVal V As Veiculo)
        CMD.CommandText = "EXEC updateVeiculo @matricula, @marca, @dono, @oficina, @data_in, @data_out"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@matricula", V.Matricula)
        CMD.Parameters.AddWithValue("@marca", V.Marca)
        CMD.Parameters.AddWithValue("@dono", V.Dono)
        CMD.Parameters.AddWithValue("@oficina", V.Oficina)
        If Not V.Data_In = "" Then
            CMD.Parameters.AddWithValue("@data_in", Convert.ToDateTime(V.Data_In))
        Else CMD.Parameters.AddWithValue("@data_in", DBNull.Value)
        End If
        If Not V.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@data_out", Convert.ToDateTime(V.Data_Out))
        Else CMD.Parameters.AddWithValue("@data_out", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar o Veiculo na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveVeiculo(ByVal Matricula As String)
        CMD.CommandText = "EXEC deleteVeiculo @matricula "
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@matricula", Matricula)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar o Veiculo na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Function SubmitRevisao(ByVal R As Revisao) As Boolean
        CMD.CommandText = "EXEC newRevisao @preco, @oficina, @veiculo, @data_in, @data_out, @tipo, @mecanico"
        CMD.Parameters.Clear()
        'CMD.Parameters.AddWithValue("@id", R.ID)
        If Not R.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", R.Preço)
        Else CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@oficina", R.Oficina)
        CMD.Parameters.AddWithValue("@veiculo", R.Veiculo)
        If Not R.Data_In = "" Then
            CMD.Parameters.AddWithValue("@data_in", Convert.ToDateTime(R.Data_In))
        Else CMD.Parameters.AddWithValue("@data_in", DBNull.Value)
        End If
        If Not R.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@data_out", Convert.ToDateTime(R.Data_Out))
        Else CMD.Parameters.AddWithValue("@data_out", DBNull.Value)
        End If
        If Not R.Tipo = "" Then
            CMD.Parameters.AddWithValue("@tipo", R.Tipo)
        Else CMD.Parameters.AddWithValue("@tipo", DBNull.Value)
        End If
        If Not TextBox_MecanicoServico.Text = "" Then
            CMD.Parameters.AddWithValue("@mecanico", TextBox_MecanicoServico.Text)
        Else CMD.Parameters.AddWithValue("@mecanico", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox("Nao foi possivel criar nova Revisão na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
            Return False
        Finally
            CN.Close()
        End Try
        CN.Close()
        Return True
    End Function

    Private Sub UpdateRevisao(ByVal R As Revisao)
        'CMD.CommandText = "update Oficina_DB.Revisao " &
        '    "set tipo = @tipo " &
        '    "where id = @id"
        CMD.CommandText = "EXEC UpdateRevisao @id, @preco, @oficina, @veiculo, @preco_final, @data_inic, @data_conc, @tipo, @mecanico"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@id", R.ID)
        If Not R.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", R.Preço)
        Else CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@oficina", R.Oficina)
        CMD.Parameters.AddWithValue("@veiculo", R.Veiculo)
        If Not R.PreçoFinal = "" Then
            CMD.Parameters.AddWithValue("@preco_final", R.PreçoFinal)
        Else CMD.Parameters.AddWithValue("@preco_final", DBNull.Value)
        End If
        If Not R.Data_In = "" Then
            CMD.Parameters.AddWithValue("@data_inic", Convert.ToDateTime(R.Data_In))
        Else CMD.Parameters.AddWithValue("@data_inic", DBNull.Value)
        End If
        If Not R.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@data_conc", Convert.ToDateTime(R.Data_Out))
        Else CMD.Parameters.AddWithValue("@data_conc", DBNull.Value)
        End If
        If Not R.Tipo = "" Then
            CMD.Parameters.AddWithValue("@tipo", R.Tipo)
        Else CMD.Parameters.AddWithValue("@tipo", DBNull.Value)
        End If
        If Not TextBox_MecanicoServico.Text = "" Then
            CMD.Parameters.AddWithValue("@mecanico", TextBox_MecanicoServico.Text)
        Else CMD.Parameters.AddWithValue("@mecanico", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar a Revisao na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveRevisao(ByVal ID As String)
        CMD.CommandText = "EXEC deleteServico @id "
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@id", ID)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a Revisao na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Function SubmitReparacao(ByVal R As Reparacao) As Boolean
        CMD.CommandText = "EXEC newReparacao @preco, @oficina, @veiculo, @datain, @dataco, @peca, @num_pecas, @mecanico"
        CMD.Parameters.Clear()
        'CMD.Parameters.AddWithValue("@id", R.ID)
        If Not R.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", R.Preço)
        Else CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@oficina", R.Oficina)
        CMD.Parameters.AddWithValue("@veiculo", R.Veiculo)
        If Not R.Data_In = "" Then
            CMD.Parameters.AddWithValue("@datain", Convert.ToDateTime(R.Data_In))
        Else CMD.Parameters.AddWithValue("@datain", DBNull.Value)
        End If
        If Not R.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@dataco", Convert.ToDateTime(R.Data_Out))
        Else CMD.Parameters.AddWithValue("@dataco", DBNull.Value)
        End If
        If R.Peça = "" Then
            CMD.Parameters.AddWithValue("@peca", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@peca", R.Peça)
        End If
        If R.Num_Pecas = "" Then
            CMD.Parameters.AddWithValue("@num_pecas", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@num_pecas", R.Num_Pecas)
        End If
        If Not TextBox_MecanicoServico.Text = "" Then
            CMD.Parameters.AddWithValue("@mecanico", TextBox_MecanicoServico.Text)
        Else CMD.Parameters.AddWithValue("@mecanico", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox("Nao foi possivel criar nova Reparação na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
            Return False
        Finally
            CN.Close()
        End Try
        Return True
    End Function

    Private Sub UpdateReparacao(ByVal R As Reparacao)
        'CMD.CommandText = "update Oficina_DB.Reparacao " &
        '    "set pecas = @pecas " &
        '    "where id = @id"
        CMD.CommandText = "EXEC UpdateReparacao @id, @preco, @oficina, @veiculo, @preco_final, @datain, @dataco, @peca, @mecanico"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@id", R.ID)
        If Not R.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", R.Preço)
        Else CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        End If
        CMD.Parameters.AddWithValue("@oficina", R.Oficina)
        CMD.Parameters.AddWithValue("@veiculo", R.Veiculo)
        If R.PreçoFinal = "" Then
            CMD.Parameters.AddWithValue("@preco_final", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@preco_final", R.PreçoFinal)
        End If
        If Not R.Data_In = "" Then
            CMD.Parameters.AddWithValue("@datain", Convert.ToDateTime(R.Data_In))
        Else CMD.Parameters.AddWithValue("@datain", DBNull.Value)
        End If
        If Not R.Data_Out = "" Then
            CMD.Parameters.AddWithValue("@dataco", Convert.ToDateTime(R.Data_Out))
        Else CMD.Parameters.AddWithValue("@dataco", DBNull.Value)
        End If
        If R.Peça = "" Then
            CMD.Parameters.AddWithValue("@peca", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@peca", R.Peça)
        End If
        If R.Num_Pecas = "" Then
            CMD.Parameters.AddWithValue("@num_pecas", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@num_pecas", R.Num_Pecas)
        End If
        If Not TextBox_MecanicoServico.Text = "" Then
            CMD.Parameters.AddWithValue("@mecanico", TextBox_MecanicoServico.Text)
        Else CMD.Parameters.AddWithValue("@mecanico", DBNull.Value)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar a Reparação na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveReparacao(ByVal ID As String)
        CMD.CommandText = "EXEC deleteServico @id "
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@id", ID)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a Reparação na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Function SubmitPeca(ByVal P As Peca) As Boolean
        CMD.CommandText = "EXEC newPeca @referencia, @nome, @preco, @num_stock"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@referencia", P.Referencia)
        CMD.Parameters.AddWithValue("@nome", P.Nome)
        If P.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@preco", P.Preço)
        End If
        If P.Num_Stock = "" Then
            CMD.Parameters.AddWithValue("@num_stock", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@num_stock", P.Num_Stock)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar nova Peça na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
            Return False
        Finally
            CN.Close()
        End Try
        Return True
    End Function

    Private Sub UpdatePeca(ByVal P As Peca)
        CMD.CommandText = "update Oficina_DB.Peca " &
            "set nome = @nome, " &
            "    preco = @preco, " &
            "    num_stock = @num_stock " &
            "where referencia = @referencia"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@referencia", P.Referencia)
        CMD.Parameters.AddWithValue("@nome", P.Nome)
        If P.Preço = "" Then
            CMD.Parameters.AddWithValue("@preco", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@preco", P.Preço)
        End If
        If P.Num_Stock = "" Then
            CMD.Parameters.AddWithValue("@num_stock", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@num_stock", P.Num_Stock)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar a Peça na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemovePeca(ByVal Referencia As String)
        CMD.CommandText = "EXEC deletePeca @referencia "
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@referencia", Referencia)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a Peça na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Function SubmitOficina(ByVal O As Oficina) As Boolean
        CMD.CommandText = "EXEC newOficina @telefone, @cidade, @email"
        CMD.Parameters.Clear()
        'CMD.Parameters.AddWithValue("@numero", O.Numero)
        CMD.Parameters.AddWithValue("@telefone", O.Telefone)
        If O.Cidade = "" Then
            CMD.Parameters.AddWithValue("@cidade", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@cidade", O.Cidade)
        End If
        CMD.Parameters.AddWithValue("@email", O.Email)
        'CMD.Parameters.AddWithValue("@gerente", O.Gerente)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel criar nova Oficina na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
            Return False
        Finally
            CN.Close()
        End Try
        Return True
    End Function

    Private Sub UpdateOficina(ByVal O As Oficina)
        CMD.CommandText = "update Oficina_DB.Oficina " &
            "set telefone = @telefone, " &
            "    cidade = @cidade, " &
            "    email = @email, " &
            "    gerente = @gerente " &
            "where numero = @numero"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@numero", O.Numero)
        CMD.Parameters.AddWithValue("@telefone", O.Telefone)
        If O.Cidade = "" Then
            CMD.Parameters.AddWithValue("@cidade", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@cidade", O.Cidade)
        End If
        CMD.Parameters.AddWithValue("@email", O.Email)
        If O.Gerente = "" Then
            CMD.Parameters.AddWithValue("@gerente", DBNull.Value)
        Else CMD.Parameters.AddWithValue("@gerente", O.Gerente)
        End If
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel atualizar a Oficina na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub RemoveOficina(ByVal Numero As String)
        'CMD.CommandText = "DELETE Oficina_DB.Oficina WHERE numero=@numero "
        CMD.CommandText = "EXEC deleteOficina @numero"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@numero", Numero)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a Oficina na Base de Dados. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Function SaveCliente() As Boolean
        Dim cliente As New Cliente
        Try
            cliente.NIF = TextBoxNIF.Text
            cliente.Parceiro = TextBoxParceiro.Text
            cliente.Nome = TextBoxNome.Text
            cliente.Apelido = TextBoxApelido.Text
            cliente.Endereco = TextBoxEndereço.Text
            cliente.Telefone = TextBoxTelefone.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitCliente(cliente)
            ListBoxCliente.Items.Add(cliente)
        Else
            UpdateCliente(cliente)
            ListBoxCliente.Items(currentCliente) = cliente
        End If
        Return True
    End Function

    Private Function SaveVeiculo() As Boolean
        Dim veiculo As New Veiculo
        Try
            veiculo.Matricula = TextBoxMatricula.Text
            veiculo.Marca = TextBoxMarca.Text
            veiculo.Tipo = TextBoxTipo.Text
            veiculo.Dono = TextBoxDono.Text
            veiculo.Oficina = TextBoxOficina.Text
            veiculo.Data_In = TextBoxEntrada.Text
            veiculo.Data_Out = TextBoxSaida.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitVeiculo(veiculo)
            ListBoxVeiculo.Items.Add(veiculo)
        Else
            UpdateVeiculo(veiculo)
            'ListBoxVeiculo.Items(currentVeiculo) = veiculo
        End If
        Return True
    End Function

    Private Function SavePeca() As Boolean
        Dim peca As New Peca
        Try
            peca.Referencia = TextBoxReferencia.Text
            peca.Nome = TextBoxNome2.Text
            peca.Preço = TextBoxPreço2.Text
            peca.Num_Stock = TextBoxNumStock.Text
            peca.NumCompra = TextBoxComprar.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitPeca(peca)
            ListBoxPeca.Items.Add(peca)
        ElseIf compra Then
            SaveCompra(peca)
            ListBoxPeca.Items(currentPeca) = peca
            compra = False
        Else
            UpdatePeca(peca)
            ListBoxPeca.Items(currentPeca) = peca
        End If
        Return True
    End Function

    Private Function SavePeca2() As Boolean
        Dim peca As New Peca
        Try
            peca.Referencia = TextBoxReferencia.Text
            peca.NumCompra = TextBoxComprar.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If compra Then
            SaveCompra(peca)
            ListBoxPeca.Items(currentPeca) = peca
            compra = False
        End If
        Return True
    End Function

    Private Function SaveOficina() As Boolean
        Dim oficina As New Oficina
        Try
            oficina.Numero = TextBoxNumeroOf.Text
            oficina.Telefone = TextBoxTelefoneOf.Text
            oficina.Cidade = TextBoxCidadeOf.Text
            oficina.Email = TextBoxEmailOf.Text
            oficina.Gerente = TextBoxGerenteOf.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitOficina(oficina)
            ListBoxOficina.Items.Add(oficina)
        Else
            UpdateOficina(oficina)
            ListBoxOficina.Items(currentOficina) = oficina
        End If
        Return True
    End Function

    Private Function SaveGerente() As Boolean
        Dim gerente As New Gerente
        Try
            gerente.NIF = TextBoxNIF.Text
            gerente.Bonus = TextBoxParceiro.Text
            gerente.Telefone = TextBoxTelefone.Text
            gerente.Endereco = TextBoxEndereço.Text
            gerente.Nome = TextBoxNome.Text
            gerente.Apelido = TextBoxApelido.Text
            gerente.Oficina = TextBoxOficina2.Text
            gerente.Salario = TextBoxSalario.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitGerente(gerente)
            ListBoxGerente.Items.Add(gerente)
        Else
            UpdateGerente(gerente)
            ListBoxGerente.Items(currentGerente) = gerente
        End If
        Return True
    End Function

    Private Function SaveMecanico() As Boolean
        Dim mecanico As New Mecanico
        Try
            mecanico.NIF = TextBoxNIF.Text
            mecanico.Especialidade = TextBoxParceiro.Text
            mecanico.Telefone = TextBoxTelefone.Text
            mecanico.Endereco = TextBoxEndereço.Text
            mecanico.Nome = TextBoxNome.Text
            mecanico.Apelido = TextBoxApelido.Text
            mecanico.Oficina = TextBoxOficina2.Text
            mecanico.Salario = TextBoxSalario.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitMecanico(mecanico)
            ListBoxMecanico.Items.Add(mecanico)
        Else
            UpdateMecanico(mecanico)
            ListBoxMecanico.Items(currentMecanico) = mecanico
        End If
        Return True
    End Function

    Private Function SaveRevisao() As Boolean
        Dim revisao As New Revisao
        Try
            revisao.ID = TextBoxTipo.Text
            revisao.Preço = TextBoxMarca.Text
            revisao.Oficina = TextBoxOficina.Text
            revisao.Veiculo = TextBoxMatricula.Text
            revisao.PreçoFinal = TextBoxDono.Text
            revisao.Data_In = TextBoxEntrada.Text
            revisao.Data_Out = TextBoxSaida.Text
            revisao.Tipo = TextBoxTipoRevisao.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitRevisao(revisao)
            ListBoxRevisao.Items.Add(revisao)
        Else
            UpdateRevisao(revisao)
            ListBoxRevisao.Items(currentRevisao) = revisao
        End If
        Return True
    End Function

    Private Function SaveReparacao() As Boolean
        Dim reparacao As New Reparacao
        Try
            reparacao.ID = TextBoxTipo.Text
            reparacao.Preço = TextBoxMarca.Text
            reparacao.Oficina = TextBoxOficina.Text
            reparacao.Veiculo = TextBoxMatricula.Text
            reparacao.PreçoFinal = TextBoxDono.Text
            reparacao.Data_In = TextBoxEntrada.Text
            reparacao.Data_Out = TextBoxSaida.Text
            reparacao.Peça = TextBoxPeças.Text
            reparacao.Num_Pecas = TextBoxNumPecas.Text
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
        If adding Then
            SubmitReparacao(reparacao)
            ListBoxRevisao.Items.Add(reparacao)
        Else
            UpdateReparacao(reparacao)
            ListBoxReparacao.Items(currentReparacao) = reparacao
        End If
        Return True
    End Function

    Private Sub ButtonAdicionarCliente_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarCliente.Click
        adding = True
        ClearFields()
        Hide3ButtonsCliente()
        ListBoxCliente.Enabled = False
    End Sub

    Private Sub ButtonCancelarCliente_Click(sender As Object, e As EventArgs) Handles ButtonCancelarCliente.Click
        ListBoxCliente.Enabled = True
        If ListBoxCliente.Items.Count > 0 Then
            currentCliente = ListBoxCliente.SelectedIndex
            If currentCliente < 0 Then currentCliente = 0
            ShowCliente()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsCliente()
    End Sub

    Private Sub ButtonOKCliente_Click(sender As Object, e As EventArgs) Handles ButtonOKCliente.Click
        Try
            SaveCliente()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxCliente.Enabled = True
        Dim idx As Integer = ListBoxCliente.FindString(TextBoxNIF.Text)
        ListBoxCliente.SelectedIndex = idx
        Show3ButtonsCliente()
        ClienteToolStripMenuItem_Click(sender, e)
        ClienteToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEditarCliente_Click(sender As Object, e As EventArgs) Handles ButtonEditarCliente.Click
        currentCliente = ListBoxCliente.SelectedIndex
        If currentCliente < 0 Then
            MsgBox("Please select a contact to edit")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsCliente()
        ListBoxCliente.Enabled = False
    End Sub

    Private Sub ButtonEliminarCliente_Click(sender As Object, e As EventArgs) Handles ButtonEliminarCliente.Click
        If ListBoxCliente.SelectedIndex > -1 Then
            Try
                RemoveCliente(CType(ListBoxCliente.SelectedItem, Cliente).NIF)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxCliente.Items.RemoveAt(ListBoxCliente.SelectedIndex)
            If currentCliente = ListBoxCliente.Items.Count Then currentCliente = ListBoxCliente.Items.Count - 1
            If currentCliente = -1 Then
                ClearFields()
                MsgBox("There are no more contacts")
            Else
                ShowCliente()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarVeiculo.Click
        adding = True
        ClearFields()
        Hide3ButtonsVeiculo()
        ListBoxVeiculo.Enabled = False
    End Sub

    Private Sub ButtonCancelarVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonCancelarVeiculo.Click
        ListBoxVeiculo.Enabled = True
        If ListBoxVeiculo.Items.Count > 0 Then
            currentVeiculo = ListBoxVeiculo.SelectedIndex
            If currentVeiculo < 0 Then currentVeiculo = 0
            ShowVeiculo()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsVeiculo()
    End Sub

    Private Sub ButtonEditarVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonEditarVeiculo.Click
        currentVeiculo = ListBoxVeiculo.SelectedIndex
        If currentVeiculo < 0 Then
            MsgBox("Selecionar Veiculo para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsVeiculo()
        ListBoxVeiculo.Enabled = False
    End Sub

    Private Sub ButtonOKVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonOKVeiculo.Click
        Try
            SaveVeiculo()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxVeiculo.Enabled = True
        Dim idx As Integer = ListBoxVeiculo.FindString(TextBoxMatricula.Text)
        ListBoxVeiculo.SelectedIndex = idx
        Show3ButtonsVeiculo()
        VeículoToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonEliminarVeiculo.Click
        If ListBoxVeiculo.SelectedIndex > -1 Then
            Try
                RemoveVeiculo(CType(ListBoxVeiculo.SelectedItem, Veiculo).Matricula)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxVeiculo.Items.RemoveAt(ListBoxVeiculo.SelectedIndex)
            If currentVeiculo = ListBoxVeiculo.Items.Count Then currentVeiculo = ListBoxVeiculo.Items.Count - 1
            If currentVeiculo = -1 Then
                ClearFields()
                MsgBox("Não há mais Veiculos")
            Else
                ShowVeiculo()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarPeca_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarPeca.Click
        adding = True
        ClearFields()
        Hide3ButtonsPeca()
        ListBoxPeca.Enabled = False
    End Sub

    Private Sub ButtonCancelarPeca_Click(sender As Object, e As EventArgs) Handles ButtonCancelarPeca.Click
        ListBoxPeca.Enabled = True
        If ListBoxPeca.Items.Count > 0 Then
            currentPeca = ListBoxPeca.SelectedIndex
            If currentPeca < 0 Then currentPeca = 0
            ShowPeca()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsPeca()
    End Sub

    Private Sub ButtonEditarPeca_Click(sender As Object, e As EventArgs) Handles ButtonEditarPeca.Click
        currentPeca = ListBoxPeca.SelectedIndex
        If currentPeca < 0 Then
            MsgBox("Selecione uma Peça para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsPeca()
        ListBoxPeca.Enabled = False
    End Sub

    Private Sub ButtonOKPeca_Click(sender As Object, e As EventArgs) Handles ButtonOKPeca.Click
        Try
            SavePeca()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxPeca.Enabled = True
        Dim idx As Integer = ListBoxPeca.FindString(TextBoxReferencia.Text)
        ListBoxPeca.SelectedIndex = idx
        Show3ButtonsPeca()
        PeçaToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarPeca_Click(sender As Object, e As EventArgs) Handles ButtonEliminarPeca.Click
        If ListBoxPeca.SelectedIndex > -1 Then
            Try
                RemovePeca(CType(ListBoxPeca.SelectedItem, Peca).Referencia)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxPeca.Items.RemoveAt(ListBoxPeca.SelectedIndex)
            If currentPeca = ListBoxPeca.Items.Count Then currentPeca = ListBoxPeca.Items.Count - 1
            If currentPeca = -1 Then
                ClearFields()
                MsgBox("Não há mais Peças")
            Else
                ShowPeca()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarOficina_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarOficina.Click
        adding = True
        ClearFields()
        Hide3ButtonsOficina()
        ListBoxPeca.Enabled = False
    End Sub

    Private Sub ButtonCancelarOficina_Click(sender As Object, e As EventArgs) Handles ButtonCancelarOficina.Click
        ListBoxOficina.Enabled = True
        If ListBoxOficina.Items.Count > 0 Then
            currentOficina = ListBoxOficina.SelectedIndex
            If currentOficina < 0 Then currentOficina = 0
            ShowOficina()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsOficina()
    End Sub

    Private Sub ButtonEditarOficina_Click(sender As Object, e As EventArgs) Handles ButtonEditarOficina.Click
        currentOficina = ListBoxOficina.SelectedIndex
        If currentOficina < 0 Then
            MsgBox("Selecione uma Oficina para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsOficina()
        ListBoxOficina.Enabled = False
    End Sub

    Private Sub ButtonOKOficina_Click(sender As Object, e As EventArgs) Handles ButtonOKOficina.Click
        Try
            SaveOficina()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxOficina.Enabled = True
        Dim idx As Integer = ListBoxOficina.FindString(TextBoxNumeroOf.Text)
        ListBoxOficina.SelectedIndex = idx
        Show3ButtonsOficina()
        OficinaToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarOficina_Click(sender As Object, e As EventArgs) Handles ButtonEliminarOficina.Click
        If ListBoxOficina.SelectedIndex > -1 Then
            Try
                RemoveOficina(CType(ListBoxOficina.SelectedItem, Oficina).Numero)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxOficina.Items.RemoveAt(ListBoxOficina.SelectedIndex)
            If currentOficina = ListBoxOficina.Items.Count Then currentOficina = ListBoxOficina.Items.Count - 1
            If currentOficina = -1 Then
                ClearFields()
                MsgBox("Não há mais Oficinas")
            Else
                ShowOficina()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarRevisao_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarRevisao.Click
        adding = True
        ClearFields()
        Hide3ButtonsRevisao()
        ListBoxRevisao.Enabled = False
    End Sub

    Private Sub ButtonCancelarRevisao_Click(sender As Object, e As EventArgs) Handles ButtonCancelarRevisao.Click
        ListBoxRevisao.Enabled = True
        If ListBoxRevisao.Items.Count > 0 Then
            currentRevisao = ListBoxRevisao.SelectedIndex
            If currentRevisao < 0 Then currentRevisao = 0
            ShowRevisao()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsRevisao()
    End Sub

    Private Sub ButtonEditarRevisao_Click(sender As Object, e As EventArgs) Handles ButtonEditarRevisao.Click
        currentRevisao = ListBoxRevisao.SelectedIndex
        If currentRevisao < 0 Then
            MsgBox("Selecione uma Revisao para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsRevisao()
        ListBoxRevisao.Enabled = False
    End Sub

    Private Sub ButtonOKRevisao_Click(sender As Object, e As EventArgs) Handles ButtonOKRevisao.Click
        Try
            SaveRevisao()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxRevisao.Enabled = True
        Dim idx As Integer = ListBoxRevisao.FindString(TextBoxTipo.Text)
        ListBoxRevisao.SelectedIndex = idx
        Show3ButtonsRevisao()
        RevisãoToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarRevisao_Click(sender As Object, e As EventArgs) Handles ButtonEliminarRevisao.Click
        If ListBoxRevisao.SelectedIndex > -1 Then
            Try
                RemoveRevisao(CType(ListBoxRevisao.SelectedItem, Revisao).ID)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxRevisao.Items.RemoveAt(ListBoxRevisao.SelectedIndex)
            If currentRevisao = ListBoxRevisao.Items.Count Then currentRevisao = ListBoxRevisao.Items.Count - 1
            If currentRevisao = -1 Then
                ClearFields()
                MsgBox("Não há mais Revisões")
            Else
                ShowRevisao()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarReparacao_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarReparacao.Click
        adding = True
        ClearFields()
        Hide3ButtonsReparacao()
        ListBoxReparacao.Enabled = False
    End Sub

    Private Sub ButtonCancelarReparacao_Click(sender As Object, e As EventArgs) Handles ButtonCancelarReparacao.Click
        ListBoxReparacao.Enabled = True
        If ListBoxReparacao.Items.Count > 0 Then
            currentReparacao = ListBoxReparacao.SelectedIndex
            If currentReparacao < 0 Then currentReparacao = 0
            ShowReparacao()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsReparacao()
    End Sub

    Private Sub ButtonEditarReparacao_Click(sender As Object, e As EventArgs) Handles ButtonEditarReparacao.Click
        currentReparacao = ListBoxReparacao.SelectedIndex
        If currentReparacao < 0 Then
            MsgBox("Selecione uma Reparação para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsReparacao()
        ListBoxReparacao.Enabled = False
    End Sub

    Private Sub ButtonOKReparacao_Click(sender As Object, e As EventArgs) Handles ButtonOKReparacao.Click
        Try
            SaveReparacao()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxReparacao.Enabled = True
        Dim idx As Integer = ListBoxReparacao.FindString(TextBoxTipo.Text)
        ListBoxReparacao.SelectedIndex = idx
        Show3ButtonsReparacao()
        ReparaçãoToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarReparacao_Click(sender As Object, e As EventArgs) Handles ButtonEliminarReparacao.Click
        If ListBoxReparacao.SelectedIndex > -1 Then
            Try
                RemoveReparacao(CType(ListBoxReparacao.SelectedItem, Reparacao).ID)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxReparacao.Items.RemoveAt(ListBoxReparacao.SelectedIndex)
            If currentReparacao = ListBoxReparacao.Items.Count Then currentReparacao = ListBoxReparacao.Items.Count - 1
            If currentReparacao = -1 Then
                ClearFields()
                MsgBox("Não há mais Reparações")
            Else
                ShowReparacao()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarGerente_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarGerente.Click
        adding = True
        ClearFields()
        Hide3ButtonsGerente()
        ListBoxGerente.Enabled = False
    End Sub

    Private Sub ButtonCancelarGerente_Click(sender As Object, e As EventArgs) Handles ButtonCancelarGerente.Click
        ListBoxGerente.Enabled = True
        If ListBoxGerente.Items.Count > 0 Then
            currentGerente = ListBoxGerente.SelectedIndex
            If currentGerente < 0 Then currentGerente = 0
            ShowGerente()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsGerente()
    End Sub

    Private Sub ButtonEditarGerente_Click(sender As Object, e As EventArgs) Handles ButtonEditarGerente.Click
        currentGerente = ListBoxGerente.SelectedIndex
        If currentGerente < 0 Then
            MsgBox("Selecione um Gerente para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsGerente()
        ListBoxGerente.Enabled = False
    End Sub

    Private Sub ButtonOKGerente_Click(sender As Object, e As EventArgs) Handles ButtonOKGerente.Click
        Try
            SaveGerente()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxGerente.Enabled = True
        Dim idx As Integer = ListBoxGerente.FindString(TextBoxNIF.Text)
        ListBoxGerente.SelectedIndex = idx
        Show3ButtonsGerente()
        GerenteToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarGerente_Click(sender As Object, e As EventArgs) Handles ButtonEliminarGerente.Click
        If ListBoxGerente.SelectedIndex > -1 Then
            Try
                RemoveGerente(CType(ListBoxGerente.SelectedItem, Gerente).NIF)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxGerente.Items.RemoveAt(ListBoxGerente.SelectedIndex)
            If currentGerente = ListBoxGerente.Items.Count Then currentGerente = ListBoxGerente.Items.Count - 1
            If currentGerente = -1 Then
                ClearFields()
                MsgBox("Não há mais Gerentes")
            Else
                ShowGerente()
            End If
        End If
    End Sub

    Private Sub ButtonAdicionarMecanico_Click(sender As Object, e As EventArgs) Handles ButtonAdicionarMecanico.Click
        adding = True
        ClearFields()
        Hide3ButtonsMecanico()
        ListBoxMecanico.Enabled = False
    End Sub

    Private Sub ButtonCancelarMecanico_Click(sender As Object, e As EventArgs) Handles ButtonCancelarMecanico.Click
        ListBoxMecanico.Enabled = True
        If ListBoxMecanico.Items.Count > 0 Then
            currentMecanico = ListBoxMecanico.SelectedIndex
            If currentMecanico < 0 Then currentMecanico = 0
            ShowMecanico()
        Else
            ClearFields()
            LockControls()
        End If
        Show3ButtonsMecanico()
    End Sub

    Private Sub ButtonEditarMecanico_Click(sender As Object, e As EventArgs) Handles ButtonEditarMecanico.Click
        currentMecanico = ListBoxMecanico.SelectedIndex
        If currentMecanico < 0 Then
            MsgBox("Selecione um Mecânico para editar")
            Exit Sub
        End If
        adding = False
        Hide3ButtonsMecanico()
        ListBoxMecanico.Enabled = False
    End Sub

    Private Sub ButtonOKMecanico_Click(sender As Object, e As EventArgs) Handles ButtonOKMecanico.Click
        Try
            SaveMecanico()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxMecanico.Enabled = True
        Dim idx As Integer = ListBoxMecanico.FindString(TextBoxNIF.Text)
        ListBoxMecanico.SelectedIndex = idx
        Show3ButtonsMecanico()
        MecanicoToolStripMenuItem_Click(sender, e)
    End Sub

    Private Sub ButtonEliminarMecanico_Click(sender As Object, e As EventArgs) Handles ButtonEliminarMecanico.Click
        If ListBoxMecanico.SelectedIndex > -1 Then
            Try
                RemoveMecanico(CType(ListBoxMecanico.SelectedItem, Mecanico).NIF)
            Catch ex As Exception
                MsgBox(ex.Message)
                Exit Sub
            End Try
            ListBoxMecanico.Items.RemoveAt(ListBoxMecanico.SelectedIndex)
            If currentMecanico = ListBoxMecanico.Items.Count Then currentMecanico = ListBoxMecanico.Items.Count - 1
            If currentMecanico = -1 Then
                ClearFields()
                MsgBox("Não há mais Mecânicos")
            Else
                ShowMecanico()
            End If
        End If
    End Sub

    Private Function DropConstraintADDOFICINAFK()
        CMD.CommandText = "ALTER TABLE Oficina_DB.Funcionario DROP CONSTRAINT IF EXISTS ADDOFICINAFK;"
        CMD.Parameters.Clear()
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a constraint ADDOFICINAFZ. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Function

    Private Function DropConstraintADDGERENTEFK()
        CMD.CommandText = "ALTER TABLE Oficina_DB.Oficina DROP CONSTRAINT IF EXISTS ADDGERENTEFK;"
        CMD.Parameters.Clear()
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel apagar a constraint ADDGERENTEFK. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Function

    Private Function AddConstraintADDOFICINAFK()
        CMD.CommandText = "ALTER TABLE Oficina_DB.Funcionario ADD CONSTRAINT ADDOFICINAFK FOREIGN KEY (n_oficina) REFERENCES Oficina_DB.Oficina(numero);"
        CMD.Parameters.Clear()
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel adicionar a constraint ADDOFICINAFK. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Function

    Private Function AddConstraintADDGERENTEFK()
        CMD.CommandText = "ALTER TABLE Oficina_DB.Oficina ADD CONSTRAINT ADDGERENTEFK FOREIGN KEY (gerente) REFERENCES Oficina_DB.Gerente(nif);"
        CMD.Parameters.Clear()
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel adicionar a constraint ADDGERENTEFK. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Function

    Private Function DropConstraints()
        DropConstraintADDOFICINAFK()
        DropConstraintADDGERENTEFK()
    End Function

    Private Function AddConstraints()
        AddConstraintADDOFICINAFK()
        AddConstraintADDGERENTEFK()
    End Function

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxParceiro.SelectedIndexChanged
        If ComboBoxParceiro.SelectedIndex = 0 Then
            TextBoxParceiro.Text = 0
        Else
            TextBoxParceiro.Text = 1
        End If
    End Sub

    Private Sub ButtonComprar_Click(sender As Object, e As EventArgs) Handles ButtonComprar.Click
        currentPeca = ListBoxPeca.SelectedIndex
        If currentPeca < 0 Then
            MsgBox("Selecione uma Peça para comprar")
            Exit Sub
        End If
        compra = True
        ShowComprarPeca()
        ListBoxPeca.Enabled = False
    End Sub

    Private Sub ButtonConfirmarCompra_Click(sender As Object, e As EventArgs) Handles ButtonConfirmarCompra.Click
        Try
            SavePeca2()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        ListBoxPeca.Enabled = True
        Dim idx As Integer = ListBoxPeca.FindString(TextBoxReferencia.Text)
        ListBoxPeca.SelectedIndex = idx
        Show3ButtonsPeca()
        TextBoxComprar.Text = ""
        PeçaToolStripMenuItem_Click(sender, e)
    End Sub

    Sub SaveCompra(ByVal P As Peca)
        CMD.CommandText = "EXEC comprarPeca @referencia, @npecas"
        CMD.Parameters.Clear()
        CMD.Parameters.AddWithValue("@referencia", P.Referencia)
        CMD.Parameters.AddWithValue("@npecas", P.NumCompra)
        CN.Open()
        Try
            CMD.ExecuteNonQuery()
        Catch ex As Exception
            Throw New Exception("Nao foi possivel adicionar a compra de peças na Base de Dados" & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
    End Sub

    Private Sub ComboBoxTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBoxTipo.SelectedIndexChanged
        If ComboBoxTipo.SelectedIndex = 0 Then
            TextBoxTipo.Text = 1
        ElseIf ComboBoxTipo.SelectedIndex = 1 Then
            TextBoxTipo.Text = 2
        Else
            TextBoxTipo.Text = 3
        End If
    End Sub

    Private Sub ButtonLucroOficina_Click(sender As Object, e As EventArgs) Handles ButtonLucroOficina.Click
        LabelOrdenadosView.Visible = False
        LabelOficinaView.Visible = True
        LabelFuncionariosView.Visible = True
        LabelLucroView.Visible = True
        Dim oficina As String
        Dim n_serviços As String
        Dim lucro As String
        CMD.CommandText = "SELECT oficina, n_servicos, lucro FROM LucroOficina"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxView.Items.Clear()
        While RDR.Read
            oficina = RDR.Item("oficina")
            n_serviços = RDR.Item("n_servicos")
            lucro = RDR.Item("lucro")
            ListBoxView.Items.Add(oficina & Chr(9) & "   " & n_serviços & Chr(9) & Chr(9) & lucro)
        End While
        CN.Close()
    End Sub

    Private Sub ButtonTotalOrdenados_Click(sender As Object, e As EventArgs) Handles ButtonTotalOrdenados.Click
        LabelOrdenadosView.Visible = True
        LabelOficinaView.Visible = True
        LabelFuncionariosView.Visible = False
        LabelLucroView.Visible = False
        Dim oficina As String
        Dim ordenados As String
        CMD.CommandText = "SELECT oficina, ordenados FROM TotalOrdenados"
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxView.Items.Clear()
        While RDR.Read
            oficina = RDR.Item("oficina")
            ordenados = RDR.Item("ordenados")
            ListBoxView.Items.Add(oficina & Chr(9) & "   " & ordenados)
        End While
        CN.Close()
    End Sub

    Private Sub ButtonPesquisarCliente_Click(sender As Object, e As EventArgs) Handles ButtonPesquisarCliente.Click
        ShowPesquisaClienteButtons()
    End Sub

    Private Sub ButtonPesquisarFunc_Click(sender As Object, e As EventArgs) Handles ButtonPesquisarFunc.Click
        ShowPesquisaFuncButtons()
    End Sub

    Private Sub ButtonPesquisarVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonPesquisarVeiculo.Click
        ShowPesquisaVeiculoButtons()
    End Sub

    Private Sub ButtonPesquisarServico_Click(sender As Object, e As EventArgs) Handles ButtonPesquisarServico.Click
        ShowPesquisaServicoButtons()
    End Sub

    Private Sub ButtonPesquisarPeca_Click(sender As Object, e As EventArgs) Handles ButtonPesquisarPeca.Click
        ShowPesquisaPecaButtons()
    End Sub

    Private Sub ButtonPesqCliente_Click(sender As Object, e As EventArgs) Handles ButtonPesqCliente.Click
        HideEverything()
        pesqCliente = TextBoxPesquisarCliente.Text
        If pesqCliente Is Nothing Or pesqCliente = "" Then
            ClienteToolStripMenuItem_Click(sender, e)
            Exit Sub
        End If
        ShowClienteButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC searchCliente @nome"
        CMD.Parameters.AddWithValue("@nome", pesqCliente)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxCliente.Items.Clear()
        While RDR.Read
            Dim C As New Cliente
            C.NIF = RDR.Item("nif")
            C.Parceiro = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("parceiro")), "", RDR.Item("parceiro")))
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("apelido")) Then C.Apelido = RDR.Item("apelido")
            If Not IsDBNull(RDR.Item("endereco")) Then C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            ListBoxCliente.Items.Add(C)
        End While
        CN.Close()
        currentCliente = 0
        ShowCliente()
    End Sub

    Private Sub ButtonPesqFunc_Click(sender As Object, e As EventArgs) Handles ButtonPesqFunc.Click
        HideEverything()
        pesqFunc = TextBoxPesquisarFunc.Text
        If pesqFunc Is Nothing Or pesqFunc = "" Then
            MecanicoToolStripMenuItem_Click(sender, e)
            Exit Sub
        End If
        ShowMecanicoButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC searchFunc @nome"
        CMD.Parameters.AddWithValue("@nome", pesqFunc)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxMecanico.Items.Clear()
        While RDR.Read
            Dim C As New Mecanico
            C.NIF = RDR.Item("nif")
            If Not IsDBNull(RDR.Item("especialidade")) Then C.Especialidade = RDR.Item("especialidade")
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("apelido")) Then C.Apelido = RDR.Item("apelido")
            If Not IsDBNull(RDR.Item("endereco")) Then C.Endereco = RDR.Item("endereco")
            C.Telefone = RDR.Item("telefone")
            If Not IsDBNull(RDR.Item("n_oficina")) Then C.Oficina = RDR.Item("n_oficina")
            If Not IsDBNull(RDR.Item("salario")) Then C.Salario = RDR.Item("salario")
            ListBoxMecanico.Items.Add(C)
        End While
        CN.Close()
        currentMecanico = 0
        ShowMecanico()
    End Sub

    Private Sub ButtonPesqVeiculo_Click(sender As Object, e As EventArgs) Handles ButtonPesqVeiculo.Click
        HideEverything()
        pesqVeiculo = TextBoxPesquisarVeiculo.Text
        If pesqVeiculo Is Nothing Or pesqVeiculo = "" Then
            VeículoToolStripMenuItem_Click(sender, e)
            Exit Sub
        End If
        ShowVeiculoButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC searchVeiculo @matricula"
        CMD.Parameters.AddWithValue("@matricula", pesqVeiculo)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxVeiculo.Items.Clear()
        While RDR.Read
            Dim C As New Veiculo
            If Not IsDBNull(RDR.Item("tipo")) Then C.Tipo = RDR.Item("tipo")
            C.Matricula = RDR.Item("matricula")
            If Not IsDBNull(RDR.Item("marca")) Then C.Marca = RDR.Item("marca")
            C.Dono = RDR.Item("dono")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_in")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_in")), "", RDR.Item("data_in")))
            If Not IsDBNull(RDR.Item("data_out")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_out")), "", RDR.Item("data_out")))
            ListBoxVeiculo.Items.Add(C)
        End While
        CN.Close()
        currentVeiculo = 0
        ShowVeiculo()
    End Sub

    Private Sub ButtonPesqServico_Click(sender As Object, e As EventArgs) Handles ButtonPesqServico.Click
        HideEverything()
        pesqServico = TextBoxPesquisarServico.Text
        If pesqServico Is Nothing Or pesqServico = "" Then
            TodosToolStripMenuItem1_Click(sender, e)
            Exit Sub
        End If
        ShowServiçoButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC searchServico @item"
        CMD.Parameters.AddWithValue("@item", pesqServico)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxServiço.Items.Clear()
        While RDR.Read
            Dim C As New Servico
            C.ID = RDR.Item("id")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            If Not IsDBNull(RDR.Item("preco_final")) Then C.PreçoFinal = RDR.Item("preco_final")
            C.Veiculo = RDR.Item("veiculo")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_inic")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_inic")), "", RDR.Item("data_inic")))
            If Not IsDBNull(RDR.Item("data_conc")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_conc")), "", RDR.Item("data_conc")))
            ListBoxServiço.Items.Add(C)
        End While
        CN.Close()
        currentServiço = 0
        ShowServiço()

    End Sub

    Private Sub ButtonPesqPeca_Click(sender As Object, e As EventArgs) Handles ButtonPesqPeca.Click
        HideEverything()
        pesqPeca = TextBoxPesquisarPeca.Text
        If pesqPeca Is Nothing Or pesqPeca = "" Then
            PeçaToolStripMenuItem_Click(sender, e)
            Exit Sub
        End If
        ShowPecaButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC searchPeca @ref"
        CMD.Parameters.AddWithValue("@ref", pesqPeca)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxPeca.Items.Clear()
        While RDR.Read
            Dim C As New Peca
            C.Nome = RDR.Item("nome")
            If Not IsDBNull(RDR.Item("num_stock")) Then C.Num_Stock = RDR.Item("num_stock")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            C.Referencia = RDR.Item("referencia")
            ListBoxPeca.Items.Add(C)
        End While
        CN.Close()
        currentPeca = 0
        ShowPeca()

    End Sub

    Private Sub ButtonVerServicos_Click(sender As Object, e As EventArgs) Handles ButtonVerServicos.Click
        HideEverything()
        ShowServiçoButtons()
        CMD.Parameters.Clear()
        CMD.CommandText = "EXEC seeServicos @nif"
        CMD.Parameters.AddWithValue("@nif", verServicos)
        CN.Open()
        Dim RDR As SqlDataReader
        RDR = CMD.ExecuteReader
        ListBoxServiço.Items.Clear()
        While RDR.Read
            Dim C As New Servico
            C.ID = RDR.Item("id")
            If Not IsDBNull(RDR.Item("preco")) Then C.Preço = RDR.Item("preco")
            If Not IsDBNull(RDR.Item("preco_final")) Then C.PreçoFinal = RDR.Item("preco_final")
            C.Veiculo = RDR.Item("veiculo")
            C.Oficina = RDR.Item("oficina")
            If Not IsDBNull(RDR.Item("data_inic")) Then C.Data_In = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_inic")), "", RDR.Item("data_inic")))
            If Not IsDBNull(RDR.Item("data_conc")) Then C.Data_Out = Convert.ToString(IIf(RDR.IsDBNull(RDR.GetOrdinal("data_conc")), "", RDR.Item("data_conc")))
            ListBoxServiço.Items.Add(C)
        End While
        CN.Close()
        currentServiço = 0
        ShowServiço()
    End Sub

    Private Function MecanicoServico(ByVal id As String) As Integer
        Dim nif As Integer
        CMD.Parameters.Clear()
        CMD.CommandText = "SELECT Oficina_DB.MecanicoServico(@id)"
        CMD.Parameters.AddWithValue("@id", id)
        CN.Open()
        Try
            If Not IsDBNull(CMD.ExecuteScalar()) Then
                nif = CMD.ExecuteScalar()
            Else
                nif = -1
            End If
        Catch ex As Exception
            Throw New Exception("Nao foi possivel detetar Mecanico no Serviço. " & vbCrLf & "ERROR MESSAGE: " & vbCrLf & ex.Message)
        Finally
            CN.Close()
        End Try
        Return nif
    End Function


End Class


