import java.util.*;
import java.io.*;

public class Main {
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main (String args[]) throws IOException{
	
		GerarComputadores ficheiroTexto = new GerarComputadores();
		ficheiroTexto.gerar();	
		
		ContadorEstocastico cont = new ContadorEstocastico();
		cont.contador();
		
		CountingBloomFilter filter = new CountingBloomFilter();
		filter.testBloomFilter();
		
		TestMinHash recomendados = new TestMinHash();
		recomendados.executar();
			
	}
}
