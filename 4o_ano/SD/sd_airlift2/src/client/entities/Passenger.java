package client.entities;

import genclass.GenericIO;
import client.stubs.*;

/**
 *   Passenger thread.
 *
 *   It simulates the passenger life cycle.
 *   Communication is based on a communication channel under the TCP protocol.
 */

public class Passenger extends Thread {

	/**
	 * Passenger identification.
	 */

	private int passengerId;

	/**
	 * Passenger state.
	 */

	private int passengerState;

	/**
	 * Reference to the departure airport.
	 */

	private final DepartureAirportStub airport;

	/**
	 * Reference to the plane.
	 */

	private final PlaneStub plane;

	/**
     *   Enum containing all the situations a passenger can be in.
     */

	/**
	 * Instantiation of a Passenger thread.
	 *
	 * @param name        thread name
	 * @param passengerId passenger id
	 * @param airport     reference to the departure airport
	 * @param plane 	  reference to the plane
	 * @param destAirport reference to the destination airport
	 */

	public Passenger(String name, int passengerId, DepartureAirportStub airport, PlaneStub plane,
			DestinationAirportStub destAirport) {
		super(name);
		this.passengerId = passengerId;
		passengerState = PassengerStates.GOINGTOAIRPORT;
		this.airport = airport;
		this.plane = plane;
		//this.destAirport = destAirport;
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
	 * When the Passenger is created he travels to the airport
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
		//GenericIO.writelnString("Run Passenger " + passengerId + " airport.waitInQueue(); \n");
		airport.waitInQueue();
		//GenericIO.writelnString("Run Passenger " + passengerId + " airport.showDocuments(); \n");
		airport.showDocuments();
		//GenericIO.writelnString("Run Passenger " + passengerId + " plane.boardThePlane(); \n");
		plane.boardThePlane();
		//GenericIO.writelnString("Run Passenger " + passengerId + " plane.leaveThePlane(); \n");
		plane.leaveThePlane();
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

}
