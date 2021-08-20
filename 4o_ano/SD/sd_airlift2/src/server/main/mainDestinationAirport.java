package server.main;

import client.stubs.GeneralReposStub;
import commInfra.ServerCom;
import commInfra.SimulPar;
import server.interfaces.DestinationAirportInterface;
import server.proxies.DestinationAirportProxy;
import server.sharedRegions.DestinationAirport;

/**
 *    Server side of the Destination Airport.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class mainDestinationAirport {
	
	/**
     *  Port number
     *
     *    @serialField portNumb
     */

    private static final int portNumb = SimulPar.DestianionAirportPort;
    
    /**
     *  Activity signal .
     */
    
    public static boolean waitConnection;                              // activity signal

    /**
     *  Main program.
     *  @param args runtime arguments
     */

    public static void main (String [] args){
    	
        DestinationAirport destAirport;                                    
        DestinationAirportInterface destAirportInter;                      
        ServerCom scon, sconi;                               
        DestinationAirportProxy cliProxy;       
        GeneralReposStub reposStub;

        scon = new ServerCom(portNumb);                     
        scon.start ();                                      

        reposStub = new GeneralReposStub();
        
        destAirport = new DestinationAirport(reposStub);
        destAirportInter = new DestinationAirportInterface(destAirport);
        System.out.println("Service established!");
        System.out.println("Server Listening.");
        System.out.println("Server Destination Airport");

        waitConnection = true;
        while (waitConnection)
            try {
                sconi = scon.accept ();                 
                cliProxy = new DestinationAirportProxy(sconi, destAirportInter);
                cliProxy.start ();
            } catch (Exception e) {}
        scon.end ();    
        System.out.println("Server disabled.");
    }
}
