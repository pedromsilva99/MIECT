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
    /// Interaction logic for CurrentDonations.xaml
    /// </summary>
    public partial class CurrentDonations : Page
    {
        private UserRestaurante restaurante;

        public CurrentDonations(UserRestaurante restaurante1)
        {
            InitializeComponent();
            restaurante = restaurante1;

            lstBoxCurrDonations.Items.Clear();

           foreach (Pedido p in restaurante.pedidosRestaurante)
            {
                if(!p.Aceite)
                {
                    lstBoxCurrDonations.Items.Add(p.withCodeString());
                }
            }
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            HelloRestaurant helloRestaurant = new HelloRestaurant(restaurante);
            this.NavigationService.Navigate(helloRestaurant);
        }

        private void ButtonEdit_Click(object sender, RoutedEventArgs e)
        {
            if (lstBoxCurrDonations.SelectedIndex == -1)
            {
                MessageBox.Show("Please select an order");
            }
            else
            {
                String c1 = lstBoxCurrDonations.SelectedItem as String;

                foreach(Pedido p in restaurante.pedidosRestaurante)
                {

                    if (c1.Equals(p.withCodeString()))
                    {
                        DonateFood donateFood = new DonateFood(restaurante, p);
                        this.NavigationService.Navigate(donateFood);
                        break;
                    }
                }  
            }
        }

        private void ButtonRemove_Click(object sender, RoutedEventArgs e)
        {
            if (lstBoxCurrDonations.SelectedIndex == -1)
            {
                MessageBox.Show("Please select an order");
            }
            else
            {
                String c1 = lstBoxCurrDonations.SelectedItem as String;
                foreach (Pedido p in restaurante.pedidosRestaurante)
                {
                    if (c1.Equals(p.withCodeString()))
                    {
                        restaurante.pedidosRestaurante.Remove(p);
                        CurrentDonations cd = new CurrentDonations(restaurante);
                        this.NavigationService.Navigate(cd);
                        break;
                    }
                }
            }
        }
    }
}
