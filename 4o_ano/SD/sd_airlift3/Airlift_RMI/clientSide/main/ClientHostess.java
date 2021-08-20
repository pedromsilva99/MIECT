package clientSide.main;

import java.rmi.registry.*;
import java.rmi.*;
import clientSide.entities.*;
import interfaces.*;
import genclass.GenericIO;

/**
 *    Client side of the Airlift (hostess).
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on Java RMI.
 */

public class ClientHostess {
	
	/**
	 *  Main method.
	 *
	 *    @param args runtime arguments
	 *        args[0] - name of the platform where is located the RMI registering service
	 *        args[1] - port number where the registering service is listening to service requests
	 *        
	 */


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String rmiRegHostName;                                         // name of the platform where is located the RMI registering service
	    int rmiRegPortNumb = -1;                                       // port number where the registering service is listening to service requests
	    
	    /* getting problem runtime parameters */
	    
	    if (args.length != 2)
        { GenericIO.writelnString ("Wrong number of parameters!");
          System.exit (1);
        }
	     rmiRegHostName = args[0];
	     try
	     { rmiRegPortNumb = Integer.parseInt (args[1]);
	     }
	     catch (NumberFormatException e)
	     { GenericIO.writelnString ("args[1] is not a number!");
	       System.exit (1);
	     }
	     if ((rmiRegPortNumb < 4000) || (rmiRegPortNumb >= 65536))
	        { GenericIO.writelnString ("args[1] is not a valid port number!");
	          System.exit (1);
	        }
	     
	     /* problem initialization */
	     String nameEntryGeneralRepos = "GeneralRepository";            // public name of the general repository object
	     GeneralReposInterface reposStub = null;                        // remote reference to the general repository object
	     String nameEntryDepAirport = "DepartureAirport";               // public name of the departure airport object
	     DepAirportInterface depAirportStub = null;                     // remote reference to the departure airport object
	     String nameEntryPlane = "Plane";                    			// public name of the plane object
	     PlaneInterface planeStub = null;                     			// remote reference to the plane object
	     Registry registry = null;                                      // remote reference for registration in the RMI registry service
	     Hostess hostess;                    							// hostess thread
	     
	     try
	      { registry = LocateRegistry.getRegistry (rmiRegHostName, rmiRegPortNumb);
	      }
	      catch (RemoteException e)
	      { GenericIO.writelnString ("RMI registry creation exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	     
	     try
	      { reposStub = (GeneralReposInterface) registry.lookup (nameEntryGeneralRepos);
	      }
	      catch (RemoteException e)
	      { GenericIO.writelnString ("GeneralRepos lookup exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	      catch (NotBoundException e)
	      { GenericIO.writelnString ("GeneralRepos not bound exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	     
	     try
	      { depAirportStub = (DepAirportInterface) registry.lookup (nameEntryDepAirport);
	      }
	      catch (RemoteException e)
	      { GenericIO.writelnString ("Departure Airport lookup exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	      catch (NotBoundException e)
	      { GenericIO.writelnString ("Departure Airport not bound exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	     
	     try
	      { planeStub = (PlaneInterface) registry.lookup (nameEntryPlane);
	      }
	      catch (RemoteException e)
	      { GenericIO.writelnString ("Plane lookup exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	      catch (NotBoundException e)
	      { GenericIO.writelnString ("Plane not bound exception: " + e.getMessage ());
	        e.printStackTrace ();
	        System.exit (1);
	      }
	     
	     hostess = new Hostess("hostess", 1, depAirportStub, planeStub);
	     
	     /* start of the simulation */

	      
	     hostess.start ();

	     /* waiting for the end of the simulation */

	      try{
	    	  hostess.join ();
	      }
	      catch (InterruptedException e) {}
	      GenericIO.writelnString ("The hostess has terminated.");
	     
	      GenericIO.writelnString ();
	
	}

}
