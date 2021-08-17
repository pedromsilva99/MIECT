import java.util.*;

public class MinHash {
	
	private int numHash;
	private int[] hash;

	public MinHash(int numHash) {
		this.numHash = numHash;
		hash = new int[numHash];
		
		for(int j = 0; j < numHash; j++) {
			hash[j] = Math.abs((int)(Math.random()*Integer.MAX_VALUE));
		}
	}
	
	public double disJaccard(Set<String> set1, Set<String> set2) {
		
		Set<Integer> conjuntoA = new TreeSet<Integer>(arrayToList(linhaHashSet(set1)));
		Set<Integer> conjuntoB = new TreeSet<Integer>(arrayToList(linhaHashSet(set2)));
		
		Set<Integer> uniao = new TreeSet<>(); // União
		uniao.addAll(conjuntoA);
		uniao.addAll(conjuntoB);
		
		Set<Integer> intersecao = new TreeSet<>(); // Interseção
		intersecao.addAll(conjuntoA);
		intersecao.retainAll(conjuntoB);
		
		return (double)intersecao.size()/(double)uniao.size(); // Formula distancia de Jaccard
	}
	
	private static List<Integer> arrayToList(int[] intArray){
		
		List<Integer> newList = new ArrayList<>();
		
		for(int i : intArray) // Para cada ciclo o array = i
		
			newList.add(new Integer(i)); // Acrecentar nova lista
		
		return newList;
	}
	
	private int[] linhaHashSet(Set<String> shingle){ // Devolve os valores da hash num array
		
		Iterator<String> setIterator = shingle.iterator();
		int[] hashNum= new int[shingle.size()];
		
		for(int i = 0; i < hashNum.length; i++) {
			hashNum[i] = minHashNum(setIterator.next()); //  setIterator = min;
		}
		
		return hashNum;
	}
	
	private int minHashNum(String shingle) { // Calcula o menor valor da hash
		
		int min = Integer.MAX_VALUE;
		for(int i = 0; i < numHash; i++) {
			int hashCode = shingle.hashCode() ^ hash[i];
			min = Math.min(min, hashCode);
		}
		return min;
		
	}
	
	public static Set<String> split(String linha, int k) { // Set of 2 shingles
		
		Set<String> set = new TreeSet<>();
		
		for(int i = 0; i + k <= linha.length(); i++) {
			set.add(linha.substring(i,i+k));
		}
		return set;
	}
}
