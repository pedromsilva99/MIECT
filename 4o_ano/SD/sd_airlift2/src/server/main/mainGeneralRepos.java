package server.main;

import commInfra.ServerCom;
import commInfra.SimulPar;
import server.interfaces.GeneralReposInterface;
import server.proxies.GeneralReposProxy;
import server.sharedRegions.GeneralRepos;

/**
 *    Server side of the General Repository of Information.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class mainGeneralRepos {
	
	/**
     *  Port number
     *
     *    @serialField portNumb
     */

    private static final int portNumb = SimulPar.ReposPort;
    
    /**
     *  Activity signal .
     */
    
    public static boolean waitConnection;

    /**
     *  Main program.
     *  @param args runtime arguments
     */

    public static void main (String [] args){
    	
    	GeneralRepos repos; 
        GeneralReposInterface reposInter;  
        ServerCom scon, sconi;  
        GeneralReposProxy cliProxy;

        scon = new ServerCom(portNumb); 
        scon.start (); 
        repos = new GeneralRepos("logger"); 
        reposInter = new GeneralReposInterface(repos);
        System.out.println("Service established!");
        System.out.println("Server Listening.");
        System.out.println("Server General Repository");

        waitConnection = true;
        while (waitConnection)
            try {
                sconi = scon.accept ();
                cliProxy = new GeneralReposProxy(sconi, reposInter); 
                cliProxy.start ();
            } catch (Exception e) {}
        scon.end (); 
        System.out.println("Server disabled.");
    }
}
