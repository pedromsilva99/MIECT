package clientSide.entities;

import java.rmi.*;

import interfaces.*;
import clientSide.main.SimulPar;
import clientSide.entities.HostessStates;
import genclass.GenericIO;

/**
 *   Hostess thread.
 *
 *   It simulates the hostess life cycle.
 *   Implementation of a client-server model of type 2 (server replication).
 *   Communication is based on remote calls under Java RMI.
 */

public class Hostess extends Thread{
	
	/**
	 * Hostess identification.
	 */

	private int hostessId;

	/**
	 * Hostess state.
	 */
	private int hostessState;

	/**
	 *  Remote reference to the departure airport.
     */

	private final DepAirportInterface depAirportStub;
	
	/**
	 *  Remote reference to the plane.
     */

	private final PlaneInterface planeStub;

	/**
	 * Control variable to know if there is no passengers to fly
	 */
	private Boolean endOfDay;
	
	/**
	 * Instantiation of a hostess thread.
	 *
	 * @param name       thread name
	 * @param hostessId  hostess id
	 * @param airport    reference to the departure airport
	 * @param plane    	 reference to the plane
	 */
	public Hostess(String name, int hostessId, DepAirportInterface airport, PlaneInterface plane) {
		super(name);
		this.hostessId = hostessId;
		hostessState = HostessStates.WAITFORFLIGHT;
		this.depAirportStub = airport;
		this.planeStub = plane;
		endOfDay = false;
	}
	
	/**
	 * Set hostess id.
	 *
	 * @param id hostess id
	 */
	public void setHostessId(int id) {hostessId = id;}

	/**
	 * Get hostess id.
	 *
	 * @return hostess id
	 */
	public int getHostessId() {return hostessId;}

	/**
	 * Set hostess state.
	 *
	 * @param state new hostess state
	 */
	public void setHostessState(int state) {hostessState = state;}

	/**
	 * Get hostess state.
	 *
	 * @return hostess state
	 */
	public int getHostessState() {return hostessState;}

	/**
	 * Life cycle of the hostess.
	 * When the hostess is created, while there is passengers to fly she follows a routine:
	 * <p>waits for the pilot to arrive at the Transfer Gate
	 * <p>After the plane is ready for boarding the Hostess Waits for a passenger to Call
	 * <p>Then ask the passenger to check his documents
	 * <p>If the plane is full or there is no more passengers to fly, she informs the pilot to take off
	 * <p>otherwise she calls for the next passenger
	 * 
	 */

	@Override
	public void run() {
		GenericIO.writelnString("\nHostess RUN\n");
		while (!endOfDay) {
			prepareForPassBoarding();
			while (hostessState != HostessStates.READYTOFLY) {
				int waitPassengerId = waitForNextPassenger();
				if (waitPassengerId >= 0)
					checkDocuments(waitPassengerId);
				else if (waitPassengerId == -SimulPar.nPassengers-1) {
					GenericIO.writelnString("ERROR");
					System.exit(0);
				} else {
					informPlaneReadyToTakeOff(waitPassengerId*-1);
				}
			}
			System.out.print("ENTRA");
			waitForNextFlight();
			endOfDay = CheckEndOfDay();
		}
		GenericIO.writelnString("\033[41m Hostess End Of Life \033[0m");
	}
	
	private void prepareForPassBoarding() {
		try
	    { depAirportStub.prepareForPassBoarding();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on prepareForPassBoarding: " + e.getMessage ());
	      System.exit (1);
	    }
	}
	
	private int waitForNextPassenger() {
		int waitPassengerId = 0;
		try
	    { waitPassengerId = depAirportStub.waitForNextPassenger();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on waitForNextPassenger: " + e.getMessage ());
	      System.exit (1);
	    }
		hostessState = HostessStates.WAITFORPASSENGER;
		return waitPassengerId;
	}
	
	private void checkDocuments(int waitPassengerId) {
		try
	    { depAirportStub.checkDocuments(waitPassengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on checkDocuments: " + e.getMessage ());
	      System.exit (1);
	    }
		hostessState = HostessStates.CHECKPASSENGER;
	}
	
	private void informPlaneReadyToTakeOff(int waitPassengerId) {
		try
	    { planeStub.informPlaneReadyToTakeOff(waitPassengerId);
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on informPlaneReadyToTakeOff: " + e.getMessage ());
	      System.exit (1);
	    }
		hostessState = HostessStates.READYTOFLY;
	}

	private void waitForNextFlight() {
		try
	    { depAirportStub.waitForNextFlight();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on waitForNextFlight: " + e.getMessage ());
	      System.exit (1);
	    }
		hostessState = HostessStates.WAITFORFLIGHT;
	}
	
	private boolean CheckEndOfDay() {
		boolean endOfDay = false;
		try
	    { endOfDay = depAirportStub.CheckEndOfDay();
	    }
	    catch (RemoteException e)
	    { GenericIO.writelnString ("Hostess remote exception on CheckEndOfDay: " + e.getMessage ());
	      System.exit (1);
	    }
		return endOfDay;
	}

}
