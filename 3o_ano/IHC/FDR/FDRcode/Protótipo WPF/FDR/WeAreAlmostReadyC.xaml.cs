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
    /// Interaction logic for Page11.xaml
    /// </summary>
    public partial class WeAreAlmostReadyC : Page
    {
        private UserCaridade caridadeFinal;

        public WeAreAlmostReadyC(UserCaridade caridade1)
        {
            InitializeComponent();
            caridadeFinal = caridade1;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            SignUpCharity signUpCharity = new SignUpCharity(caridadeFinal);
            this.NavigationService.Navigate(signUpCharity);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (TxtBoxCaridade_Email.Text == "" || PswBoxCaridade.Password.ToString().Equals("") || PswBoxConfirmCaridade.Password.ToString().Equals(""))
            {
                MessageBox.Show("Please fill in all fields");
            }
            else
            {
                if(emailIsValid(TxtBoxCaridade_Email.Text) == 1)
                {
                    MessageBox.Show("Please insert a valid email");
                }
                else if (emailIsValid(TxtBoxCaridade_Email.Text) == 2)
                {
                    MessageBox.Show("That email is already taken, please insert another one");
                }
                else if (passIsValid(PswBoxCaridade.Password.ToString()) == 1)
                {
                    MessageBox.Show("Please insert a password between 6 and 16 characters");
                }
                else if (passIsValid(PswBoxCaridade.Password.ToString()) == 2)
                {
                    MessageBox.Show("Please insert at least one letter and one digit");
                }
                else if (!PswBoxCaridade.Password.Equals(PswBoxConfirmCaridade.Password))
                {
                    MessageBox.Show("Passwords inserted dont match");
                }
                else
                {
                    caridadeFinal.emailCaridade = TxtBoxCaridade_Email.Text;
                    caridadeFinal.passwordCaridade = PswBoxCaridade.Password.ToString();
                    CreateClasses.ListaCaridades.Add(caridadeFinal);

                    HelloCharity helloCharity = new HelloCharity(caridadeFinal);
                    this.NavigationService.Navigate(helloCharity);
                }
            } 
        }

        // 0 = valido, 1 = invalido, 2 = ja usado
        public int emailIsValid(String email)
        {
            int count = 0;
            foreach(char c in TxtBoxCaridade_Email.Text)
            {
                if(c == '@' || c == '.')
                {
                    count += 1;
                    if (count == 2) break;
                }
            }
            if (count < 2) return 1;

            // Verificar se nao ha nenhuma caridade com esse email
            foreach (UserCaridade c in CreateClasses.ListaCaridades)
                if (c.emailCaridade.Equals(TxtBoxCaridade_Email.Text))
                    return 2;

            // Verificar se nao ha nenhum restaurante com esse email
            foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
                if (r.emailRestaurante.Equals(TxtBoxCaridade_Email.Text))
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
