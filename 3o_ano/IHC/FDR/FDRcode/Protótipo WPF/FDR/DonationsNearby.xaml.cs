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
using System.Collections.ObjectModel;

namespace FDR
{
    /// <summary>
    /// Interaction logic for DonationsNearby.xaml
    /// </summary>
    public partial class DonationsNearby : Page
    {
        public string h;
        private UserCaridade caridade;
        private Pedido pedidoEscolhido;

        public DonationsNearby(UserCaridade caridade1)
        {
            InitializeComponent();
            caridade = caridade1;
            
            foreach(UserRestaurante r in CreateClasses.ListaRestaurantes)
            {
                if(r.cidadeRestaurante.Equals(caridade.cidadeCaridade))
                {
                    foreach (Pedido p in r.pedidosRestaurante)
                        lstBoxDonations.Items.Add(p);
                }
            }
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            HelloCharity helloCharity = new HelloCharity(caridade);
            this.NavigationService.Navigate(helloCharity);
        }

        private void ButtonConfirm_Click(object sender, RoutedEventArgs e)
        {
            if(lstBoxDonations.SelectedIndex == -1)
            {
                MessageBox.Show("Please choose an order to take");
            }
            else
            {
                pedidoEscolhido = lstBoxDonations.SelectedItem as Pedido;
                YourOrder yourOrder = new YourOrder(caridade, pedidoEscolhido);
                this.NavigationService.Navigate(yourOrder);
            }
        }
    }
}
