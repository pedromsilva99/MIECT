package server.interfaces;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.MessageType;
import server.proxies.DestinationAirportProxy;
import server.sharedRegions.DestinationAirport;

/**
 *  Interface to the Destination Airport.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class DestinationAirportInterface {
	
	/**
	 * Reference to the destination airport.
	 */
	
	private DestinationAirport destAirport;
	
	/**
	 * Instantiation of the Destination Airport Interface.
	 *
	 * @param destAirport	reference to the destination airport
	 */
	
	public DestinationAirportInterface(DestinationAirport destAirport){
		this.destAirport = destAirport;
	}
	
	/**
     *  Message processing executing the correspondent task.
     *  Generates as message to be answered
     *
     *  @param inMessage	message with the request
     *
     *  @return answering message
     *  
     *  @throws MessageException if the incoming message is not valid
     *
     */
	 
	public Message processAndReply (Message inMessage) throws MessageException{
		Message outMessage = null;
		
		switch (inMessage.getMessageType ()) {
		    	
	        case FLYTODEPARTUREAIRPORT:
	        	((DestinationAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
	            destAirport.flyToDeparturePoint();
	           outMessage = new Message (MessageType.ACK);
	         break;
	         
			case SHUTDOWN:     // check shutdown
				destAirport.shutdown();
				outMessage = new Message (MessageType.ACK);
	         break; 
	        default:
	            throw new MessageException ("Invalid type!", inMessage);
        }
		return outMessage;
		 
	}
}
