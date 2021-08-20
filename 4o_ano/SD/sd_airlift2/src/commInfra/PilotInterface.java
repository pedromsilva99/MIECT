package commInfra;

/**
 *    Pilot interface.
 *
 *      It specifies his own attributes.
 *      Implementation of a client-server model of type 2 (server replication).
 *      Communication is based on a communication channel under the TCP protocol.
 */

public interface PilotInterface {
	
	/**
     * Get Pilot State
     * @return pilot state
     */

    public int getPilotState();
    
    /**
     * Set Pilot State
     * 
     * @param st pilot state
     * 
     */

    public void setPilotState(int st);
    
 
    
    
}
