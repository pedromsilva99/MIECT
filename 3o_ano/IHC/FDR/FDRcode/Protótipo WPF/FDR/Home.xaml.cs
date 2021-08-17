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
    /// Interaction logic for Home.xaml
    /// </summary>
    public partial class Home : Page
    {
        public Home()
        {
            InitializeComponent();
        }

        private void ButtonLogIn_Click(object sender, RoutedEventArgs e)
        {
            LogIn logIn = new LogIn();
            this.NavigationService.Navigate(logIn);
        }

        private void ButtonSignUp_Click(object sender, RoutedEventArgs e)
        {
            SignUp signUp = new SignUp();
            this.NavigationService.Navigate(signUp);
        }

        private void ButtonHelp_Click(object sender, RoutedEventArgs e)
        {
            FAQ faq = new FAQ();
            this.NavigationService.Navigate(faq);
        }

    }
}
