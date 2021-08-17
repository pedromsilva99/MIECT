using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FDR
{
    /// <summary>
    /// Interaction logic for SignUpCharity.xaml
    /// </summary>
    public partial class SignUpCharity : Page
    {
       
        public SignUpCharity(UserCaridade caridade = null)
        {
            InitializeComponent();
            if (caridade != null)
            {
                txtBoxNIF_Caridade.Text = caridade.NIFCaridade;
                txtBoxNome_Caridade.Text = caridade.nomeCaridade;
                ComboBoxCidade_Caridade.Text = caridade.cidadeCaridade;
                txtBoxmorada_Caridade.Text = caridade.moradaCaridade;
            }
            
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            SignUp signUp = new SignUp();
            this.NavigationService.Navigate(signUp);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (txtBoxNIF_Caridade.Text == "" || txtBoxNome_Caridade.Text == "" || ComboBoxCidade_Caridade.SelectedIndex == -1 || txtBoxmorada_Caridade.Text == "")
            {
                MessageBox.Show("Please fill in all fields");
            }

            else
            {
                if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 1)
                {
                    MessageBox.Show("Your NIF must have 9 digits");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 2)
                {
                    MessageBox.Show("Your NIF must have 9 digits");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 3)
                {
                    MessageBox.Show("Your institution name should have between 3 and 25 characters");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 4)
                {
                    MessageBox.Show("Your institution name must have at least one letter");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 5)
                {
                    MessageBox.Show("Your address must have at least 10 characters");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 6)
                {
                    MessageBox.Show("Your address must have at least one letter");
                }
                else if (allVerifications(txtBoxNIF_Caridade.Text, txtBoxNome_Caridade.Text, txtBoxmorada_Caridade.Text) == 0)
                {
                    UserCaridade caridade1 = new UserCaridade();
                    caridade1.NIFCaridade = txtBoxNIF_Caridade.Text;
                    caridade1.nomeCaridade = txtBoxNome_Caridade.Text;
                    caridade1.cidadeCaridade = ((ComboBoxItem)ComboBoxCidade_Caridade.SelectedItem).Content.ToString();
                    caridade1.moradaCaridade = txtBoxmorada_Caridade.Text;

                    WeAreAlmostReadyC weAreAlmostReadyC = new WeAreAlmostReadyC(caridade1);
                    this.NavigationService.Navigate(weAreAlmostReadyC);
                }
            }
        }

        // 0 = tudo correto - 1 e 2 = nif inválido - 3 e 4 = nome inválido - 5 e 6 = morada inválida
        public int allVerifications(String nif, String nome, String morada)
        {
            if (nif.Length != 9) return 1;
            if (nif.Length == 9)
            {
                int countNum = 0;
                foreach (char c in nif)
                {
                    if (Char.IsDigit(c)) countNum++;
                }
                if (countNum != 9) return 2;
            }
            if (nome.Length < 3 || nome.Length > 25) return 3;
            if (nome.Length >= 3 && nome.Length <= 25)
            {
                bool hasChar = false;
                foreach (char c in nome)
                {
                    if (Char.IsLetter(c))
                    {
                        hasChar = true;
                        break;
                    }
                }
                if(!hasChar) return 4;
            }
            if (morada.Length < 10) return 5;
            if (morada.Length >= 10)
            {
                bool hasChar2 = false;
                foreach (char c in morada)
                {
                    if (Char.IsLetter(c)) hasChar2 = true;
                    if (hasChar2) return 0;
                }
                return 6;
            }
            return 0;
        }
    }

    public class UserCaridade
    {
        private string _NIFCaridade;
        private string _nomeCaridade;
        private string _cidadeCaridade;
        private string _moradaCaridade;
        private string _emailCaridade;
        private string _passwordCaridade;
        private List<Pedido> _pedidosCaridade = new List<Pedido>();
        private List<Pedido> _pedidosPassadosCaridade = new List<Pedido>();

        public string NIFCaridade
        {
            get { return _NIFCaridade; }
            set { _NIFCaridade = value; }
        }
        public string nomeCaridade
        {
            get { return _nomeCaridade; }
            set { _nomeCaridade = value; }
        }
        public string cidadeCaridade
        {
            get { return _cidadeCaridade; }
            set { _cidadeCaridade = value; }
        }
        public string moradaCaridade
        {
            get { return _moradaCaridade; }
            set { _moradaCaridade = value; }
        }

        public string emailCaridade
        {
            get { return _emailCaridade; }
            set { _emailCaridade = value; }
        }

        public string passwordCaridade
        {
            get { return _passwordCaridade; }
            set { _passwordCaridade = value; }
        }
        public List<Pedido> pedidosCaridade
        {
            get { return _pedidosCaridade; }
            set { _pedidosCaridade = value; }
        }
        public List<Pedido> pedidosPassadosCaridade
        {
            get { return _pedidosPassadosCaridade; }
            set { _pedidosPassadosCaridade = value; }
        }
    }
}
