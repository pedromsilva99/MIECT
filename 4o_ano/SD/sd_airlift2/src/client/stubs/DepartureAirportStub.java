package client.stubs;

import commInfra.*;
import client.entities.*;

/**
 *   Reference to a remote object.
 *
 *   It provides means to the setup of a communication channel and the message exchange.
 */

public class DepartureAirportStub{
	
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

   public DepartureAirportStub (){
      serverHostName = SimulPar.DepartureAirportHostName;
      serverPortNumb = SimulPar.DepartureAirportPort;
   }

   
   /**
	*  Operation wait in queue.
	*
	*  It is called by the passenger when he arrives to the airport.
	*
	*/	
	
	public void waitInQueue() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Passenger p = (Passenger) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.WAITINQUEUE,p.getPassengerId());
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in waitInQueue function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
	}
	
	/**
	*  Operation show documents.
	*
	*  It is called by the passenger when the hostess wants to check his documents.
	*
	*/	
	
	public void showDocuments() {

		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Passenger p = (Passenger) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SHOWDOCUMENTS,p.getPassengerId());
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.DOCUMENTSSHOWED){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in showDocuments function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	
	}
	 
   /**
	*  Operation wait for next passenger.
	*
	*  It is called by the hostess when the plane isn't ready to fly and she has to wait for passengers.
	*
	*  @return passengerId returns the Id from the passenger that is in front of the queue.
	*/	
	
	public int waitForNextPassenger() { 

		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Hostess h = (Hostess) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                h.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.WAITFORNEXTPASSENGER);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in waitForNextPassenger function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
        h.setHostessState(inMessage.getHostessStates());
        return inMessage.getAnInt();
		
	 }

   /**
	*  Operation prepare for pass boarding.
	*
	*  It is called by the hostess when she is waiting for the plane to arrive to the transfer gate.
	*
	*/
	
	public void prepareForPassBoarding() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Hostess h = (Hostess) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                h.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.PREPAREFORPASSBOARDING);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in prepareForPassBoarding function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
        h.setHostessState(inMessage.getHostessStates());
	}
	
   /**
	*  Operation check documents.
	*
	*  It is called by the hostess to check the documents of the first passenger of the queue.
	*
	*  @param waitPassengerId receives the id of the passenger that is having his documents checked
	*/

	public void checkDocuments(int waitPassengerId) {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Hostess h = (Hostess) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                h.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.CHECKDOCUMENTS);
        outMessage.setAnInt(waitPassengerId);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.DOCUMENTSCHECKED){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in checkDocuments function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
        h.setHostessState(inMessage.getHostessStates());
	}

   /**
	*  Operation inform plane ready for boarding.
	*
	*  It is called by the pilot after parking the plane at the transfer gate.
	*
	*/
	
	public void informPlaneReadyForBoarding() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Pilot p = (Pilot) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.INFORMPLANEREADYFORBOARDING);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in informPlaneReadyForBoarding function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();

	}

   /**
	*  Operation park at transfer gate.
	*
	*  It is called by the pilot after the flight back to park the plane at the transfer gate.
	*
	*/
	
	public void parkAtTransferGate() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Pilot p = (Pilot) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                p.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.PARKATTRANSFERGATE);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type:: " + inMessage.getMessageType() + "in parkAtTransferGate function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();

	}
	
   /**
	*  Operation check end of the day.
	*
	*  Checks if all the passengers have traveled to the destination airport.
	*
	*  @return true if all the passengers have traveled to the destination airport, false otherwise.
	*
	*/

	public Boolean CheckEndOfDay() {
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.CHECKENDOFDAY);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in CheckEndOfDay function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
        
		return inMessage.getaBoolean();//nLeft == 0;
	}
	
   /**
	*  Operation wait for next flight.
	*
	*  It is called by the hostess when the plane left the departure airport and 
	*  she has to wait for the next flight to arrive.
	*
	*/

	public void waitForNextFlight() {
		
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;
        Hostess h = (Hostess) Thread.currentThread();

        while(!con.open()){  // waiting for the connection to be established
            try {
                h.sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.WAITFORNEXTFLIGHT);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.NEXTFLIGHTREADY){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in waitForNextFlight function");
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
		
		con.close();
    }
   
}
