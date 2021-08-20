package client.main;

import client.entities.Hostess;
import client.stubs.DepartureAirportStub;
import client.stubs.DestinationAirportStub;
import client.stubs.GeneralReposStub;
import client.stubs.PlaneStub;

/**
 * Main class for the Hostess Client. It only launches one hostess client.
 * Communication is based on a communication channel under the TCP protocol.
 */

public class mainHostess {

	/**
	 * Main method.
	 *
	 * @param args runtime arguments
	 */

	public static void main(String args[]) {
		GeneralReposStub repos = new GeneralReposStub();
		DepartureAirportStub airport = new DepartureAirportStub();
		PlaneStub plane = new PlaneStub();
		DestinationAirportStub destAirport = new DestinationAirportStub();

		Hostess hostess = new Hostess("Hostess_" + 1, 1, airport, plane);
		// Start thread
		hostess.start();

		// Join thread
		try {
			hostess.join();
		} catch (InterruptedException e) {
		}
		// Shutdown servers
		
	}
}
