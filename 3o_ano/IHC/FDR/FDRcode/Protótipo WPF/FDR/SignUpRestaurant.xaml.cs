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
    /// Interaction logic for SignUpRestaurant.xaml
    /// </summary>
    public partial class SignUpRestaurant : Page
    {
        public SignUpRestaurant(UserRestaurante restaurante = null)
        {
            InitializeComponent();
            InitializeComponent();
            if (restaurante != null)
            {
                txtBoxCode_Restaurante.Text = restaurante.codeRestaurante;
                txtBoxNome_Restaurante.Text = restaurante.nomeRestaurante;
                ComboBoxCidade_Restaurante.Text = restaurante.cidadeRestaurante;
                txtBoxMorada_Restaurante.Text = restaurante.moradaRestaurante;
                
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            SignUp signUp = new SignUp();
            this.NavigationService.Navigate(signUp);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (txtBoxCode_Restaurante.Text == "" || txtBoxNome_Restaurante.Text == "" || ComboBoxCidade_Restaurante.SelectedIndex == -1 || txtBoxMorada_Restaurante.Text == "")
            {
                MessageBox.Show("Please fill in all fields");
            }
            else
            {
                if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 1)
                {
                    MessageBox.Show("Your certificate code should have between 4 and 10 characters");
                }
                else if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 2)
                {
                    MessageBox.Show("Your restaurant name should have between 4 and 25 characters");
                }
                else if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 3)
                {
                    MessageBox.Show("Your restaurant name must have at least one letter");
                }
                else if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 4)
                {
                    MessageBox.Show("Your address must have at least 10 characters");
                }
                else if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 5)
                {
                    MessageBox.Show("Your address must have at least one letter");
                }
                else if (allVerifications(txtBoxCode_Restaurante.Text, txtBoxNome_Restaurante.Text, txtBoxMorada_Restaurante.Text) == 0)
                {
                    UserRestaurante restaurante1 = new UserRestaurante();
                    restaurante1.codeRestaurante = txtBoxCode_Restaurante.Text;
                    restaurante1.nomeRestaurante = txtBoxNome_Restaurante.Text;
                    restaurante1.cidadeRestaurante = ((ComboBoxItem)ComboBoxCidade_Restaurante.SelectedItem).Content.ToString();
                    restaurante1.moradaRestaurante = txtBoxMorada_Restaurante.Text;

                    WeAreAlmostReadyR weAreAlmostReadyR = new WeAreAlmostReadyR(restaurante1);
                    this.NavigationService.Navigate(weAreAlmostReadyR);
                }
            }
        }

        // 0 = tudo correto - 1 = codigo inválido - 2 e 3 = nome inválido - 4 e 5 = morada inválida
        public int allVerifications(String code, String nome, String morada)
        {
            if (code.Length < 4 || code.Length > 10) return 1;
            if (nome.Length < 4 || nome.Length > 25) return 2;
            if (nome.Length >= 4 && nome.Length <= 25)
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
                if(!hasChar) return 3;
            }
            if (morada.Length < 10) return 4;
            if (morada.Length >= 10)
            {
                bool hasChar2 = false;
                foreach (char c in morada)
                {
                    if (Char.IsLetter(c)) hasChar2 = true;
                    if (hasChar2) return 0;
                }
                return 5;
            }
            return 0;
        }
    }

    public class UserRestaurante
    {
        private string _codeRestaurante;
        private string _nomeRestaurante;
        private string _cidadeRestaurante;
        private string _moradaRestaurante;
        private string _emailRestaurante;
        private string _passwordRestaurante;
        private List<Pedido> _pedidosRestaurante = new List<Pedido>();
        private List<Pedido> _pedidosAceitesRestaurante = new List<Pedido>();
        private List<Pedido> _pedidosPassadosRestaurante = new List<Pedido>();

        public string codeRestaurante
        {
            get { return _codeRestaurante; }
            set { _codeRestaurante = value; }
        }
        public string nomeRestaurante
        {
            get { return _nomeRestaurante; }
            set { _nomeRestaurante = value; }
        }
        public string cidadeRestaurante
        {
            get { return _cidadeRestaurante; }
            set { _cidadeRestaurante = value; }
        }
        public string moradaRestaurante
        {
            get { return _moradaRestaurante; }
            set { _moradaRestaurante = value; }
        }

        public string emailRestaurante
        {
            get { return _emailRestaurante; }
            set { _emailRestaurante = value; }
        }

        public string passwordRestaurante
        {
            get { return _passwordRestaurante; }
            set { _passwordRestaurante = value; }
        }

        public List<Pedido> pedidosRestaurante
        {
            get { return _pedidosRestaurante; }
            set { _pedidosRestaurante = value; }
        }
        public List<Pedido> pedidosAceitesRestaurante
        {
            get { return _pedidosAceitesRestaurante; }
            set { _pedidosAceitesRestaurante = value; }
        }
        public List<Pedido> pedidosPassadosRestaurante
        {
            get { return _pedidosPassadosRestaurante; }
            set { _pedidosPassadosRestaurante = value; }
        }
    }
}
