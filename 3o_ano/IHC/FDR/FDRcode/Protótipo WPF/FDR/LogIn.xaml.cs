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
    /// Interaction logic for LogIn.xaml
    /// </summary>
    public partial class LogIn : Page
    {
        public LogIn()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Home home = new Home();
            this.NavigationService.Navigate(home);
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Boolean existeCaridade = false;
            Boolean existeRestaurante = false;
            UserCaridade caridade = new UserCaridade();
            UserRestaurante restaurante = new UserRestaurante();

            
            if (txtBox_EmailLogIn.Text == "" || txtBox_PswLogIn.Password.ToString().Equals(""))
            {
                MessageBox.Show("Please fill in all fields");
            }

            else
            {
                foreach (UserCaridade c in CreateClasses.ListaCaridades)
                {
                    if (c.emailCaridade == txtBox_EmailLogIn.Text)
                    {
                        existeCaridade = true;
                        caridade = c;

                    }
                }

                foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
                {
                    if (r.emailRestaurante == txtBox_EmailLogIn.Text)
                    {
                        existeRestaurante = true;
                        restaurante = r;
                    }
                }

                if (existeCaridade)
                {
                    if (!caridade.passwordCaridade.Equals(txtBox_PswLogIn.Password))
                    {
                        MessageBox.Show("The password provided is incorrect");
                    }
                    else
                    {
                        HelloCharity helloCharity = new HelloCharity(caridade);
                        this.NavigationService.Navigate(helloCharity);
                    }

                }

                else if (existeRestaurante)
                {
                    if (!restaurante.passwordRestaurante.Equals(txtBox_PswLogIn.Password))
                    {
                        MessageBox.Show("The password provided is incorrect");
                    }
                    else
                    {
                        HelloRestaurant helloRestaurant = new HelloRestaurant(restaurante);
                        this.NavigationService.Navigate(helloRestaurant);
                    }

                }

                else
                {
                    MessageBox.Show("Unknown username");
                }
            }
        }
    }
}
