/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tareas.ConversarEmpaticamente;

import rational.mapping.Believes;
import RobotAgentBDI.ResPwaTask;
import java.util.HashMap;

/**
 *
 * @author mafegarces
 */
public class PreguntarSentimientos extends ResPwaTask{
    
    private HashMap<String,Object> infoServicio;

    public PreguntarSentimientos() {
        System.out.println("--- Task Preguntar Sentimientos Iniciada ---");
    }
    

    @Override
    public void executeTask(Believes parameters) {
        System.out.println("--- Execute Task Preguntar Sentimientos ---");
    }

    @Override
    public void interruptTask(Believes believes) {
        System.out.println("--- Interrupt Task Preguntar Sentimientos ---");
    }

    @Override
    public void cancelTask(Believes believes) {
        System.out.println("--- Cancel Task Preguntar Sentimientos ---");
    }
    
}
