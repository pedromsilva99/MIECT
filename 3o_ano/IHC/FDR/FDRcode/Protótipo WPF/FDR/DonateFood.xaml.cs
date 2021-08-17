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
    /// Interaction logic for DonateFood.xaml
    /// </summary>
    public partial class DonateFood : Page
    {
        private UserRestaurante restaurante;
        private Pedido pedido;
        private Pedido edited;
        private String hours;

        public DonateFood(UserRestaurante restaurante1, Pedido p=null)
        {
            InitializeComponent();
            restaurante = restaurante1;
            if (p != null)
            {
                edited = p;
                txtBox_descricao.Text = p.Descricao;
                comboBox1.Text = p.HorasDeRecolha;
                txtBox_conteudoAdicional.Text = p.ConteudoAdicional;
            }
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            HelloRestaurant helloRestaurant = new HelloRestaurant(restaurante);
            this.NavigationService.Navigate(helloRestaurant);
        }

        private void ButtonNext_Click(object sender, RoutedEventArgs e)
        {
            String descricao = txtBox_descricao.Text;
            String conteudoAdicional = txtBox_conteudoAdicional.Text;
                
            if (comboBox1.SelectedIndex == -1 || descricao == "")
            {
                MessageBox.Show("Please insert a description and the time interval.");
            }
            else
            {
                String horasRecolha = ((ComboBoxItem)comboBox1.SelectedItem).Content.ToString();
                pedido = new Pedido(restaurante);
                pedido.Descricao = descricao;
                pedido.HorasDeRecolha = horasRecolha;
                pedido.RestauranteDoador = restaurante;
                if (conteudoAdicional != "Number of doses, etc...")
                    pedido.ConteudoAdicional = conteudoAdicional;

                YourDonation yourDonation = new YourDonation(restaurante, pedido, edited);
                this.NavigationService.Navigate(yourDonation);
            }
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            hours = ((ComboBoxItem)comboBox1.SelectedItem).Content.ToString();
        }

        private void TxtBox_conteudoAdicional_GotFocus(object sender, RoutedEventArgs e)
        {
            if(txtBox_conteudoAdicional.Text == "Number of doses, etc...")
                txtBox_conteudoAdicional.Text = "";  
        }
    }

    // Classe com o pedido criado pelo restaurante
    public class Pedido
    {
        private string _descricao;
        private string _horasDeRecolha;
        private string _conteudoAdicional;
        private string _code;
        private string _data;
        private UserRestaurante _restauranteDoador;
        private bool _aceite = false;

        public Pedido(UserRestaurante r)
        {
            _restauranteDoador = r;
        }

        public string Descricao
        {
            get { return _descricao; }
            set { _descricao = value; }
        }
        public string HorasDeRecolha
        {
            get { return _horasDeRecolha; }
            set { _horasDeRecolha = value; }
        }
        public string ConteudoAdicional
        {
            get { return _conteudoAdicional; }
            set { _conteudoAdicional = value; }
        }
        public string Code
        {
            get { return _code; }
            set { _code = value; }
        }
        public bool Aceite
        {
            get { return _aceite; }
            set { _aceite = value; }
        }
        public string Data
        {
            get { return _data; }
            set { _data = value; }
        }
        public UserRestaurante RestauranteDoador
        {
            get { return _restauranteDoador; }
            set { _restauranteDoador = value; }
        }
        public override string ToString()
        {
            return ("DESCRIPTION: " + Descricao + "\nPICK'UP TIME: " + HorasDeRecolha + "\nEXTRA INFO: " + ConteudoAdicional + "\nADDRESS: " + RestauranteDoador.moradaRestaurante + "\nRESTAURANT: " + RestauranteDoador.nomeRestaurante).ToUpper();
        }
        public string withDateString()
        {
            return ("DATE: " + Data + "\nDESCRIPTION: " + Descricao + "\nPICK'UP TIME: " + HorasDeRecolha + "\nEXTRA INFO: " + ConteudoAdicional).ToUpper();
        }
        public string withDateOrganizacao()
        {
            return ("DATE: " + Data + "\nDESCRIPTION: " + Descricao + "\nPICK'UP TIME: " + HorasDeRecolha + "\nEXTRA INFO: " + ConteudoAdicional + "\nADDRESS: " + RestauranteDoador.moradaRestaurante + "\nRESTAURANT: " + RestauranteDoador.nomeRestaurante).ToUpper();
        }
        public string withCodeString()
        {
            return ("DESCRIPTION: " + Descricao + "\nPICK'UP TIME: " + HorasDeRecolha + "\nEXTRA INFO: " + ConteudoAdicional + "\nCODE: " + Code).ToUpper();
        }
        public string seeEverything()
        {
            return ("DESCRIPTION: " + Descricao + "\nPICK'UP TIME: " + HorasDeRecolha + "\nEXTRA INFO: " + ConteudoAdicional + "\nADDRESS: " + RestauranteDoador.moradaRestaurante + "\nRESTAURANT: " + RestauranteDoador.nomeRestaurante + "\nCODE: " + Code).ToUpper();
        }
    }
}
