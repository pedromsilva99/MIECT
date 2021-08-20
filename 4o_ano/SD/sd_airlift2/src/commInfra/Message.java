package commInfra;

import java.io.Serializable;

import client.entities.HostessStates;
import client.entities.PassengerStates;
import client.entities.PilotStates;

/**
 * This class defines the constructors of the various messages that the clients and servers exchange between them in a Distributed solution
 * for the Airport Problem . The communication is based in message exchanges of type Message in a TCP channel.
 */

public class Message implements Serializable{
	
	/**
     * Type of message
     */
    private MessageType messageType;

    /**
     * ID of the client.entity that sent the message
     */
    
    private int ID;

    /**
     * Placeholder for a boolean value to be sent
     */
    
    private boolean aBoolean;
    
    /**
     * String
     */

    private String aString;

    /**
     * Integer
     */
    
    private int anInt;
    
    /**
     * Hostess states
     */
    
    private int hostessStates;
    
    /**
     * Pilot states
     */
    
    private int pilotStates;
    
    /**
     * Passenger states
     */
    
    private int passengerStates;

    /**
     * Message constructor
     * @param type The type of message
     */

    public Message(MessageType type){
    	this.messageType=type;
    }

    /**
     * Message constructor
     * @param type The type of message
     * @param id ID of the message creator
     */
    
    public Message(MessageType type, int id){
        this.messageType = type;
        this.ID = id;

    }

    /**
     * Set id
     * @param ID id of the message creator
     */
    
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * Get id
     * @return id ID of the message creator
     */
    
    public int getID() {
        return ID;
    }

    /**
     * setMessageType
     * @param messageType type of message
     */
    
    public void setMessageType(MessageType messageType) {
        this.messageType = messageType;
    }

    /**
     * getMessageType
     * @return messageType type of message
     */
    
    public MessageType getMessageType() {
        return this.messageType;
    }

    /**
     * setaBoolean
     * @param aBoolean boolean
     */
    
    public void setaBoolean(boolean aBoolean) {
        this.aBoolean = aBoolean;
    }

    /**
     * getaBoolean
     * @return aBoolean boolean
     */
    
    public boolean getaBoolean(){
        return this.aBoolean;
    }

    /**
     * setaInt
     * @param anInt int
     */
    
    public void setAnInt(int anInt) {
        this.anInt = anInt;
    }

    /**
     * getaInt
     * @return anInt int
     */
    
    public int getAnInt() {
        return anInt;
    }

    /**
     * setaString
     * @param aString string
     */
    
    public void setaString(String aString) {
        this.aString = aString;
    }

    /**
     * getaString
     * @return aString string
     */
    
    public String getaString() {
        return aString;
    }

    /**
     * getHostessStates
     * @return hostessStates hostess states
     */
    
    public int getHostessStates() {
        return hostessStates;
    }

    /**
     * setHostessStates
     * @param hostessStates hostess states
     */
    
    public void setHostessStates(int hostessStates) {
        this.hostessStates = hostessStates;
    }
    
    /**
     * getPilotStates
     * @return pilotStates pilot states
     */
    
    public int getPilotStates() {
        return pilotStates;
    }

    /**
     * setPilotStates
     * @param pilotStates pilot states
     */
    
    public void setPilotStates(int pilotStates) {
        this.pilotStates = pilotStates;
    }

    /**
     * getPassengerStates
     * @return passengerStates passenger states
     */
    
    public int getPassengerStates() {
        return passengerStates;
    }

    /**
     * setPassengerStates
     * @param passengerStates passenger states
     */
    
    public void setPassengerStates(int passengerStates) {
        this.passengerStates = passengerStates;
    }
}
