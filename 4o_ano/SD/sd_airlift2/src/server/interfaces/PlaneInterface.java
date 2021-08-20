package server.interfaces;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.MessageType;
import server.proxies.PlaneProxy;
import server.sharedRegions.Plane;

/**
 *  Interface to the Plane.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class PlaneInterface {

	/**
	 * Reference to the plane.
	 */

    private Plane plane;


    /**
	 * Instantiation of the Plane Interface.
	 *
	 * @param plane	reference to the plane
	 */

    public PlaneInterface(Plane plane){
        this.plane = plane;
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

    public Message processAndReply (Message inMessage) throws MessageException {

        Message outMessage = null;

        switch (inMessage.getMessageType ()) {
    	
        case BOARDTHEPLANE:  
        	((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.boardThePlane();
           outMessage = new Message (MessageType.INPLANE);
         break;
		case WAITFORALLINBOARD:    
			
            plane.waitForAllInBoard();
           outMessage = new Message (MessageType.ALLINBOARD);
		         break;
		case INFORMEDPLANETOTAKEOFF: 
			((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.informPlaneReadyToTakeOff(inMessage.getAnInt());
            outMessage = new Message (MessageType.ACK);
           outMessage.setHostessStates(((PlaneProxy) Thread.currentThread ()).getHostessState());
		         break;
		case FLYTODESTINATIONPOINT:   
			((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.flyToDestinationPoint();
           outMessage = new Message (MessageType.ACK);
		         break;
		case ANNOUNCEARRIVAL:    
			((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.announceArrival();
           outMessage = new Message (MessageType.ANNOUNCEDARRIVAL);
		         break;
		case LEAVETHEPLANE:
			((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.leaveThePlane();
           outMessage = new Message (MessageType.LEFTPLANE);
         break;
		case LASTPRINT:
			((PlaneProxy) Thread.currentThread ()).setPassId(inMessage.getID());
            plane.lastPrint();
           outMessage = new Message (MessageType.ACK);
         break; 
		case SHUTDOWN:
			plane.shutdown();
			outMessage = new Message (MessageType.ACK);
	         break; 
            default:
                throw new MessageException ("Invalid type!", inMessage);
        }



        return (outMessage);
    }
}
