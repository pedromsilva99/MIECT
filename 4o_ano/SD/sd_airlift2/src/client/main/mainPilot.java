package client.main;

import client.entities.Pilot;
import client.stubs.*;//.DepartureAirport;

/**
 *    Main class for the Pilot Client. 
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class mainPilot {
	
	/**
	 *    Main method.
	 *
	 *    @param args runtime arguments
	 */
	
	public static void main(String args[]) {
		
		//Instantiate shared region stubs
 
		GeneralReposStub repos = new GeneralReposStub ();
		DepartureAirportStub airport = new DepartureAirportStub ();
		PlaneStub plane = new PlaneStub ();
		DestinationAirportStub destAirport = new DestinationAirportStub();
		
		
		Pilot pilot = new Pilot ("Pilot_" + 1, 1, airport, plane, destAirport);
		
		//Start thread
		pilot.start();
		
		//Join thread
		try{
			pilot.join();
		} catch(InterruptedException e){}
		
		//Shutdown servers
		repos.shutServer();
		airport.shutServer();
		plane.shutServer();
		destAirport.shutServer();
	}
}
