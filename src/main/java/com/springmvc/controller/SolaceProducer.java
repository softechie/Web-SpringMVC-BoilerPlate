package com.springmvc.controller;

import com.solacesystems.jcsmp.InvalidPropertiesException;
import com.solacesystems.jcsmp.JCSMPException;
import com.solacesystems.jcsmp.JCSMPFactory;
import com.solacesystems.jcsmp.JCSMPProperties;
import com.solacesystems.jcsmp.JCSMPSession;
import com.solacesystems.jcsmp.JCSMPStreamingPublishEventHandler;
import com.solacesystems.jcsmp.TextMessage;
import com.solacesystems.jcsmp.Topic;
import com.solacesystems.jcsmp.XMLMessageProducer;

/**
 *
 * @author Andrew Diamond
 */
public class SolaceProducer {
    private final JCSMPProperties properties;
    private final JCSMPSession session;
    private XMLMessageProducer prod;

    public SolaceProducer() throws InvalidPropertiesException, JCSMPException {
        this.properties = new JCSMPProperties();
        this.properties.setProperty(JCSMPProperties.HOST, "tcp://mrred3awjn.messaging.solace.cloud:20768"); 
        this.properties.setProperty(JCSMPProperties.USERNAME, "solace-cloud-client"); 
        this.properties.setProperty(JCSMPProperties.PASSWORD, "gd3plk8dli4kad24b0se9slp2k"); 
        this.properties.setProperty(JCSMPProperties.VPN_NAME, "msgvpn-qpjftlxxw8p");
        this.session = JCSMPFactory.onlyInstance().createSession(properties);
    }
    
    public void Connect() throws JCSMPException{
       this.session.connect(); 
    }
    
    public void CreateProducer() throws JCSMPException{
        prod = session.getMessageProducer(new JCSMPStreamingPublishEventHandler() {

            @Override
            public void responseReceived(String messageID) {
                System.out.println("Producer received response for msg: " + messageID);
            }

            @Override
            public void handleError(String messageID, JCSMPException e, long timestamp) {
                System.out.printf("Producer received error for msg: %s@%s - %s%n",
                                   messageID,timestamp,e);
             }
        });
    }
    
    public void SendMessage(String message) throws JCSMPException {
        final Topic topic = JCSMPFactory.onlyInstance().createTopic("tutorial/topic");
        TextMessage msg = JCSMPFactory.onlyInstance().createMessage(TextMessage.class);
        msg.setText(message);
        prod.send(msg,topic);
    }
    
    public static void main(String[] args) throws JCSMPException {
        SolaceProducer smsg = new SolaceProducer();
        smsg.Connect();
        smsg.CreateProducer();
        smsg.SendMessage("Hello World!");
    }
}
