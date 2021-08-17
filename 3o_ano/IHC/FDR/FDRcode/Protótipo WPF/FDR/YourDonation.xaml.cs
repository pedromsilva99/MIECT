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
    /// Interaction logic for YourDonation.xaml
    /// </summary>
    public partial class YourDonation : Page
    {
        private UserRestaurante restaurante;
        private Pedido pedido;
        private Pedido edited;
        private string _descricao;
        private string _horas;
        private string _contAdicional;

        public YourDonation(UserRestaurante restaurante1, Pedido p, Pedido edited1=null)
        {
            InitializeComponent();
            restaurante = restaurante1;
            pedido = p;
            edited = edited1;
            _descricao = p.Descricao;
            _horas = p.HorasDeRecolha;
            _contAdicional = p.ConteudoAdicional;
            txtBox_donation.Text = ("DESCRIPTION: " + _descricao + "\nPICK'UP TIME: " + _horas + "\nEXTRA INFO: " + _contAdicional).ToUpper();
        }

        private void ButtonConfirm_Click(object sender, RoutedEventArgs e)
        {

            foreach (Pedido p in restaurante.pedidosRestaurante)
            {
                if (p.Equals(edited))
                {
                    MessageBox.Show("Your change has been succeeded");     // Opcional
                    restaurante.pedidosRestaurante.Remove(p);
                    break;
                }
            }

            pedido = new Pedido(restaurante);
            pedido.Descricao = _descricao;
            pedido.HorasDeRecolha = _horas;
            pedido.ConteudoAdicional = _contAdicional;

            DateTime thisDay = DateTime.Today;
            pedido.Data = thisDay.ToShortDateString();

            // Gerar codigo associado ao pedido
        
            Boolean existantCode;
            String codigo;
            while (true)
            {
                Random random = new Random();
                existantCode = false;
                string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                var sizeStr = new char[5];
                for (int i = 0; i < sizeStr.Length; i++)
                    sizeStr[i] = chars[random.Next(chars.Length)];
                codigo = new string(sizeStr);

                foreach(UserRestaurante r in CreateClasses.ListaRestaurantes)
                {
                    foreach(Pedido p in r.pedidosRestaurante)
                    {
                        if (p.Code.Equals(codigo))
                        {
                            existantCode = true;
                            break;
                        }
                    }
                }
                foreach (UserRestaurante r in CreateClasses.ListaRestaurantes)
                {
                    foreach (Pedido p in r.pedidosAceitesRestaurante)
                    {
                        if (p.Code.Equals(codigo))
                        {
                            existantCode = true;
                            break;
                        }
                    }
                }
                if (!existantCode) break;
            }


            pedido.Code = codigo;

            restaurante.pedidosRestaurante.Add(pedido);

            ThankYou thanks = new ThankYou(restaurante, pedido);
            this.NavigationService.Navigate(thanks);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DonateFood donateFood = new DonateFood(restaurante, pedido);
            this.NavigationService.Navigate(donateFood);
        }
    }
}
