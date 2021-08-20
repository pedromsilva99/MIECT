package commInfra;

/**
 *    Definition of the simulation parameters.
 */

public final class SimulPar {

	/**
	 *   Number of minimum people in plane (before last flight).
	 */

	public static final int minInPlane = 5;

	/**
	 *   Number of maximum people in plane.
	 */

	public static final int maxInPlane=10;

	/**
	 *   Number of pilots.
	 */

	public static final int nPilots = 1;

	/**
	 *   Number of hostesses .
	 */


	public static final int nHostess = 1;

	/**
	 *   Number of passengers .
	 */  

	public static final int nPassengers = 21;   

	/**
    * Departure Airport host name
	* @serial DepartureAirportHostName
    */
	
//	public static final String  DepartureAirportHostName = "localhost";
//
//    /**
//    * Departure Airport port number
//	* @serial DepartureAirportPort
//    */
//	
//    public static final int DepartureAirportPort = 4000 ;
//
//    /**
//     * Destination Airport host name
// 	 * @serial DestianionAirportHostName
//     */
//    
//    public static final String  DestianionAirportHostName = "localhost";
//
//    /**
//     * Destination Airport port number
// 	 * @serial DestianionAirportPort
//     */
//    
//    public static final int DestianionAirportPort = 4001 ;
//    
//    /**
//     * Plane host name
//     * @serial PlaneHostName
//     */
//    
//    public static final String  PlaneHostName = "localhost";
//
//    /**
//     * Plane port number
//  	 * @serial PlanePort
//     */
//    public static final int PlanePort = 4002 ;
//    
//    /**
//     * Repository host name
//   	 * @serial ReposHostName
//     */
//    
//    public static final String  ReposHostName = "localhost";
//
//    /**
//     * Repository port number
//   	 * @serial ReposPort
//     */
//    public static final int ReposPort = 4003 ;
	
// --------------------------------------------REMOTE ----------------------------
	public static final String  DepartureAirportHostName = "l040101-ws04.ua.pt";

    /**
    * Departure Airport port number
	* @serial DepartureAirportPort
    */
	
    public static final int DepartureAirportPort = 22360 ;

    /**
     * Destination Airport host name
 	 * @serial DestianionAirportHostName
     */
    
    public static final String  DestianionAirportHostName = "l040101-ws05.ua.pt";

    /**
     * Destination Airport port number
 	 * @serial DestianionAirportPort
     */
    
    public static final int DestianionAirportPort = 22361 ;
    
    /**
     * Plane host name
     * @serial PlaneHostName
     */
    
    public static final String  PlaneHostName = "l040101-ws06.ua.pt";

    /**
     * Plane port number
  	 * @serial PlanePort
     */
    public static final int PlanePort = 22362 ;
    
    /**
     * Repository host name
   	 * @serial ReposHostName
     */
    
    public static final String  ReposHostName = "l040101-ws07.ua.pt";

    /**
     * Repository port number
   	 * @serial ReposPort
     */
    public static final int ReposPort = 22363 ;
    
    /**
	 *   It can not be instantiated.
	 */
		
	private SimulPar ()
	{ }
}
