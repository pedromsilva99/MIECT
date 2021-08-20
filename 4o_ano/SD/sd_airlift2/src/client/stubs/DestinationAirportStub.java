package client.stubs;

import client.entities.Pilot;
import client.entities.PilotStates;
import commInfra.ClientCom;
import commInfra.Message;
import commInfra.MessageType;
import commInfra.SimulPar;
import genclass.GenericIO;

/**
 *   Reference to a remote object.
 *
 *   It provides means to the setup of a communication channel and the message exchange.
 */

public class DestinationAirportStub {

  /**
   *  Name of the computational system where the server is located.
   */

   private String serverHostName;

  /**
   *  Number of the listening port at the computational system where the server is located.
   */

   private int serverPortNumb;

  /**
   *  Instantiation of a remote reference
   */

   public DestinationAirportStub (){
      serverHostName = SimulPar.DestianionAirportHostName;
      serverPortNumb = SimulPar.DestianionAirportPort;
   }
   
  /**
   *  Sleep a certain amount of time to simulate the plane flying to the departure airport.
   *	After the Sleep, the Pilot changes his state to FLYINGBACK	
   *     
   */
   
   public  void flyToDeparturePoint () {  //hostess function
	   
	   ClientCom con = new ClientCom(serverHostName, serverPortNumb);
       Message inMessage, outMessage;
       Pilot p = (Pilot) Thread.currentThread();

       while(!con.open()){  // waiting for the connection to be established
           try {
               p.sleep((long) 10);
           } catch (InterruptedException ignored) {}
       }

       // asks for the service to be done
       outMessage = new Message(MessageType.FLYTODEPARTUREAIRPORT);
       con.writeObject(outMessage);

       inMessage = (Message) con.readObject();
       if(inMessage.getMessageType() != MessageType.ACK){
           System.out.println("Invalid type: " + inMessage.getMessageType() + "in flyToDeparturePoint function");
           System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
           System.out.println(inMessage.toString());
           System.exit(1);
       }
       con.close();
	   
	}
   
   /**
	*  Operation shut server.
	*
	*  It shuts down the server.
	*
	*/
   
   public void shutServer() {
   	//Open connection
   	ClientCom con = new ClientCom (serverHostName, serverPortNumb);
		Message inMessage, outMessage;
		Thread p = (Thread) Thread.currentThread();
		//Waits for connection
		while (!con.open ()){ 
			try{ 
				p.sleep ((long) (10));
	        }catch (InterruptedException e) {}
	    }
		
		//Shut down server message
		outMessage = new Message (MessageType.SHUTDOWN);
		con.writeObject (outMessage);
		inMessage = (Message) con.readObject ();
		
		//Message OK
		if ((inMessage.getMessageType () != MessageType.ACK)){
			System.out.println ("Thread " + p.getName () + ": Invalid type!");
			System.out.println (inMessage.toString ());
			System.exit (1);
       }
		//Close connection
		con.close();
   }
   
}
