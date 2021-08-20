package client.entities;

import genclass.GenericIO;
import client.stubs.*;

/**
 *   Pilot thread.
 *
 *   It simulates the passenger life cycle.
 *   Communication is based on a communication channel under the TCP protocol.
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
	 *  Reference to the departure airport.
	 */

	private final DepartureAirportStub airport;

	/**
	 *  Reference to the plane.
	 */

	private final PlaneStub plane;

	/**
	 *  Reference to the destination airport.
	 */

	private final DestinationAirportStub destAirport;

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

	public Pilot  (String name, int pilotId, DepartureAirportStub airport, PlaneStub plane, DestinationAirportStub destAirport){
		super (name);
		this.pilotId = pilotId;
		this.airport = airport;
		this.plane = plane;
		this.destAirport = destAirport;
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
	 * Informs the hostess that the plane is ready for boarding
	 * Waits for the hostess to inform that all the passengers are in board
	 * Flies to the destination airport and then informs the passengers to leave the plane
	 * Waits for the plane to be empty and flies back to the departure airport
	 * Park the plane at the transfer gate
	 * 
	 */

	@Override
	public void run (){
		GenericIO.writelnString ("\nPILOT Run \n");
		while(!endOfDay) {
			airport.informPlaneReadyForBoarding();
			plane.waitForAllInBoard();
			plane.flyToDestinationPoint();
			plane.announceArrival();
			destAirport.flyToDeparturePoint();
			airport.parkAtTransferGate();
			endOfDay = airport.CheckEndOfDay();
		}
		plane.lastPrint();
		GenericIO.writelnString("\033[41m Pilot End Of Life \033[0m");
	}
}
