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
    /// Interaction logic for HelloRestaurant.xaml
    /// </summary>
    public partial class HelloRestaurant : Page
    {
        private UserRestaurante restaurante;

        public HelloRestaurant(UserRestaurante restaurante1)
        {
            InitializeComponent();
            restaurante = restaurante1;
            LabelHelloRestaurant.Content += restaurante.nomeRestaurante.ToUpper();
        }

        private void ButtonDonateFood_Click(object sender, RoutedEventArgs e)
        {
            DonateFood donateFood = new DonateFood(restaurante);
            this.NavigationService.Navigate(donateFood);
        }

        private void ButtonCurrentDoantions_Click(object sender, RoutedEventArgs e)
        {
            CurrentDonations currDonations = new CurrentDonations(restaurante);
            this.NavigationService.Navigate(currDonations);
        }

        private void ButtonAcceptedDonationsd_Click(object sender, RoutedEventArgs e)
        {
            AcceptedDonations acceptedDonations = new AcceptedDonations(restaurante);
            this.NavigationService.Navigate(acceptedDonations);
        }

        private void ButtonPastDonations_Click(object sender, RoutedEventArgs e)
        {
            PastDonations pastDonations = new PastDonations(restaurante);
            this.NavigationService.Navigate(pastDonations);
        }

        private void ButtonLogOut_Click(object sender, RoutedEventArgs e)
        {
            Home home = new Home();
            this.NavigationService.Navigate(home);
        }

  
    }
}
