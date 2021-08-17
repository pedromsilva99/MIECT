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
    /// Interaction logic for ThankYou2.xaml
    /// </summary>
    public partial class ThankYou2 : Page
    {
        private UserCaridade caridade;

        public ThankYou2(UserCaridade caridade1)
        {
            InitializeComponent();
            caridade = caridade1;
        }

        private void ButtonLogIn_Copy3_Click(object sender, RoutedEventArgs e)
        {
            HelloCharity helloCharity = new HelloCharity(caridade);
            this.NavigationService.Navigate(helloCharity);
        }
    }
}
