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
    /// Interaction logic for HelloCharity.xaml
    /// </summary>
    public partial class HelloCharity : Page
    {

        private UserCaridade caridade;

        public HelloCharity(UserCaridade caridade1)
        {
            InitializeComponent();
            caridade = caridade1;
            LabelHelloCharity.Content += caridade.nomeCaridade.ToUpper();

        }

        private void ButtonDonationsNearby_Click(object sender, RoutedEventArgs e)
        {
            DonationsNearby donationsNearby = new DonationsNearby(caridade);
            this.NavigationService.Navigate(donationsNearby);
        }

        private void ButtonSeeOrders_Click(object sender, RoutedEventArgs e)
        {
            SeeOrders seeOrders = new SeeOrders(caridade);
            this.NavigationService.Navigate(seeOrders);
        }

        private void ButtonPastOrders_Click(object sender, RoutedEventArgs e)
        {
            PastOrders pastOrders = new PastOrders(caridade);
            this.NavigationService.Navigate(pastOrders);
        }

        private void ButtonLogOut_Click(object sender, RoutedEventArgs e)
        {
            Home home = new Home();
            this.NavigationService.Navigate(home);
        }
    }
}
