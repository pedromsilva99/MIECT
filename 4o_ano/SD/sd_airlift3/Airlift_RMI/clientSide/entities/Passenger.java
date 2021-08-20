package clientSide.entities;

import java.rmi.*;

import interfaces.*;
import genclass.GenericIO;

/**
 *    Passenger thread.
 *
 *   	It simulates the passenger life cycle.
 *      Implementation of a client-server model of type 2 (server replication).
 *      Communication is based on remote calls under Java RMI.
 */

public class Passenger extends Thread{
	
	/**
	 * Passenger identification.
	 */

	private int passengerId;

	/**
	 * Passenger state.
	 */

	private int passengerState;
	
	/**
	 *  Remote reference to the departure airport.
     */

	private final DepAirportInterface depAirportStub;
	
	/**
	 *  Remote reference to the plane.
     */

	private final PlaneInterface planeStub;
	
	/**
	 * Instantiation of a Passenger thread.
	 *
	 * @param name        thread name
	 * @param passengerId passenger id
	 * @param airport     reference to the departure airport
	 * @param plane 	  reference to the plane
	 * 
	 */

	public Passenger(String name, int passengerId, DepAirportInterface airport, PlaneInterface plane) {
		super(name);
		this.passengerId = passengerId;
		passengerState = PassengerStates.GOINGTOAIRPORT;
		this.depAirportStub = airport;
		this.planeStub = plane;
	}
	
	/**
	 * Set Passenger id.
	 *
	 * @param id Passenger id
	 */

	public void setPassengerId(int id) {passengerId = id;}

	/**
	 * Get Passenger id.
	 *
	 * @return Passenger id
	 */

	public int getPassengerId() {return passengerId;}

	/**
	 * Set Passenger state.
	 *
	 * @param state new Passenger state
	 */

	public void setPassengerState(int state) {passengerState = state;}

	/**
	 * Get Passenger state.
	 *
	 * @return Passenger state
	 */

	public int getPassengerState() {return passengerState;}

	/**
	 * Life cycle of the passenger.
	 * <p>When the Passenger is created he travels to the airport
	 * At the airport he waits in a queue to be called by the hostess.
	 * When called by the host he shows his documents and boards the plane.
	 * Inside the plane he waits for the pilot to travel to the destination 
	 * and when the pilot announces the arrival he leaves the plane.
	 * 
	 */

	@Override
	public void run() {
		GenericIO.writelnString("Run Passenger " + passengerId + "\n");
		travelToAirport();
		waitInQueue();
		showDocuments();
		boardThePlane();
		leaveThePlane();
		GenericIO.writelnString("\033[41m Passenger End Of Life \033[0m");
	}

	/**
	 * 
	 * Internal operation Travel to Airport
	 */

	private void travelToAirport() {
		try {
			sleep((long) (3 + 1000 * Math.random()));
		} catch (InterruptedException e) {
		}
	}
	
	private void waitInQueue(){
		try
	    { depAirportStub.waitInQueue(passengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Passenger "+ passengerId + " remote exception on waitInQueue: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private void showDocuments(){
		try
	    { depAirportStub.showDocuments(passengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Passenger "+ passengerId + " remote exception on showDocuments: " + e.getMessage ());
	      System.exit (1);
	    }
	}


	private void boardThePlane(){
		try
	    { planeStub.boardThePlane(passengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Passenger "+ passengerId + " remote exception on boardThePlane: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private void leaveThePlane(){
		try
	    { planeStub.leaveThePlane(passengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Passenger "+ passengerId + " remote exception on leaveThePlane: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	


}
