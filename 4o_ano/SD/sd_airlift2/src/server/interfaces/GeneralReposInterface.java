package server.interfaces;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.MessageType;
import server.sharedRegions.GeneralRepos;

/**
 *  Interface to the General Repos.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class GeneralReposInterface {
	
	/**
	 * Reference to the general repos.
	 */
	
	private GeneralRepos repos;
	
	/**
	 * Instantiation of the Destination Airport Interface.
	 *
	 * @param repos	reference to the repository
	 */
	
	public GeneralReposInterface(GeneralRepos repos){
		this.repos = repos;
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
		    	
		        case SET_PILOT_STATE:  
		            repos.setPilotState(inMessage.getPilotStates());
		           outMessage = new Message (MessageType.ACK);
		         break;
				case SET_PASSENGER_STATE:    
					repos.setPassengerState(inMessage.getID(),inMessage.getPassengerStates());
			           outMessage = new Message (MessageType.ACK);
		         break;
				case SET_HOSTESS_STATE_ID: 
					repos.setHostessState(inMessage.getHostessStates(), inMessage.getID());
			           outMessage = new Message (MessageType.ACK);
		         break;
				case SETQUEUE:   
					repos.setQueue(inMessage.getAnInt());
			           outMessage = new Message (MessageType.ACK);
		         break;
				case SETFLIGH:    
					repos.setFlight(inMessage.getAnInt());
			           outMessage = new Message (MessageType.ACK);
		         break;
				case SETDESTINATION:    
					repos.setDestisnation(inMessage.getAnInt());
			           outMessage = new Message (MessageType.ACK);
		         break;

				case REPORT_SPECIFIC_STATUS:     
					repos.reportSpecificStatus(inMessage.getaString());
			           outMessage = new Message (MessageType.ACK);
		         break;
				case SHUTDOWN:     // check shutdown
					repos.shutdown();
					 outMessage = new Message (MessageType.ACK);
		         break; 
		        default:
		            throw new MessageException ("Invalid type!", inMessage);
		        }

		return outMessage;
		 
	}
}
