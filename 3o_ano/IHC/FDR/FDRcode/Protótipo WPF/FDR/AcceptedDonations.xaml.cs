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
    /// Interaction logic for AcceptedDonations.xaml
    /// </summary>
    public partial class AcceptedDonations : Page
    {
        private UserRestaurante restaurante;

        public AcceptedDonations(UserRestaurante restaurante1)
        {
            InitializeComponent();
            restaurante = restaurante1;

            foreach (Pedido p in restaurante.pedidosAceitesRestaurante)
            {
                if (p.Aceite)
                {
                    lstBoxPastDonations.Items.Add(p.withCodeString());
                }
            }
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            HelloRestaurant helloRestaurant = new HelloRestaurant(restaurante);
            this.NavigationService.Navigate(helloRestaurant);
        }
    }
}
