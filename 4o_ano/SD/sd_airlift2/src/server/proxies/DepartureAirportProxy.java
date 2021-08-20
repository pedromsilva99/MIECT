package server.proxies;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.PassengerInterface;
import commInfra.PilotInterface;
import commInfra.HostessInterface;
import commInfra.ServerCom;
import server.interfaces.DepartureAirportInterface;

/**
 *  Service provider agent for access to the Departure Airport.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class DepartureAirportProxy extends Thread implements PassengerInterface, HostessInterface, PilotInterface{
	
	/**
     *  Thread counter
     *
     *    @serialField nProxy
     */

    private static int nProxy = 0;
    
    /**
	 *  Hostess state.
	 */

	private int hostessState;
	
	/**
	 *  Pilot state.
	 */
	
	private int pilotState;
	
	/**
	 *  Passenger id.
	 */
	
	private int passengerID;
	
	/**
	 *  Passenger state.
	 */
	
	private int passengerState;
    
    /**
     *  Communication field
     *
     *    @serialField sconi
     */

    private ServerCom sconi;
    
    /**
    * Reference to the departure airport interface
    */

    private DepartureAirportInterface depAirportInterface;
    
    /**
     *  Interface instantiation
     *
     *    @param sconi communication channel
     *    @param depAirportInterface interface to the departure airport
     */

    public DepartureAirportProxy(ServerCom sconi, DepartureAirportInterface depAirportInterface) {
        super("Proxy_DepartureAirportProxy_" + DepartureAirportProxy.getProxyId());

        this.sconi = sconi;
        this.depAirportInterface = depAirportInterface;
    }
    
    
    /**
     *  Thread life cycle.
     */

    @Override
    public void run() {
        Message inMessage = null,                       // service request
        		outMessage = null;                      // service reply

        inMessage = (Message) sconi.readObject();       // get service request      	        
        try {
            outMessage = depAirportInterface.processAndReply(inMessage);    // process it    
        } catch (MessageException e) {
            System.out.println("Thread " + getName() + ": " + e.getMessage() + "!");
            System.out.println(e.getMessageVal().toString());
            System.exit(1);
        }
        sconi.writeObject(outMessage);                   // send service reply           
        sconi.close();                                   // close the communication channel             
    }
    
    /**
     *  Generates an id for the proxy.
     *
     *    @return proxy id
     */
    
    private static int getProxyId () {
        Class<?> cl = null;                                  
        int proxyId;                                         

        try {
            cl = Class.forName ("server.proxies.DepartureAirportProxy");
        } catch (ClassNotFoundException e) {
            System.out.println("Datatype DepartureAirportProxy was not found!");
            e.printStackTrace ();
            System.exit (1);
        }

        synchronized (cl) {
            proxyId = nProxy;
            nProxy += 1;
        }

        return proxyId;
    }
    
    /**
     *  Get the communication channel .
     *
     *    @return communication channel
     */

    public ServerCom getScon (){return sconi;}

    /**
     *   Get pilot state.
     *
     *     @return pilot state
     */
    
	@Override
	public int getPilotState() {return this.pilotState;}

	/**
     *   Set pilot state.
     *
     *     @param st pilot state
     */
	
	@Override
	public void setPilotState(int st) {this.pilotState=st;}

	/**
     *   Get hostess state.
     *
     *     @return hostess state
     */
	
	@Override
	public int getHostessState() {return this.hostessState;}

	/**
     *   Set hostess state.
     *
     *     @param st hostess state
     */
	
	@Override
	public void setHostessState(int st) {this.hostessState = st;}

	/**
     *   Get passenger state.
     *
     *     @return passenger state
     */
	
	@Override
	public int getPassengerState(){return this.passengerState;}

	/**
     *   Set passenger state.
     *
     *     @param st passenger state
     */
	
	@Override
	public void setPassengerState(int st) {this.passengerState = st;}

	/**
     *   Get passenger id.
     *
     *     @return passengerID
     */
	
	@Override
	public int getPassengerId() {return this.passengerID;}

	/**
     *   Set passenger id.
     *
     *     @param id passenger id
     */
	
	@Override
	public void setPassId(int id) {this.passengerID = id;}
}
