import java.util.*;
import java.io.*;
public class TestMinHash{
		
		static Scanner sc = new Scanner(System.in);
		
		public static void executar() throws IOException{
		
		System.out.println("\n---------- Minhash ----------\n");
		
		int numHash = 50, k=2, escolher;
		MinHash minhash = new MinHash(numHash);
		String a,b,c,d,e,completa;
		
		File ficheiro = new File("computadores.txt");
		Scanner ler = new Scanner(ficheiro);
		
		// Contagem do numero de linhas do ficheiro de texto
		BufferedReader reader = new BufferedReader(new FileReader("computadores.txt"));
		int lines = 0;
		while (reader.readLine() != null) lines++;
		reader.close();
		
		do{
			do{
				System.out.printf("Pretende procurar algum computador em stock com as suas preferências? Sim(1) Terminar programa(0)-> ");
				escolher = sc.nextInt();
				sc.nextLine(); // esta linha serve para não dar erro no java
			}while(escolher!=0 && escolher!=1);
			
			if(escolher==1){
				System.out.print("Insira as caracteríticas do seu computador.\n");
				System.out.print("\nNota: Se não quiser especificar uma característica prima \"Enter\"");
				System.out.print("\nNota: Escreva o nome do processador com \"_\" a espaçar palavras. Exemplo: Intel_Core_i7\n");
				
				System.out.print("\nMarca: ");
				a = sc.nextLine();
				System.out.print("Preço: ");
				b = sc.nextLine();
				System.out.print("Processador: ");
				c = sc.nextLine();
				System.out.print("RAM: ");
				d = sc.nextLine();
				System.out.print("Armazenamento: ");
				e = sc.nextLine();
				
				
				completa = a+b+"€"+c+d+"GB"+e+"GB"; // Junção das strings a ,b ,c ,d ,e
				completa = completa.toUpperCase();
				
				Set<String> setPedida = minhash.split(completa, k);
				
				String linha0 = ler.nextLine(); // Excluir primeira linha do ficheiro de texto
				
				// Criação de arrays para as strings do ficheiro
				String computadores[] = new String[lines]; 
				String leituraPC[] = new String[lines];
				int j=0;
				
				System.out.println("\nOs computadores recomendados são:  \n");
				System.out.println("ID   MARCA     PREÇO    PROCESSADOR     RAM       ARMAZENAMENTO");
				
				for (int i = 0; i < lines-1; i++){ // Colocar no array computadores[] as varias linhas do ficheiro
					
					computadores[i]= ler.nextLine();
					leituraPC[i] = computadores[i]; // Armazenar linha sem formatação
					computadores[i] = computadores[i].substring(5); // Retira os primeiros 5 caracters da string (para retirar o ID)
					computadores[i] = computadores[i].replaceAll("\\s+",""); // Elimina todos espaços para uma comparação mais eficiente
					
					for(; j==i;j++){ // Comparar a string "completa" (linha), pedida ao utilizador, com as que se encontram no ficheiro
						Set<String> setLinha = minhash.split(computadores[j], k);
						double dis = minhash.disJaccard(setPedida, setLinha); // Obter a distancia de jaccard
						
						if(dis>0.125){ // Se a semelhança for superior a 0.125 imprime os computadores sugeridos da base de dados
							System.out.println(leituraPC[j]);
						}
					}
				}
			}
		}while (escolher==1);
		
		ler.close();
	}	
}
