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
    /// Interaction logic for SignUp.xaml
    /// </summary>
    public partial class SignUp : Page
    {
        public SignUp()
        {
            InitializeComponent();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Home home = new Home();
            this.NavigationService.Navigate(home);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            SignUpCharity signUpCharity = new SignUpCharity();
            this.NavigationService.Navigate(signUpCharity);
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            SignUpRestaurant signUpRestaurant = new SignUpRestaurant();
            this.NavigationService.Navigate(signUpRestaurant);
        }
    }
}
