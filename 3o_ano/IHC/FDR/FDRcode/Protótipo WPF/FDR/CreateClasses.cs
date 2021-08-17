using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace FDR
{
    public static class CreateClasses
    {
        private static ObservableCollection<UserCaridade> _ListaCaridades;
        public static ObservableCollection<UserCaridade> ListaCaridades
        {
            get { return _ListaCaridades; }
            set { _ListaCaridades = value; }
        }

        private static ObservableCollection<UserRestaurante> _ListaRestaurantes;
        public static ObservableCollection<UserRestaurante> ListaRestaurantes
        {
            get { return _ListaRestaurantes; }
            set { _ListaRestaurantes = value; }
        }

        public static void listasGlobais()
        {
            ListaCaridades = new ObservableCollection<UserCaridade> {
                new UserCaridade { NIFCaridade = "123456789", nomeCaridade = "Smile More", cidadeCaridade = "Aveiro", moradaCaridade= "Rua de Ovar, 46", emailCaridade= "smilemore@gmail.com", passwordCaridade= "smile123" },
                new UserCaridade { NIFCaridade = "123456790", nomeCaridade = "Florinhas do Vouga", cidadeCaridade = "Aveiro", moradaCaridade= "Rua da Liberdade, 11", emailCaridade= "florinhasdovougae@gmail.com", passwordCaridade= "florinhas123" },
                new UserCaridade { NIFCaridade = "123456791", nomeCaridade = "Missao Sorriso", cidadeCaridade = "Beja", moradaCaridade= "Rua das Flores, 28", emailCaridade= "sorriso@gmail.com", passwordCaridade= "sorriso123" }
            };

            Pedido p1 = new Pedido(new UserRestaurante { codeRestaurante = "12345", nomeRestaurante = "O Silva", cidadeRestaurante = "Aveiro", moradaRestaurante = "Rua 25 de Abril", emailRestaurante = "postadoarouca@gmail.com", passwordRestaurante = "silva123" }) { Descricao = "Arroz de pato", HorasDeRecolha = "14:00 - 15:00", ConteudoAdicional = "30 doses", Code="HSKF3", Data="10/04/2020" };
            Pedido p2 = new Pedido(new UserRestaurante { codeRestaurante = "12345", nomeRestaurante = "O Silva", cidadeRestaurante = "Aveiro", moradaRestaurante = "Rua 25 de Abril", emailRestaurante = "postadoarouca@gmail.com", passwordRestaurante = "silva123" }) { Descricao = "Frango com massa", HorasDeRecolha = "12:00 - 13:00", ConteudoAdicional = "20 kg", Code= "GH4AC", Data = "22/05/2020" };
            Pedido p3 = new Pedido(new UserRestaurante { codeRestaurante = "12347", nomeRestaurante = "Ze do Peixe", cidadeRestaurante = "Braga", moradaRestaurante = "Rua D. Dinis", emailRestaurante = "zedopeixe@gmail.com", passwordRestaurante = "zepeixe123" }) { Descricao = "Carapau", HorasDeRecolha = "13:00 - 14:00", ConteudoAdicional = "25 kg", Code = "27UHS", Data = "30/05/2020" };
            Pedido p4 = new Pedido(new UserRestaurante { codeRestaurante = "12347", nomeRestaurante = "Ze do Peixe", cidadeRestaurante = "Braga", moradaRestaurante = "Rua D. Dinis", emailRestaurante = "zedopeixe@gmail.com", passwordRestaurante = "zepeixe123" }) { Descricao = "Lulas grelhadas", HorasDeRecolha = "16:00 - 17:00", ConteudoAdicional = "30 doses", Code = "03HUI", Data = "29/05/2020" };

            ListaRestaurantes = new ObservableCollection<UserRestaurante> {
                new UserRestaurante { codeRestaurante = "12345", nomeRestaurante = "O Silva", cidadeRestaurante = "Aveiro", moradaRestaurante= "Rua 25 de Abril", emailRestaurante= "postadoarouca@gmail.com", passwordRestaurante= "silva123",  pedidosRestaurante = new List<Pedido>{p1, p2} },
                new UserRestaurante { codeRestaurante = "12346", nomeRestaurante = "Ramona", cidadeRestaurante = "Aveiro", moradaRestaurante= "Rua Lourenco Peixinho", emailRestaurante= "ramona@gmail.com", passwordRestaurante= "ramona123" },
                new UserRestaurante { codeRestaurante = "12347", nomeRestaurante = "Ze do Peixe", cidadeRestaurante = "Aveiro", moradaRestaurante= "Rua D. Dinis", emailRestaurante= "zedopeixe@gmail.com", passwordRestaurante= "zepeixe123", pedidosRestaurante = new List<Pedido>{p3, p4} }
            };

        }
    }
}
