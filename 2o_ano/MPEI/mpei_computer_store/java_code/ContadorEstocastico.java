import java.util.*;
import java.io.*;

public class ContadorEstocastico {
		
	public static void contador() throws IOException{
				
		Scanner kb = new Scanner(System.in);
		double prob = 0;
		int opcao=0;
		File ficheiro = new File("computadores.txt");
		
		System.out.println("\n---------- Contador Estocástico ----------\n");
		
		do{
			do{
				System.out.print("Insira a probabilidade (entre 0 e 1) em que ocorre cada evento: "); 
				prob = kb.nextDouble();	
			}while (prob<0 || prob >1);
			
			int count1=0,count2=0,count3=0;
			int var1=0,var2=0,var3=0;
			
			if(ficheiro.exists()){
				Scanner ler = new Scanner(ficheiro);
				while(ler.hasNext()){		
					
					double y = Math.random(); // Gera um numero aleatorio entre 0 e 1
					
					//Strings que vamos utilizar
					String mem1000 = new String("1000GB"); 
					String lenovo = new String("LENOVO");	
					String preco1499 = new String("1499€");	
					
					String x = ler.next(); // Armezenar as strings do ficheiro "computadores.txt
					
					if(x.equals(mem1000)){ 
						var1++;	// Incremento do valor absoluto				
						if (y<(prob)){ // Apenas realiza este if se o numero gerado for menor que a probabilidade
							count1++; // Incremento do contador estocástico
						}
					}
					
					if(x.equals(lenovo)){
						var2++;					
						if (y<(prob)){
							count2++;
						}
					}
					
					if(x.equals(preco1499)){
						var3++;					
						if (y<(prob)){
							count3++;
						}
					}
				}
				
				System.out.printf("\nValor do contador estocástico para a variável \"1000GB\" de armazenamento: %5.0f\n",(double)count1*(1/prob));
				System.out.printf("Valor absoluto para a variável \"1000GB\" de armazenamento: %5d\n",var1);
				System.out.println();
				System.out.printf("Valor do contador estocástico para a variável \"LENOVO\": %5.0f\n",(double)count2*(1/prob));
				System.out.printf("Valor absoluto para a variável \"LENOVO\": %5d\n",var2);
				System.out.println();
				System.out.printf("Valor do contador estocástico para a variável \"1499€\": %5.0f\n",(double)count3*(1/prob));
				System.out.printf("Valor absoluto para a variável \"1499€\": %5d\n\n\n",var3);
	
				System.out.print("Pertende voltar a executar o contador estocástico? Sim(1) Não(0)-> ");
				opcao = kb.nextInt();
				System.out.println();	
			}
		}while(opcao==1); // Se a opção for 0 passa ao proximo modulo 
	}
}
