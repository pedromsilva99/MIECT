public class BloomFilter {
	
	private int[] ar;
	private int numHash;
	
	public BloomFilter(int N, int numHash){
		ar = new int[N];
		this.numHash = numHash;
	}
	
	private int hashfunction(String str) {
		
		int hash = Math.abs(str.hashCode());
		hash = Math.abs(hash % ar.length);
		return hash;
		
	}
	
	// Insere a string no array
	public void inserir(String str) {
		
		for(int i = 1; i <= numHash; i++) {
			str += i;
			int hash = hashfunction(str);
			ar[hash]++;
		}
	}
	
	// Verifica se a string pertence
	public boolean pertence(String str) {
		
		boolean pertence = true;
		
		for(int i = 1; i <= numHash; i++) {
			str += i;
			int hash = hashfunction(str);
			
			if(ar[hash] < 1) {
				pertence = false;
				break;
			}
		}
		return pertence;
	}
	
	// Conta o número de elementos pedidos (String str)
	public int contagem(String str){
		
		boolean pertence = true;
		int min = hashfunction(str+"1");
		
		for(int i = 1; i <= numHash; i++) {
			str += i;
			int hash = hashfunction(str);
			if(ar[hash] < min) {
				min = ar[hash];
			}
		}
		return min;
	}
	
	// Retira a string do array
	public void delete(String str) {
		
		for(int i = 1; i <= numHash; i++) {
			str += i;
			int hash = hashfunction(str);
			ar[hash]--;
		}
	}
}
