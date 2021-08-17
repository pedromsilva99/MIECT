import java.util.*;
import java.io.*;

public class CountingBloomFilter {
	
	static Scanner sc = new Scanner(System.in);
	
	public static void testBloomFilter() throws IOException {
		
		DadosEmStrings dados = new DadosEmStrings();
		File ficheiro = new File("computadores.txt");	
		Scanner ler = new Scanner(ficheiro);
		int escolher,opcao,count,delete;
		double prob;
		long tamanho = ficheiro.length();
		
		System.out.println("---------- Counting Bloom Filter ----------\n");
		
		BloomFilter bloomfilter = new BloomFilter((int)1e5,6); // Chamada da classe bloom filter. 1e5 corresponde ao numero de experiencias e k = 6 
															   // corresponde ao numero de hashfunctions onde a probabilidade de falsos positivos é menor
		while(ler.hasNext()){
			String x = ler.next();
			bloomfilter.inserir(x); // Inserir as strings do ficheiro no bloomfilter
			
		}
		
		do{
			do{
				System.out.println("\nFiltros disponíveis:");
				System.out.print("1-Marca\n2-Preço\n3-Processador\n4-Armazenamento\n5-RAM\n0-Passar ao MinHashing\n");
				System.out.print("\nEscolha uma das especificações em cima apresentadas: ");
				escolher = sc.nextInt();
				sc.nextLine(); // esta linha serve para não dar erro no java
			}while(escolher<0 || escolher > 5);
			
			
			if(escolher==1){
				
				System.out.print("Qual a marca que prentende procurar: ");
				String escolhemarca = sc.nextLine();		
				escolhemarca = escolhemarca.toUpperCase(); // Colocar em maiusculas para comparar com a base de dados
				
				count = bloomfilter.contagem(escolhemarca); // Armazena a contagem na variavel count
				
				boolean result = bloomfilter.pertence(escolhemarca); // Verifica se pertence ao bloomfilter
				
				prob = Math.pow(1.0-Math.pow(Math.E,((-6*(double)(count))/(double)1e6)),6);	// Em ficheiros pequenos a prob de falso positivo vai ser muito
																							// pequena e impossível de representar com poucas casas decimais
				if (result==true){
					
					System.out.printf("\nA probabilidade de ser falso positivo é %1.15f\n", prob);
					System.out.println("Existe(m) " + count + " computador(es) da marca " + escolhemarca + " em stock.\n");
				
					do{
						System.out.printf("Pretende comprar algum computador da marca %s? Sim(1) Não(0)-> ", escolhemarca);
						delete = sc.nextInt();
					}while(delete!=0 && delete!=1);
					
					if(delete==1){ // Caso queira comprar algum computador precisamos de o remover do bloomfilter
						bloomfilter.delete(escolhemarca); // Remove do bloomfilter
						count = bloomfilter.contagem(escolhemarca); // Volta a verificar a contagem após a remoção
					}
					
					else{
						count = count; 
					}
					
					System.out.printf("Neste momento existem %d computadores com a marca %s em stock.\n\n", count, escolhemarca);
				
				}
				
				else{
					System.out.println("A marca " + escolhemarca + " não se encontra em stock.\n");
				}
			}
			
			if(escolher==2){
				
				System.out.print("\nNota: Insira o preço e de seguida o caracter \"€\". Exemplo: 999€\n");
				System.out.print("Qual o preco que prentende procurar: ");
				String escolhepreco = sc.nextLine();
				escolhepreco = escolhepreco.toUpperCase();
				
				count = bloomfilter.contagem(escolhepreco);
				
				boolean result = bloomfilter.pertence(escolhepreco);
				
				prob=Math.pow(1.0-Math.pow(Math.E,((-6*(double)(count))/(double)1e5)),6);
			
				if (result==true){
					System.out.printf("\nA probabilidade de ser falso positivo é %1.15f\n", prob);
					count = bloomfilter.contagem(escolhepreco);
					System.out.print("Existe(m) " + count + " computador(es) de " + escolhepreco + " em stock.\n");
				
					do{
						System.out.printf("Pretende comprar algum computador desse preço %s? Sim(1) Não(0)-> ", escolhepreco);
						delete = sc.nextInt();
					}while(delete!=0 && delete!=1);
					
					if(delete==1){
						bloomfilter.delete(escolhepreco);
						count = bloomfilter.contagem(escolhepreco);
					}
					
					else{
						count = count;
					}
					System.out.printf("Neste momento existem %d computadores com o preço %s em stock.\n\n", count, escolhepreco);
				
				}
				
				else{
					System.out.println("Não existe um computador em stock que custe "+ escolhepreco +".\n");
				}
			}
			
			if(escolher==3){
				System.out.print("\nNota: Escreva o nome do processador com \"_\" a espaçar palavras. Exemplo: Intel_Core_i7\n");
				System.out.print("Qual o processador que prentende procurar: ");
				String escolheprocessador = sc.nextLine();
				escolheprocessador = escolheprocessador.toUpperCase();
				
				count = bloomfilter.contagem(escolheprocessador);
				
				boolean result = bloomfilter.pertence(escolheprocessador);
				
				prob=Math.pow(1.0-Math.pow(Math.E,((-6*(double)(count))/(double)1e6)),6);
			
				if (result==true){
					System.out.printf("\nA probabilidade de ser falso positivo é %1.15f\n", prob);
					count = bloomfilter.contagem(escolheprocessador);
					System.out.print("Existe(m) " + count + " computador(es) com o processador " + escolheprocessador + " em stock.\n");

					do{
						System.out.printf("Pretende comprar algum computador com o processador %s? Sim(1) Não(0)-> ", escolheprocessador);
						delete = sc.nextInt();
					}while(delete!=0 && delete!=1);
					
					if(delete==1){
						bloomfilter.delete(escolheprocessador);
						count = bloomfilter.contagem(escolheprocessador);
					}
					
					else{
						count = count;
					}
					System.out.printf("Neste momento existem %d computadores com o processador %s em stock.\n\n", count, escolheprocessador);
		
				}
				
				else{
					System.out.println("Não existe um computador com um processador "+ escolheprocessador +" em stock.\n");
				}
			}
			
			if(escolher==4){
				
				System.out.print("\nNota: Escreva o armazenamento e introduza \"GB\" no fim. Exemplo: 350GB\n");
				System.out.print("Quanto armazenamento pretende para o computador: ");
				String escolhearmazenamento = sc.nextLine();
				escolhearmazenamento = escolhearmazenamento.toUpperCase();
				
				count = bloomfilter.contagem(escolhearmazenamento);
				
				boolean result = bloomfilter.pertence(escolhearmazenamento);
				
				prob=Math.pow(1.0-Math.pow(Math.E,((-6*(double)(count))/(double)1e6)),6);
			
				if (result==true){
					System.out.printf("\nA probabilidade de ser falso positivo é %1.15f\n", prob);
					count = bloomfilter.contagem(escolhearmazenamento);
					System.out.print("Existe(m) " + count + " computador(es) com " + escolhearmazenamento + " de armazenamento, em stock.\n");
					
					do{
						System.out.printf("Pretende comprar algum computador com o armazenamento %s? Sim(1) Não(0)-> ", escolhearmazenamento);
						delete = sc.nextInt();
					}while(delete!=0 && delete!=1);
					
					if(delete==1){
						bloomfilter.delete(escolhearmazenamento);
						count = bloomfilter.contagem(escolhearmazenamento);
					}
					else{
						count = count;
					}
					
					System.out.printf("Neste momento existem %d computadores com o armazenamento %s em stock.\n\n", count, escolhearmazenamento);
				
				}
				
				else{
					System.out.println("Não existe um computador com "+escolhearmazenamento +" de armazenamento em stock.\n");
				}
			}
			
			if(escolher==5){
				
				System.out.print("\nNota: Escreva a memória RAM e introduza \"GB\" no fim. Exemplo: 8GB\n");
				System.out.print("Quanta memória RAM pretende para o computador: ");
				String escolheram = sc.nextLine();
				escolheram = escolheram.toUpperCase();
				
				count = bloomfilter.contagem(escolheram);
				
				boolean result = bloomfilter.pertence(escolheram);
				
				prob=Math.pow(1.0-Math.pow(Math.E,((-6*(double)(count))/(double)1e6)),6);
			
				if (result==true){
					System.out.printf("\nA probabilidade de ser falso positivo é %1.15f\n", prob);
					count = bloomfilter.contagem(escolheram);
					System.out.print("Existe(m) " + count + " computador(es) de " + escolheram + " em stock.\n");
					
					do{
						System.out.printf("Pretende comprar algum computador com a ram %s? Sim(1) Não(0)-> ", escolheram);
						delete = sc.nextInt();
					}while(delete!=0 && delete!=1);
				
					if(delete==1){
						bloomfilter.delete(escolheram);
						count = bloomfilter.contagem(escolheram);
					}
					
					else{
						count = count;
					}
					System.out.printf("Neste momento existem %d computadores com a ram %s em stock.\n\n", count, escolheram);
					
			
				}
				
				else{
					System.out.println("Não existe um computador com "+escolheram +" de Ram em stock.\n");
				}
			}
			
		}while(escolher!=0);
		ler.close();	
	}
}
