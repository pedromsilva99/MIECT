package client.main;

import client.stubs.DepartureAirportStub;
import client.stubs.DestinationAirportStub;
import client.stubs.GeneralReposStub;
import client.stubs.PlaneStub;
import commInfra.SimulPar;
import genclass.GenericIO;
import client.entities.Passenger;

/**
 *    Main class for the Passenger Client. 
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class mainPassenger {
	
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
		
		 Passenger[] passengers = new Passenger[SimulPar.nPassengers];
        for(int i = 0; i < SimulPar.nPassengers; i++){
            passengers[i] = new Passenger("Passenger" + i, i, airport, plane, destAirport);
        }

		//Start thread
        for(int i = 0; i < SimulPar.nPassengers; i++){
            passengers[i].start();
        }
        GenericIO.writelnString("Passengers has starter");

        // running

        for(int i = 0; i < SimulPar.nPassengers; i++){
            try{
                passengers[i].join();
            } catch (InterruptedException e){
                e.printStackTrace();
            }
            GenericIO.writelnString("Passenger" + i + " has terminated");
		}

	}
}
