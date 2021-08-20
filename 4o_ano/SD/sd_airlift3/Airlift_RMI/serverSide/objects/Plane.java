package serverSide.objects;

import java.rmi.*;

import clientSide.entities.*;
import interfaces.*;
import serverSide.main.*;
import commInfra.*;
import genclass.GenericIO;

/**
 *    Plane.
 *
 *    It is responsible to keep a continuously updated account of the passengers inside the plane
 *    and is implemented as an implicit monitor.
 *    All public methods are executed in mutual exclusion.
 *    There are four internal synchronization points: two single blocking point for the pilot, one where he waits for the signal
 *    that all passengers have entered the plane and another where he waits for all passengers to leave the plane;
 *    one an array of blocking points, one per each passenger, where he waits for the plane to arrive at the destination airport;
 *    and one single blocking point for the hostess, where she waits for all the passengers to enter the plane to tell the pilot.
 *    where cutting chair while having his hair cut.
 */

public class Plane extends Thread implements PlaneInterface{
	
	/**
	*  Number of passengers in the plane.
	*/
	
	private int nPassengers = 0;
	
   /**
	*  Vector for saving the number of passengers per flight.
	*/
	
	private int [] nPassForFlight;
	
   /**
	*  Number of passengers that left the flight.
	*/
	private int nPassengersLeft = 0;
	
	/**
	* Reference to passenger threads.
	*/

	private final Thread[] passen;
	
	/**
     *  State of the customers.
     */

    private final int [] passenState;
    
	/**
	 *  Reference to pilot thread.
	 */

	private final Thread[] pilot;
	
	/**
	 *  Reference to hostess thread.
	 */

	private final Thread[] hostess;
	
   /**
	*   Plane seats occupation.
	*/
	
	private MemFIFO<Integer> planeSeats; 
	
   /**
	* Number of the flight.
	*/
	
	private int flightNumber = 0;
	 
   /**
	*   Reference to the general repository.
	*/
	
	private final GeneralReposInterface repos;
	
   /**
	*  Variable that signals the flight arrival
	*/
	private boolean allOnBoard = false;
	
   /**
	*  Variable that signals the flight arrival
	*/
	private boolean arrived = false;
	   
   /**
	*  Plane instantiation.
	*
	*    @param repos reference to the general repository
	*/
 	
	public Plane (GeneralReposInterface repos) {
		
		nPassForFlight = new int [5];
		passen = new Thread[SimulPar.nPassengers];
		pilot = new Thread[SimulPar.nPilots];
		hostess = new Thread[SimulPar.nHostess];
		passenState = new int [SimulPar.nPassengers];
		
		for (int i = 0; i < SimulPar.nPassengers; i++) {
			passen[i] = null;
			passenState[i] = -1;
		}
		for (int i = 0; i < SimulPar.nPilots; i++)
			pilot[i] = null;
		for (int i = 0; i < SimulPar.nHostess; i++)
			hostess[i] = null;
		try
		{ planeSeats = new MemFIFO<> (new Integer [SimulPar.maxInPlane]);
		}
		catch (MemException e)
		{ GenericIO.writelnString ("Instantiation of waiting FIFO failed: " + e.getMessage ());
        	planeSeats = null;
        	System.exit (1);
		}
		this.repos = repos;
    }
	
	/**
	 *  Operation board the plane.
	 *
	 *  It is called by a passenger when he has permission to enter the plane.
	 *
	 */
	
	@Override
	public synchronized void boardThePlane(int passengerId) throws RemoteException{
		nPassengers++;										// the passenger sits on the plane
		
		passenState[passengerId] = PassengerStates.INFLIGHT;
	    repos.setFlight(1);									
	    repos.setQueue(-1);
	    repos.setPassengerState (passengerId, passenState[passengerId]);
	    GenericIO.writelnString ("\u001B[45mPASSENGER IN FLIGHT " + passengerId + "\u001B[0m");
	    try { 
	    	planeSeats.write (passengerId);                 // the passenger sits on the plane and waits for the end of the flight
	    }
	    catch (MemException e) {
	    	GenericIO.writelnString ("Insertion of customer id in plane FIFO failed: " + e.getMessage ());
	        System.exit (1);
	    }
	    notifyAll();   										// the passenger lets his presence be known
	}
	
	/**
	*  Operation wait for all in board.
	*
	*  It is called by the pilot after he signals that the plane is ready for boarding.
	*  The pilot waits for all the passengers to enter the plane.
	*
	*/
	
	@Override
	public synchronized void waitForAllInBoard() throws RemoteException{
		int pilotState;
		pilotState = PilotStates.WAITINGFORBOARDING;
		repos.setPilotState (pilotState);
		while (!allOnBoard) 
		{
			try {
				GenericIO.writelnString("\n\033[44mPilot Waiting for all Passengers\033[0m\n");
				wait();
				
			} 
			catch (Exception e) {
				return;
			}
		}	
		
		GenericIO.writelnString("Everybody on board");
		GenericIO.writelnString("Passengers left: " + nPassengersLeft);
	}
	
	/**
	*  Operation inform plane ready to take off.
	*
	*  It is called by the hostess after every passenger entering the plane.
	*
	*  @param nboarded number of people that boarded the plane
	*/
	
	@Override
	public synchronized void informPlaneReadyToTakeOff(int nboarded) throws RemoteException{
		System.out.println(nboarded);
		while (nboarded!= nPassengers) {
			try {
				GenericIO.writelnString("\n\033[44mPilot Waiting for all Passengers\033[0m\n");
				wait();
			}
			catch (Exception e) {
				return;
			}
		}
		int hostessState;
		hostessState = HostessStates.READYTOFLY;
		repos.setHostessState (hostessState);
		allOnBoard = true;
		notifyAll();
		
	}
	
	/**
	*  Operation fly to destination point.
	*
	*  It is called by the pilot to fly to the destination airport.
	*
	*/	
	
	@Override
	public synchronized void flyToDestinationPoint () throws RemoteException{
		try { 
        	sleep ((long) (3 + 100 * Math.random ()));
        }
        catch (InterruptedException e) {}
        GenericIO.writelnString ("NPassengers = "+nPassengers);
        
        flightNumber++;
        nPassForFlight[flightNumber-1] = nPassengers;
        int pilotState;
        pilotState = PilotStates.FLYINGFORWARD;
        repos.setPilotState (pilotState);
        GenericIO.writelnString ("\u001B[45mPLANE FLYING TO DESTINATION AIRPORT \u001B[0m");
	}

	/**
	*  Operation announce arrival.
	*
	*  It is called by the pilot when he arrives at the destination airport.
	*
	*/		
	
	@Override
	public synchronized void announceArrival () throws RemoteException{
		try {
			   sleep ((long) (1 + 100 * Math.random ()));
		   }
		   catch (InterruptedException e) {}
		   
		   repos.reportSpecificStatus("\nFlight " + flightNumber +": arrived.");
		   int pilotState;
		   pilotState = PilotStates.DEBOARDING;
		   repos.setPilotState (pilotState);
		   GenericIO.writelnString ("PLANE ARRIVED");
		   arrived = true;
		   notifyAll();
		   while (nPassengersLeft!=nPassengers) {
			   try { 
		    	  GenericIO.writelnString ("\n\033[0;34mPILOT waiting for passengers to leave the plane\033[0m\n");
		    	  wait();        
		        }
		        catch (Exception e) { 	
		        	return ;
		        }
		      }
		    while(nPassengers >0) {
		    	try{
		    		planeSeats.read ();                   
			      }
			      catch (MemException e) {
			    	  GenericIO.writelnString ("Removal of customer id in plane FIFO failed: " + e.getMessage ());
			          System.exit (1);
			      }
		    	nPassengers--;
		    }
		    
		    nPassengers=0;
		    nPassengersLeft=0;
		    allOnBoard = false;
		    arrived=false; 
		    
	}
	
	/**
	*  Operation leave the plane.
	*
	*  It is called by the passenger to leave the plane.
	*
	*/	
	
	@Override
	public synchronized void leaveThePlane (int passengerId) throws RemoteException{
		while (!arrived) {
	    	try { 
	    		GenericIO.writelnString ("\n\033[0;34mPassenger waiting for plane arrival\033[0m\n");
		    	wait();        
		    }
		    catch (Exception e) { 	
		    	System.exit(0);                 
		    }
	    }
	      
	    repos.setFlight(-1);
	    repos.setDestisnation(1);
	    nPassengersLeft++;
	    notifyAll();
	    passen[passengerId] = Thread.currentThread ();
	    passenState[passengerId] = PassengerStates.ATDESTINATION;
	    repos.setPassengerState (passengerId, passenState[passengerId]);
	    
	    GenericIO.writelnString ("\n\033[0;34mPassenger " + passengerId +" is on the destination\033[0m\n");
	}
	
	/**
	*  Operation last print.
	*
	*  It is called by the pilot in the end to print the last information lines of the logger file.
	*
	*/
	
	@Override
	public synchronized void lastPrint() throws RemoteException{
		repos.reportSpecificStatus("\nAirlift sum up:");
		
		for (int i=1; i<=flightNumber; i++) {
			repos.reportSpecificStatus("Flight " + i + " transported " + nPassForFlight[i-1] + " passengers");
		}
	}
	 
	/**
	 *   Operation server shutdown.
	 *
	 *   New operation.
	 *
	 *     @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	 *                             service fails
	 */

	@Override
	public synchronized void shutdown () throws RemoteException{
		ServerPlane.shutdown ();
	    notifyAll ();   
	}
}
