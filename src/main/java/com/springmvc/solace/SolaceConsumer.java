package com.springmvc.solace;

import com.solacesystems.jcsmp.BytesXMLMessage;
import com.solacesystems.jcsmp.InvalidPropertiesException;
import com.solacesystems.jcsmp.JCSMPException;
import com.solacesystems.jcsmp.JCSMPFactory;
import com.solacesystems.jcsmp.JCSMPProperties;
import com.solacesystems.jcsmp.JCSMPSession;
import com.solacesystems.jcsmp.TextMessage;
import com.solacesystems.jcsmp.Topic;
import com.solacesystems.jcsmp.XMLMessageConsumer;
import com.solacesystems.jcsmp.XMLMessageListener;
import java.util.concurrent.CountDownLatch;

/**
 *
 * @author Andrew Diamond
 */
public class SolaceConsumer {
    private final JCSMPProperties properties;
    private final JCSMPSession session;

    public SolaceConsumer() throws InvalidPropertiesException, JCSMPException {
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
    
    public void CreateConsumer() throws JCSMPException{
        final CountDownLatch latch = new CountDownLatch(1);
        final XMLMessageConsumer cons = session.getMessageConsumer(new XMLMessageListener() {

            @Override
            public void onReceive(BytesXMLMessage msg) {
                if (msg instanceof TextMessage) {
                    System.out.printf("TextMessage received: '%s'%n",
                                      ((TextMessage)msg).getText());
                } else {
                    System.out.println("Message received.");
                }
                System.out.printf("Message Dump:%n%s%n",msg.dump());
                latch.countDown();  // unblock main thread
            }

            @Override
            public void onException(JCSMPException e) {
                System.out.printf("Consumer received exception: %s%n",e);
                latch.countDown();  // unblock main thread
            }
        });
        final Topic topic = JCSMPFactory.onlyInstance().createTopic("tutorial/topic");
        session.addSubscription(topic);
        cons.start();
        try {
            latch.await(); // block here until message received, and latch will flip
        } catch (InterruptedException e) {
            System.out.println("I was awoken while waiting");
        }
    }

    public static void main(String[] args) throws JCSMPException {
        SolaceConsumer smsg = new SolaceConsumer();
        smsg.Connect();
        smsg.CreateConsumer();
    }
}
