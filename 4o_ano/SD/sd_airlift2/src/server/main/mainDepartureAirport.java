package server.main;

import client.stubs.GeneralReposStub;
import commInfra.ServerCom;
import commInfra.SimulPar;
import server.interfaces.DepartureAirportInterface;
import server.proxies.DepartureAirportProxy;
import server.sharedRegions.DepartureAirport;

/**
 *    Server side of the Departure Airport.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class mainDepartureAirport {

	/**
	 * Port number
	 *
	 * @serialField portNumb
	 */

	private static final int portNumb = SimulPar.DepartureAirportPort;

	/**
	 * Activity signal .
	 */

	public static boolean waitConnection;

	/**
	 * Main program.
	 * @param args runtime arguments
	 */

	public static void main(String[] args) {

		DepartureAirport depAirport;
		DepartureAirportInterface depAirportInter;
		ServerCom scon, sconi;
		DepartureAirportProxy cliProxy;
		GeneralReposStub reposStub;

		scon = new ServerCom(portNumb);
		scon.start();

		reposStub = new GeneralReposStub();

		depAirport = new DepartureAirport(reposStub);
		depAirportInter = new DepartureAirportInterface(depAirport);
		System.out.println("Service established!");
		System.out.println("Server Listening.");
		System.out.println("Server Departure Airport");

		waitConnection = true;
		while (waitConnection)
			try {
				sconi = scon.accept();
				cliProxy = new DepartureAirportProxy(sconi, depAirportInter);
				cliProxy.start();
			} catch (Exception e) {
			}
		scon.end();
		System.out.println("Server disabled.");
	}
}
