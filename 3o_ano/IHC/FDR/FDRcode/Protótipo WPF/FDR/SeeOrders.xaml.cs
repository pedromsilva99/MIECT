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
    /// Interaction logic for SeeOrders.xaml
    /// </summary>
    public partial class SeeOrders : Page
    {
        private UserCaridade caridade;

        public SeeOrders(UserCaridade caridade1)
        {
            InitializeComponent();
            caridade = caridade1;

            foreach (Pedido p in caridade.pedidosCaridade)
            {
                lstBoxOrder.Items.Add(p.seeEverything());
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            HelloCharity helloCharity = new HelloCharity(caridade);
            this.NavigationService.Navigate(helloCharity);
        }

        private void ButtonReceived_Click(object sender, RoutedEventArgs e)
        {
            if (lstBoxOrder.SelectedIndex == -1)
            {
                MessageBox.Show("Please choose the order you already received");
            }
            else
            {
                String c1 = lstBoxOrder.SelectedItem as String;

                // Pedido pedido = lstBoxOrder.SelectedItem as Pedido;

                foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
                {
                    foreach (Pedido p2 in r.pedidosAceitesRestaurante)
                    {
                        if (p2.seeEverything().Equals(c1))
                        {
                            r.pedidosPassadosRestaurante.Add(p2);
                            r.pedidosAceitesRestaurante.Remove(p2);
                            caridade.pedidosPassadosCaridade.Add(p2);
                            caridade.pedidosCaridade.Remove(p2);
                            SeeOrders seeOrders = new SeeOrders(caridade);
                            this.NavigationService.Navigate(seeOrders);
                            break;
                        }
                    }
                }
            }
        }
    }
}
