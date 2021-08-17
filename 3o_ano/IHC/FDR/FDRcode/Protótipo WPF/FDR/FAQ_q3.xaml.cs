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
    /// Interaction logic for Page7.xaml
    /// </summary>
    public partial class FAQ_q3 : Page
    {
        public FAQ_q3()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FAQ faq = new FAQ();
            this.NavigationService.Navigate(faq);
        }
    }
}
