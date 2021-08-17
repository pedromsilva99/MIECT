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
    /// Interaction logic for PastOrders.xaml
    /// </summary>
    public partial class PastOrders : Page
    {
        private UserCaridade caridade;

        public PastOrders(UserCaridade caridade1)
        {
            InitializeComponent();
            caridade = caridade1;
            foreach (Pedido p in caridade.pedidosPassadosCaridade)
            {
                if (p.Aceite)
                {
                    lstBoxPastOrders.Items.Add(p.withDateOrganizacao()); ;
                }
            }
        }
        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            
            HelloCharity helloCharity = new HelloCharity(caridade);
            this.NavigationService.Navigate(helloCharity);
            

            
        }
    }
}
