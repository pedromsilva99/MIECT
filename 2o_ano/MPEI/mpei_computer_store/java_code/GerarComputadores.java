import java.io.*;
import java.util.*;
public class GerarComputadores { // Gera e formata um ficheiro como base de dados
	
	public static void gerar() throws IOException{
		
		Scanner sc = new Scanner(System.in);
		int ncomputadores;
		System.out.print("Quantos computadores pretende inserir na base de dados? "); // Recomenda-se a geração de 100 000 para obter uma quantidade significativa de falsos positivos
		ncomputadores=sc.nextInt();
		
		DadosEmStrings dados = new DadosEmStrings();
			
		File gerar = new File("computadores.txt");
		PrintWriter pwf = new PrintWriter(gerar);
		pwf.println("ID   MARCA     PREÇO    PROCESSADOR     RAM       ARMAZENAMENTO");
		
		for (int i = 1; i <= ncomputadores; i++)
		{
			String t = MarcaComputador(dados.Marca);
			String z = PrecoComputador(dados.Preco);
			String v = ProcessadorComputador(dados.Processador);
			String u = ArmazenamentoComputador(dados.Armazenamento);
			String a = RAMComputador(dados.RAM);
			pwf.printf("%-4d %-9s %-8s %-15s %-9s %-19s %n",i,t,z,v,a,u);
		}
		pwf.close();
		 
	}
	
	public static String MarcaComputador(String[] Marca){
		
		String MarcaFinal = "";
		int elemento = (int)(Math.random() * 11);
		MarcaFinal += Marca[elemento];
		
		return MarcaFinal;
	}
	
	public static String PrecoComputador(String[] Preco){
		
		String PrecoFinal = "";
		int elemento = (int)(Math.random() * 20);
		PrecoFinal = Preco[elemento];
		
		return PrecoFinal;
	}
	
	public static String ProcessadorComputador(String[] Processador){
		
		String ProcessadorFinal = "";
		int elemento = (int)(Math.random() * 8);
		ProcessadorFinal += Processador[elemento];
		
		return ProcessadorFinal;
	}
	
	public static String ArmazenamentoComputador(String[] Armazenamento){
		
		String ArmazenamentoFinal = "";
		int elemento = (int)(Math.random() * 18);
		ArmazenamentoFinal += Armazenamento[elemento];
		
		return ArmazenamentoFinal;
	}
	
	public static String RAMComputador(String[] RAM){
		
		String RAMFinal = "";
		int elemento = (int)(Math.random() * 4);
		RAMFinal = RAM[elemento];
		
		return RAMFinal;
	}
	
}
