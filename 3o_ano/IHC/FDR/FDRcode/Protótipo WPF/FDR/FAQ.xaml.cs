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
    /// Interaction logic for Page4.xaml
    /// </summary>
    public partial class FAQ : Page
    {
        public FAQ()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Home home = new Home();
            this.NavigationService.Navigate(home);
        }

        private void ButtonLogIn_Copy2_Click(object sender, RoutedEventArgs e)
        {
            FAQ_q1 faq1 = new FAQ_q1();
            this.NavigationService.Navigate(faq1);
        }

        private void ButtonLogIn_Copy_Click(object sender, RoutedEventArgs e)
        {
            FAQ_q2 faq2 = new FAQ_q2();
            this.NavigationService.Navigate(faq2);
        }

        private void ButtonLogIn_Click(object sender, RoutedEventArgs e)
        {
            FAQ_q3 faq3 = new FAQ_q3();
            this.NavigationService.Navigate(faq3);
        }

        private void ButtonLogIn_Copy1_Click(object sender, RoutedEventArgs e)
        {
            FAQ_q4 faq4 = new FAQ_q4();
            this.NavigationService.Navigate(faq4);
        }
    }
}
