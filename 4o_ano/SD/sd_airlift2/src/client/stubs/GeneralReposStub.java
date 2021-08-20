package client.stubs;

import commInfra.ClientCom;
import commInfra.Message;
import commInfra.MessageType;
import commInfra.SimulPar;

/**
 *   Reference to a remote object.
 *
 *   It provides means to the setup of a communication channel and the message exchange.
 */

public class GeneralReposStub {
	
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

   public GeneralReposStub (){
      serverHostName = SimulPar.ReposHostName;
      serverPortNumb = SimulPar.ReposPort;

	  
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
   /**
	 *   Set pilot state.
	 *
	 *     @param state pilot state
	 */

	public void setPilotState (int state){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SET_PILOT_STATE);
        outMessage.setPilotStates(state);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setPilotState function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	}

	/**
	 *   Set passenger state.
	 *
	 *     @param id passenger id
	 *     @param state passenger state
	 */

	public void setPassengerState (int id, int state){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SET_PASSENGER_STATE,id);
        outMessage.setPassengerStates(state);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setPassengerState function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	}

	/**
	 *   Set hostess state.
	 *
	 *     @param state hostess state
	 *     @param id passenger ID
	 *     
	 */

	public void setHostessState (int state, int id){  
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SET_HOSTESS_STATE_ID,id);
        outMessage.setHostessStates(state);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setHostessState function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	}
	/**
	 *   Set hostess state.
	 *     @param state hostess state
	 *     
	 */
	public void setHostessState (int state) {setHostessState(state,0);}

   /**
	 *   Set inQueue number.
	 *
	 *     @param number number to add to inQueue
	 */

	public void setQueue (int number){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SETQUEUE);
        outMessage.setAnInt(number);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setQueue function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		
	}

	/**
	 *   Set inFlight number.
	 *
	 *     @param number number to add to inFlight
	 */

	public void setFlight (int number){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SETFLIGH);
        outMessage.setAnInt(number);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setFlight function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
	}



	/**
	 *   Set inDestination number.
	 *
	 *     @param number number to add to inDestination
	 */

	public void setDestisnation (int number){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.SETDESTINATION);
        outMessage.setAnInt(number);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in setDestisnation function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();
		}
	

	/**
	 *   Write a specific state line at the end of the logging file, for example an message informing that
	 *   the plane has arrived.
	 *
	 *     @param message message to write in the logging file
	 */

	public void reportSpecificStatus (String message){
		ClientCom con = new ClientCom(serverHostName, serverPortNumb);
        Message inMessage, outMessage;

        while(!con.open()){  // waiting for the connection to be established
            try {
            	Thread.currentThread().sleep((long) 10);
            } catch (InterruptedException ignored) {}
        }

        // asks for the service to be done
        outMessage = new Message(MessageType.REPORT_SPECIFIC_STATUS);
        outMessage.setaString(message);
        con.writeObject(outMessage);

        inMessage = (Message) con.readObject();
        if(inMessage.getMessageType() != MessageType.ACK){
            System.out.println("Invalid type: " + inMessage.getMessageType() + "in reportSpecificStatus function");
            System.out.println("Thread " + Thread.currentThread().getName() + ": Invalid type!");
            System.out.println(inMessage.toString());
            System.exit(1);
        }
        con.close();

	}


}
