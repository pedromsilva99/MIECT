package interfaces;

import java.rmi.*;

/**
 *   Operational interface of a remote object of type Plane.
 *
 *     It provides the functionality to access the Plane.
 */

public interface PlaneInterface extends Remote{
	
	/**
	 *  Operation board the plane.
	 *
	 *  It is called by a passenger when he has permission to enter the plane.
	 *
	 *	@param passengerId receives the id of the passenger that arrived to the queue
	 *
	 *  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	 *  service fails
	 */
	
	public void boardThePlane (int passengerId) throws RemoteException;
	
	/**
	*  Operation wait for all in board.
	*
	*  It is called by the pilot after he signals that the plane is ready for boarding.
	*  The pilot waits for all the passengers to enter the plane.
	*
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*/
	
	public void waitForAllInBoard() throws RemoteException;
	
	/**
	*  Operation inform plane ready to take off.
	*
	*  It is called by the hostess after every passenger entering the plane.
	*
	*  @param nboarded number of people that boarded the plane
	*  
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*/
	
	public void informPlaneReadyToTakeOff(int nboarded) throws RemoteException;
	
	/**
	*  Operation fly to destination point.
	*
	*  It is called by the pilot to fly to the destination airport.
	*
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*/	
	
	public void flyToDestinationPoint () throws RemoteException;
	
	/**
	*  Operation announce arrival.
	*
	*  It is called by the pilot when he arrives at the destination airport.
	*
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*/		
		
	public void announceArrival () throws RemoteException;
	
	/**
	*  Operation leave the plane.
	*
	*  It is called by the passenger to leave the plane.
	*
	*  @param passengerId receives the id of the passenger that arrived to the queue
	*  
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*/	
	
	public void leaveThePlane (int passengerId) throws RemoteException;
	
	/**
	*  Operation last print.
	*
	*  It is called by the pilot in the end to print the last information lines of the logger file.
	*
	*  @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	*  service fails
	*  
	*/
	
	public void lastPrint() throws RemoteException;

	/**
	 *   Operation server shutdown.
	 *
	 *   New operation.
	 *
	 *   @throws RemoteException if either the invocation of the remote method, or the communication with the registry
	 *                             service fails
	 */

	public void shutdown () throws RemoteException;

}
