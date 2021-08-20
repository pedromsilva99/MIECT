package commInfra;

/**
 *    Hostess interface.
 *
 *      It specifies his own attributes.
 *      Implementation of a client-server model of type 2 (server replication).
 *      Communication is based on a communication channel under the TCP protocol.
 */

public interface HostessInterface {
	
	/**
     * Get Hostess State
     * @return hostess state
     */

    public int getHostessState();
    
    /**
     * Set Hostess State
     * @param st hostess state
     */

    public void setHostessState(int st);
    
   
}
