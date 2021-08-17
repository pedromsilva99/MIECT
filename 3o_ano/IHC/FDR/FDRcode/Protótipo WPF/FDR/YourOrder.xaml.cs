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
    /// Interaction logic for YourOrder.xaml
    /// </summary>
    public partial class YourOrder : Page
    {
        private UserCaridade caridade;
        private Pedido pedidoEscolhido;

        public YourOrder(UserCaridade caridade1, Pedido pedidoEscolhido1)
        {
            InitializeComponent();
            caridade = caridade1;
            pedidoEscolhido = pedidoEscolhido1;
            txtBoxOrder.Text = pedidoEscolhido.ToString();
            txtBoxCode.Text = pedidoEscolhido.Code;
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            DonationsNearby donationsNearby = new DonationsNearby(caridade);
            this.NavigationService.Navigate(donationsNearby);
        }

        private void ButtonConfirm_Click(object sender, RoutedEventArgs e)
        {

            foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
            {
                foreach (Pedido p in r.pedidosRestaurante)
                {
                    if (p.Equals(pedidoEscolhido))
                    {
                        caridade.pedidosCaridade.Add(pedidoEscolhido);
                        r.pedidosAceitesRestaurante.Add(pedidoEscolhido);
                        r.pedidosRestaurante.Remove(pedidoEscolhido);
                        break;
                    }
                }
            }
            pedidoEscolhido.Aceite = true;
            ThankYou2 thanks2 = new ThankYou2(caridade);
            this.NavigationService.Navigate(thanks2);
        }
    }
}
