package commInfra;

/**
 *    Passenger interface.
 *
 *      It specifies his own attributes.
 *      Implementation of a client-server model of type 2 (server replication).
 *      Communication is based on a communication channel under the TCP protocol.
 */

public interface PassengerInterface {
	
	/**
     * Get Passenger State~
     * @return passenger state
     */

    public int getPassengerState();
    
    /**
     * Set Passenger State
     * 
     * @param st passenger state
     */

    public void setPassengerState(int st);
    
    /**
     * Get Passenger ID
     * 
     * @return passenger id
     */

    public int getPassengerId();
    
    /**
     * Set Passenger State
     * 
     * @param id passenger id
     */

    public void setPassId(int id);
    

}
