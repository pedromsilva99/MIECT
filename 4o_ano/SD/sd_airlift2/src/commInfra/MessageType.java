package commInfra;


/**
 * This enumerate data type specifies the various messages that the clients and servers exchange between them in a Distributed solution
 * for the Airport Problem . Each message is tied to a function or an action crucial for the implementation.
 */
public enum MessageType {
	/**
	 * Initialization parameter
	 */
	
	NO_MESSAGE,
	

	/**
	  It is called by the pilot after the flight back to park the plane at the transfer gate (client solicitation).
	  */
	
	PARKATTRANSFERGATE,
	

	/**
	  * It is called by the pilot after parking the plane at the transfer gate (client solicitation).
	  */
	
	INFORMPLANEREADYFORBOARDING,
	
	/**
	  * It is called by the pilot after he signals that the plane is ready for boarding (client solicitation).
	  */
	
	WAITFORALLINBOARD,
	
	
	/**
	  * It is called by the pilot to fly to the destination airport (client solicitation).
	  */
	
	FLYTODESTINATIONPOINT,
	

	/**
	 * It is called by the pilot when he arrives at the destination airport (client solicitation).
	 */
	
	ANNOUNCEARRIVAL, 

	/**
	 *  Sleep a certain amount of time to simulate the plane flying to the departure airport (client solicitation).
	 */
	
	FLYTODEPARTUREAIRPORT,
	
	/**
	 * It is called by the hostess when the plane left the departure airport and 
	 * she has to wait for the next flight to arrive (client solicitation).
	 */
	
	WAITFORNEXTFLIGHT,
	
	/**
	 * It is called by the hostess when she is waiting for the plane to arrive to the transfer gate (client solicitation).
	 */
	
	PREPAREFORPASSBOARDING,
	
	/**
	 * It is called by the hostess to check the documents of the first passenger of the queue (server response).
	 */
	
	CHECKDOCUMENTS,
	
	/**
	 * It is called by the hostess when the plane left the departure airport and 
	 * she has to wait for the next flight to arrive (client solicitation).
	 */
	
	WAITFORNEXTPASSENGER,
	
	/**
	 * It is called by the hostess after every passenger entering the plane (client solicitation).
	 */
	
	INFORMPLANEREADYTOTAKEOFF,
	
	
	/**
	 * The Passenger wants to go to the airport (client solicitation).
	 */

	TRAVELTOAIRPORT,
	
	/**
	 * It is called by the passenger when he arrives to the airport (client solicitation).
	 */
	
	WAITINQUEUE,
	
	/**
	 * It is called by the passenger when the hostess wants to check his documents (client solicitation).
	 */
	
	SHOWDOCUMENTS,
	
	/**
	 * It is called by a passenger when he has permission to enter the plane (client solicitation).
	 */
	
	BOARDTHEPLANE,
	
	/**
	 * It is called by the passenger and he waits for the end of the flight (client solicitation).
	 */
	
	WAITFORENDOFFLIGHT,
	
	/**
	 * It is called by the passenger to leave the plane (client solicitation).
	 */
	
	LEAVETHEPLANE,
	
	/**
	 * The Pilot parked the plane (server response).
	 */
	
	PLANEATTRANSFERGATE,
	
	/**
	 * The Pilot informed the hostess that the plane is ready (server response).
	 */
	
	INFORMEDPLANEREADY,

	/**
	 * The Pilot receives the information that all the passengers are on board and they can go to destination (server response).
	 */
	
	ALLINBOARD,
	
	/**
	 * The Pilot flew to the destination point (server response).
	 */
	
	FLEWTODESTINATION,
	
	/**
	 * The Pilot announced the arrival (server response).
	 */
	
	ANNOUNCEDARRIVAL,
	
	/**
	 * The Pilot flew to the departure point (server response).
	 */
	
	FLEWTODEPARTURE,
	
	
	/**
	 * The Hostess receabes the message that the plane is ready to be boarded (server response).
	 */
	
	PASSBOARDINGREADY,
	
	/**
	 * The Hostess checked the documents (server response).
	 */
	
	DOCUMENTSCHECKED,
	
	/**
	 * The Hostess receives the message that the next passenger is ready (server response).
	 */
	
	NEXTPASSENGERREADY,
	
	/**
	 * The Hostess informed that the plane is ready to take off(server response).
	 */
	
	INFORMEDPLANETOTAKEOFF,
	
	/**
	 * The Hostess receives the message that the next flight is ready (server response).
	 */
	
	NEXTFLIGHTREADY,
	
	/**
	 * The Passenger arrives to the airport (server response).
	 */
	
	ATAIRPORT,
	
	/**
	 * The Passenger is now the head of the queue (server response).
	 */
	
	HEADOFQUEUE,
	
	/**
	 * The passenger showed his documents (server response).
	 */
	
	DOCUMENTSSHOWED,
	
	/**
	 * The Passenger is in the plane  (server response).
	 */
	
	INPLANE,
	
	/**
	 * The Passenger receives the information that the flight ended (server response).
	 */
	
	FLIGHTENDED,
	
	/**
	 * The Passenger left the plane and is in the destination point (server response).
	 */
	
	LEFTPLANE,
	
	/**
	 * Shuts down the server (client solicitation).
	 */
	
	SHUTDOWN,
	/**
	 * Ackloegment to know that the function runs correctly
	 */
	
	ACK,
	
	/**
     * Operation set pilot state.
     */
	
    SET_PILOT_STATE,
    
    /**
     * Operation set hostess state with passenger ID.
     */
    
    SET_HOSTESS_STATE_ID,
    
    /**
     * Operation set passenger state.
     */
    
    SET_PASSENGER_STATE,
    
    /**
     * Operation add flight info.
     */
    
    ADD_FLIGHT_INFO,
    
    /**
     * Operation report summary
     */
    
    REPORT_SUMMARY,
    
    /**
     * Operation initial summary
     */
    
    REPORT_INITIAL,
    
    /**
     * Operation initial summary
     */
    
    REPORT_SPECIFIC_STATUS,
    
    /**
     * Operation check end of day
     */
    
    CHECKENDOFDAY,
    
    /**
     * Operation set queue
     */
    
    SETQUEUE,
    
    /**
     * Operation set flight
     */
    
    SETFLIGH,
    
    /**
     * Operation set destination
     */
    
    SETDESTINATION,
    
    /**
     * Operation last Print
     */
    
    LASTPRINT,
	
}