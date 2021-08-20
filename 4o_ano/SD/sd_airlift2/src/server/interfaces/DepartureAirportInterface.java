package server.interfaces;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.MessageType;
import server.proxies.DepartureAirportProxy;
import server.sharedRegions.DepartureAirport;

/**
 *  Interface to the Departure Airport.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class DepartureAirportInterface {
	
	/**
	 * Reference to the departure airport.
	 */
	
	private DepartureAirport depAirport;
	
	/**
	 * Instantiation of the Departure Airport Interface.
	 *
	 * @param depAirport	reference to the departure airport
	 */
	
	public DepartureAirportInterface(DepartureAirport depAirport){
		this.depAirport = depAirport;
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
    	
        case WAITINQUEUE:  
        	((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.waitInQueue ();
           outMessage = new Message (MessageType.ACK);
               
         break;
		case SHOWDOCUMENTS:    
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.showDocuments();
           outMessage = new Message (MessageType.DOCUMENTSSHOWED);
         break;
		case WAITFORNEXTPASSENGER: 
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
           outMessage = new Message (MessageType.ACK);
           outMessage.setAnInt(depAirport.waitForNextPassenger());
           outMessage.setHostessStates(((DepartureAirportProxy) Thread.currentThread ()).getHostessState());
           
         break;
		case PREPAREFORPASSBOARDING:   
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.prepareForPassBoarding();
            outMessage = new Message (MessageType.ACK);
            outMessage.setHostessStates(((DepartureAirportProxy) Thread.currentThread ()).getHostessState());
         break;
		case CHECKDOCUMENTS:    
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.checkDocuments(inMessage.getAnInt()); 
            outMessage = new Message (MessageType.DOCUMENTSCHECKED);
            outMessage.setHostessStates(((DepartureAirportProxy) Thread.currentThread ()).getHostessState());
         break;
		case INFORMPLANEREADYFORBOARDING:     
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.informPlaneReadyForBoarding();
           outMessage = new Message (MessageType.ACK);
         break;
		case PARKATTRANSFERGATE:     
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.parkAtTransferGate();
           outMessage = new Message (MessageType.ACK);
         break;
		case CHECKENDOFDAY:     
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
			outMessage = new Message (MessageType.ACK);
            outMessage.setaBoolean(depAirport.CheckEndOfDay());
           
         break;
		case WAITFORNEXTFLIGHT:     
			((DepartureAirportProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            depAirport.waitForNextFlight();
           outMessage = new Message (MessageType.NEXTFLIGHTREADY);
         break; 
		case SHUTDOWN:
			depAirport.shutdown();
			outMessage = new Message (MessageType.ACK);
         break; 
        default:
            throw new MessageException ("Invalid type!", inMessage);
        }
        
		return outMessage;
	}

}
