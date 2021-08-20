package client.stubs;

import commInfra.ClientCom;
import commInfra.MemException;
import commInfra.MemFIFO;
import commInfra.Message;
import commInfra.MessageType;
import commInfra.SimulPar;
import client.entities.Hostess;
import client.entities.HostessStates;
import client.entities.Passenger;
import client.entities.PassengerStates;
import client.entities.Pilot;
import client.entities.PilotStates;
import genclass.GenericIO;
//import main.SimulPar;
import client.stubs.GeneralReposStub;

/**
 *   Reference to a remote object.
 *
 *   It provides means to the setup of a communication channel and the message exchange.
 */

public class PlaneStub {

   /**
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

   public PlaneStub (){
      serverHostName = SimulPar.PlaneHostName;
      serverPortNumb = SimulPar.PlanePort;
   }
	/**
	 *  Operation board the plane.
	 *
	 *  It is called by a passenger when he has permission to enter the plane.
	 *
	 */
	
	public void boardThePlane () {   
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Passenger p = (Passenger) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.BOARDTHEPLANE,p.getPassengerId());
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.INPLANE){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in boardThePlane function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
	 }
		
   /**
	*  Operation wait for all in board.
	*
	*  It is called by the pilot after he signals that the plane is ready for boarding.
	*  The pilot waits for all the passengers to enter the plane.
	*
	*/
	
	public void waitForAllInBoard() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Pilot p = (Pilot) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.WAITFORALLINBOARD);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ALLINBOARD){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in waitForAllInBoard function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
	}
	
   /**
	*  Operation inform plane ready to take off.
	*
	*  It is called by the hostess after every passenger entering the plane.
	*
	*  @param nboarded number of people that boarded the plane
	*/
	
	public void informPlaneReadyToTakeOff(int nboarded) {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Hostess h = (Hostess) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                h.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.INFORMEDPLANETOTAKEOFF);
        outMessage.setAnInt(nboarded);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in informPlaneReadyToTakeOff function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        h.setHostessState(inMessage.getHostessStates());
        con.close();
		
	 }
		
   /**
	*  Operation fly to destination point.
	*
	*  It is called by the pilot to fly to the destination airport.
	*
	*/	
	
	public void flyToDestinationPoint () {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Pilot p = (Pilot) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.FLYTODESTINATIONPOINT);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in flyToDestinationPoint function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
   	}
   /**
	*  Operation announce arrival.
	*
	*  It is called by the pilot when he arrives at the destination airport.
	*
	*/		
		
	public void announceArrival () {

		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Pilot p = (Pilot) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.ANNOUNCEARRIVAL);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ANNOUNCEDARRIVAL){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in announceArrival function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	}
		
   /**
	*  Operation leave the plane.
	*
	*  It is called by the passenger to leave the plane.
	*
	*/	
	
	public void leaveThePlane () {   
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Passenger p = (Passenger) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.LEAVETHEPLANE,p.getPassengerId());
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.LEFTPLANE){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in leaveThePlane function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
	}
	
   /**
	*  Operation last print.
	*
	*  It is called by the pilot in the end to print the last information lines of the logger file.
	*
	*/
	
	public void lastPrint() {

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
		outMessage = new Message (MessageType.LASTPRINT);
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
		
		con.close();
    }
	
}
