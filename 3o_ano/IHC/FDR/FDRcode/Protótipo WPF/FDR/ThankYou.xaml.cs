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
    /// Interaction logic for ThankYou.xaml
    /// </summary>
    public partial class ThankYou : Page
    {
        private UserRestaurante restaurante;
        private Pedido pedidoCriado;

        public ThankYou(UserRestaurante restaurante1, Pedido p)
        {
            InitializeComponent();
            restaurante = restaurante1;
            pedidoCriado = p;
            txtBox_code.Text = pedidoCriado.Code;
        }

        private void ButtonLogIn_Copy3_Click(object sender, RoutedEventArgs e)
        {
            HelloRestaurant helloRestaurant = new HelloRestaurant(restaurante);
            this.NavigationService.Navigate(helloRestaurant);
        }
    }
}
