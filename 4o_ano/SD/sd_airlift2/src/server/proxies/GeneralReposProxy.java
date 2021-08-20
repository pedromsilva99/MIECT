package server.proxies;

import commInfra.Message;
import commInfra.MessageException;
import commInfra.ServerCom;
import server.interfaces.GeneralReposInterface;

/**
 *  Service provider agent for access to the General Repos.
 *
 *    Implementation of a client-server model of type 2 (server replication).
 *    Communication is based on a communication channel under the TCP protocol.
 */

public class GeneralReposProxy extends Thread {
	
	/**
     *  Thread counter
     *
     *    @serialField nProxy
     */

    private static int nProxy = 0;
    

    
    /**
     *  Communication field
     *
     *    @serialField sconi
     */

    private ServerCom sconi;
    
    /**
    * Reference to the departure airport interface
    */

    private GeneralReposInterface reposInterface;
    
    /**
     *  Interface instantiation
     *
     *    @param sconi communication channel
     *    @param reposInterface repository interface
     */

    public GeneralReposProxy(ServerCom sconi, GeneralReposInterface reposInterface) {
        super("Proxy_GeneralReposProxy_" + GeneralReposProxy.getProxyId());

        this.sconi = sconi;
        this.reposInterface = reposInterface;
    }
    
    
    /**
     *  Thread life cycle.
     */

    @Override
    public void run() {
        Message inMessage = null,                       // service request
        		outMessage = null;                      // service reply

        inMessage = (Message) sconi.readObject();       // get service request             
        try {
            outMessage = reposInterface.processAndReply(inMessage);    // process it    
        } catch (MessageException e) {
            System.out.println("Thread " + getName() + ": " + e.getMessage() + "!");
            System.out.println(e.getMessageVal().toString());
            System.exit(1);
        }
        sconi.writeObject(outMessage);                  // send service reply       			     
        sconi.close();                                  // close the communication channel              
    }
    
    /**
     *  Generates an id for the proxy.
     *
     *    @return proxy id
     */
    
    private static int getProxyId () {
        Class<?> cl = null;                                  
        int proxyId;                                         

        try {
            cl = Class.forName ("server.proxies.GeneralReposProxy");
        } catch (ClassNotFoundException e) {
            System.out.println("Datatype GeneralReposProxy was not found!");
            e.printStackTrace ();
            System.exit (1);
        }

        synchronized (cl) {
            proxyId = nProxy;
            nProxy += 1;
        }

        return proxyId;
    }
    
    /**
     *  Get the communication channel .
     *
     *    @return communication channel
     */

    public ServerCom getScon (){return sconi;}

}
