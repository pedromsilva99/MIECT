package clientSide.entities;

import java.rmi.*;

import interfaces.*;
import genclass.GenericIO;

/**
 *   Pilot thread.
 *
 *   It simulates the pilot life cycle.
 *   Implementation of a client-server model of type 2 (server replication).
 *   Communication is based on remote calls under Java RMI.
 */

public class Pilot extends Thread{
	
	/**
	 *  Pilot identification.
	 */

	private int pilotId;

	/**
	 *  Pilot state.
	 */

	private int pilotState;
	
	/**
	 *  Remote reference to the departure airport.
     */

	private final DepAirportInterface depAirportStub;
	
	/**
	 *  Remote reference to the plane.
     */

	private final PlaneInterface planeStub;
	
	/**
	 *  Remote reference to the destination airport.
     */

	private final DestAirportInterface destAirportStub;
	
	/**
	 * Control variable to know when to break the cycle.
	 */

	private Boolean endOfDay;
	
	/**
	 *   Instantiation of a Pilot thread.
	 *
	 *     @param name         thread name
	 *     @param pilotId      pilot id
	 *     @param airport      reference to the departure airport
	 *     @param plane 	      reference to the plane
	 *     @param destAirport  reference to the destination airport
	 */

	public Pilot  (String name, int pilotId, DepAirportInterface airport, PlaneInterface plane, DestAirportInterface destAirport){
		super (name);
		this.pilotId = pilotId;
		this.depAirportStub = airport;
		this.planeStub = plane;
		this.destAirportStub = destAirport;
		endOfDay=false;
	}
	
	/**
	 *   Set Pilot id.
	 *     @param id Pilot id
	 */

	public void setPilotId (int id){pilotId = id;}
	/**
	 *   Get Pilot id.
	 *     @return Pilot id
	 */

	public int getPilotId (){return pilotId;}

	/**
	 *   Set Pilot state.
	 *
	 *     @param state new Pilot state
	 */

	public void setPilotState (int state){pilotState = state;}

	/**
	 *   Get Pilot state.
	 *
	 *     @return Pilot state
	 */

	public int getPilotState (){return pilotState;}

	/**
	 *   Life cycle of the pilot.
	 * When the pilot is created, while there is passengers to fly he follows a routine:
	 * <p>Informs the hostess that the plane is ready for boarding
	 * <p>Waits for the hostess to inform that all the passengers are in board
	 * <p>Flies to the destination airport and then informs the passengers to leave the plane
	 * <p>Waits for the plane to be empty and flies back to the departure airport
	 * <p>Park the plane at the transfer gate
	 * 
	 */

	@Override
	public void run (){
		GenericIO.writelnString ("\nPILOT Run \n");
		while(!endOfDay) {
			informPlaneReadyForBoarding();
			waitForAllInBoard();
			flyToDestinationPoint();
			announceArrival();
			flyToDeparturePoint();
			parkAtTransferGate();
			endOfDay = CheckEndOfDay();
		}
		lastPrint();
		GenericIO.writelnString("\033[41m Pilot End Of Life \033[0m");
	}
	
	private void informPlaneReadyForBoarding(){
		try
	    { depAirportStub.informPlaneReadyForBoarding();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on informPlaneReadyForBoarding: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private void waitForAllInBoard(){
		try
	    { planeStub.waitForAllInBoard();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on waitForAllInBoard: " + e.getMessage ());
	      System.exit (1);
	    }
	}

	private void flyToDestinationPoint(){
		try
	    { planeStub.flyToDestinationPoint();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on flyToDestinationPoint: " + e.getMessage ());
	      System.exit (1);
	    }
	}

	private void announceArrival(){
		try
	    { planeStub.announceArrival();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on announceArrival: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private void flyToDeparturePoint(){
		try
	    { destAirportStub.flyToDeparturePoint();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on flyToDeparturePoint: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private void parkAtTransferGate(){
		try
	    { depAirportStub.parkAtTransferGate();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on parkAtTransferGate: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private boolean CheckEndOfDay(){
		boolean endOfDay = false;
		try
	    { endOfDay = depAirportStub.CheckEndOfDay();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on CheckEndOfDay: " + e.getMessage ());
	      System.exit (1);
	    }
		return endOfDay;		
	}
	
	private void lastPrint() {
		try
	    { planeStub.lastPrint();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Pilot remote exception on lastPrint: " + e.getMessage ());
	      System.exit (1);
	    }
	}
}
