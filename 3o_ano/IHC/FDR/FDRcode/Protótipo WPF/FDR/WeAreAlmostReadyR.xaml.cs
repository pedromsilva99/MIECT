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
    /// Interaction logic for Page10.xaml
    /// </summary>
    public partial class WeAreAlmostReadyR : Page
    {
        private UserRestaurante restauranteFinal;

        public WeAreAlmostReadyR(UserRestaurante restaurante1)
        {
            InitializeComponent();
            restauranteFinal = restaurante1;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            SignUpRestaurant signUpRestaurant = new SignUpRestaurant(restauranteFinal);
            this.NavigationService.Navigate(signUpRestaurant);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (TxtBoxRestaurante_Email.Text == "" || PswBoxRestaurante.Password.ToString().Equals("") || PswBoxConfirmRestaurante.Password.ToString().Equals(""))
            {
                MessageBox.Show("Please fill in all fields");
            }
            else
            {
                if (emailIsValid(TxtBoxRestaurante_Email.Text) == 1)
                {
                    MessageBox.Show("Please insert a valid email");
                }
                else if (emailIsValid(TxtBoxRestaurante_Email.Text) == 2)
                {
                    MessageBox.Show("That email is already taken, please insert another one");
                }
                else if (passIsValid(PswBoxRestaurante.Password.ToString()) == 1)
                {
                    MessageBox.Show("Please insert a password between 6 and 16 characters");
                }
                else if (passIsValid(PswBoxRestaurante.Password.ToString()) == 2)
                {
                    MessageBox.Show("Please insert at least one letter and one digit");
                }
                else if (!PswBoxRestaurante.Password.Equals(PswBoxConfirmRestaurante.Password))
                {
                    MessageBox.Show("Passwords inserted dont match");
                }
                else
                {
                    restauranteFinal.emailRestaurante = TxtBoxRestaurante_Email.Text;
                    restauranteFinal.passwordRestaurante = PswBoxRestaurante.Password.ToString();
                    CreateClasses.ListaRestaurantes.Add(restauranteFinal);
                    HelloRestaurant helloRestaurant = new HelloRestaurant(restauranteFinal);
                    this.NavigationService.Navigate(helloRestaurant);
                }
            }
        }

        // 0 = valido, 1 = invalido, 2 = ja usado
        public int emailIsValid(String email)
        {
            int count = 0;
            foreach (char c in TxtBoxRestaurante_Email.Text)
            {
                if (c == '@' || c == '.')
                {
                    count += 1;
                    if (count == 2) break;
                }
            }
            if (count < 2) return 1;

            // Verificar se nao ha nenhuma caridade com esse email
            foreach (UserCaridade c in CreateClasses.ListaCaridades)
                if (c.emailCaridade.Equals(TxtBoxRestaurante_Email.Text))
                    return 2;

            // Verificar se nao ha nenhum restaurante com esse email
            foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
                if (r.emailRestaurante.Equals(TxtBoxRestaurante_Email.Text))
                    return 2;
            return 0;
        }

        public int passIsValid(String pass)
        {
            if (pass.Length < 6 || pass.Length > 16) return 1;
            if (pass.Length >= 6 && pass.Length <= 16)
            {
                bool hasChar = false;
                bool hasNum = false;
                foreach (char c in pass)
                {
                    if (Char.IsDigit(c)) hasNum = true;
                    if (Char.IsLetter(c)) hasChar = true;
                    if (hasChar && hasNum) break;
                }
                if (!hasChar || !hasNum) return 2;
            }
            return 0;
        }
    }
}
