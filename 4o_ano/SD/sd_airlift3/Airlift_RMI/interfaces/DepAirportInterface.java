package interfaces;

import java.rmi.*;

/**
 *   Operational interface of a remote object of type Departure Airport.
 *
 *     It provides the functionality to access the Departure Airport.
 */

public interface DepAirportInterface extends Remote{
	
	 /**
		*  Operation wait in queue.
		*
		*  It is called by the passenger when he arrives to the airport.
		*  
		*  @param passengerId receives the id of the passenger that arrived to the queue
		*
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*  service fails
		*/	
		
		public void waitInQueue(int passengerId) throws RemoteException;
		
		/**
		*  Operation show documents.
		*
		*  It is called by the passenger when the hostess wants to check his documents.
		*  
		*  @param passengerId receives the id of the passenger that showed the documents
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*  service fails
		*
		*/	
		
		public void showDocuments(int passengerId) throws RemoteException;
		
		/**
		*  Operation wait for next passenger.
		*
		*  It is called by the hostess when the plane isn't ready to fly and she has to wait for passengers.
		*
		*  @return passengerId returns the Id from the passenger that is in front of the queue.
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	    *  service fails
		*/	
		
		public int waitForNextPassenger() throws RemoteException;
		
		/**
		*  Operation prepare for pass boarding.
		*
		*  It is called by the hostess when she is waiting for the plane to arrive to the transfer gate.
		*
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*/
		
		public void prepareForPassBoarding() throws RemoteException;
		
		/**
		*  Operation check documents.
		*
		*  It is called by the hostess to check the documents of the first passenger of the queue.
		*
		*  @param waitPassengerId receives the id of the passenger that is having his documents checked
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*/

		public void checkDocuments(int waitPassengerId) throws RemoteException;
		
		/**
		*  Operation inform plane ready for boarding.
		*
		*  It is called by the pilot after parking the plane at the transfer gate.
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*
		*/
		
		public void informPlaneReadyForBoarding() throws RemoteException;
		
		/**
		*  Operation park at transfer gate.
		*
		*  It is called by the pilot after the flight back to park the plane at the transfer gate.
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*
		*/
		
		public void parkAtTransferGate() throws RemoteException;
		
		/**
		*  Operation check end of the day.
		*
		*  Checks if all the passengers have traveled to the destination airport.
		*
		*  @return true if all the passengers have traveled to the destination airport, false otherwise.
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*
		*/

		public boolean CheckEndOfDay() throws RemoteException;
		
		/**
		*  Operation wait for next flight.
		*
		*  It is called by the hostess when the plane left the departure airport and 
		*  she has to wait for the next flight to arrive.
		*  
		*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*     service fails
		*
		*/

		public void waitForNextFlight() throws RemoteException;

		/**
		*   Operation server shutdown.
		*
		*   New operation.
		*
		*     @throws RemoteException if either the invocation of the remote method, or the communication with the registry
		*                             service fails
		*/

		public void shutdown () throws RemoteException;
		
}