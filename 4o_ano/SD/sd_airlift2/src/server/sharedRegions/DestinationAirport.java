package server.sharedRegions;

import commInfra.*;
import client.entities.*;
import client.stubs.GeneralReposStub;
import genclass.GenericIO;
import server.main.mainDepartureAirport;
import server.main.mainDestinationAirport;
import server.proxies.DestinationAirportProxy;

/**
 * Destination Airport shared Region
 */

public class DestinationAirport extends Thread{

	/**
	 *  Reference to passenger threads.
	 */
	private final DestinationAirportProxy [] passen;

	/**
	 * Reference to the general repository.
	 */
	private final GeneralReposStub repos;

	/**
	 *   Instantiation of DestinationAirport object.
	 *
	 *     @param repos repository object for logging
	 */
	public DestinationAirport (GeneralReposStub repos){
		passen = new DestinationAirportProxy [SimulPar.nPassengers];
		for (int i = 0; i < SimulPar.nPassengers; i++)
			passen[i] = null;

		this.repos = repos;
	}
	
	/**
	 *  Sleep a certain amount of time to simulate the plane flying to the departure airport.
	 *	After the Sleep, the Pilot changes his state to FLYINGBACK	
	 *     
	 */
	public synchronized void flyToDeparturePoint () {  //hostess function
		try{ 
			sleep ((long) (3 + 100 * Math.random ()));
		}
		catch (InterruptedException e) {}

		((DestinationAirportProxy) Thread.currentThread ()).setPilotState (PilotStates.FLYINGBACK);
		repos.setPilotState (((DestinationAirportProxy) Thread.currentThread ()).getPilotState ());
		GenericIO.writelnString ("\u001B[45mPLANE FLYING TO DEPARTURE AIRPORT \u001B[0m");

	}
	
	/**
	 *   Operation server shutdown.
	 *
	 *   New operation.
	 */
	
	public synchronized void shutdown(){
        mainDestinationAirport.waitConnection = false;
    }
}
