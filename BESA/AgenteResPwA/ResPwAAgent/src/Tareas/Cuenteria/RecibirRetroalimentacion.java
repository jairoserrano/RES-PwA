/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tareas.Cuenteria;

import RobotAgentBDI.Believes.RobotAgentBelieves;
import RobotAgentBDI.ResPwaUtils;
import rational.mapping.Believes;
import RobotAgentBDI.ServiceRequestDataBuilder.ServiceRequestBuilder;
import ServiceAgentResPwA.HumanServices.HumanServiceRequestType;
import ServiceAgentResPwA.ServiceDataRequest;
import ServiceAgentResPwA.TabletServices.TabletServiceRequestType;
import ServiceAgentResPwA.VoiceServices.PepperTopicsNames;
import ServiceAgentResPwA.VoiceServices.VoiceServiceRequestType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import rational.mapping.Task;

/**
 *
 * @author mafegarces
 */
public class RecibirRetroalimentacion extends Task {

    private HashMap<String, Object> infoServicio = new HashMap<>();
    private int num;

    public RecibirRetroalimentacion() {

        num = 0;
//        System.out.println("--- Task Recibir Retroalimentacion Iniciada ---");
    }

    @Override
    public void executeTask(Believes parameters) {
        System.out.println("--- Execute Task Recibir Retroalimentacion ---");
        RobotAgentBelieves blvs = (RobotAgentBelieves) parameters;
        ServiceDataRequest srb;

        if (blvs.getbEstadoInteraccion().getRetroalimentacionValue() == null) {
            if (blvs.getbEstadoInteraccion().isTopicoActivo(PepperTopicsNames.RETROTOPIC)) {
                if (num == 0) {
//                    System.out.println("HOLA 1 " + num + "  " + blvs.getbEstadoInteraccion().getRetroalimentacionValue());
//                    infoServicio = new HashMap<>();
//                    infoServicio.put("SAY", "placeholder");
//                    srb = ServiceRequestBuilder.buildRequest(VoiceServiceRequestType.FORCEINPUT, infoServicio);
//                    ResPwaUtils.requestService(srb, blvs);
                    num++;
                } else if (num == 1) {
                    System.out.println("HOLA 2 " + num + "  " + blvs.getbEstadoInteraccion().getRetroalimentacionValue());
                    infoServicio = new HashMap<>();
                    infoServicio.put("SAY", "Di una palabra para iniciar");
                    srb = ServiceRequestBuilder.buildRequest(VoiceServiceRequestType.SAY, infoServicio);
                    ResPwaUtils.requestService(srb, blvs);
                    num++;
                }
            }
            setTaskWaitingForExecution();

        } else {

            System.out.println("HOLA 3 " + num + "  " + blvs.getbEstadoInteraccion().getRetroalimentacionValue());
            String retroalimentacion = blvs.getbEstadoInteraccion().getRetroalimentacionValue();
            List<String> resulset = Arrays.asList(retroalimentacion.split(" "));
            srb = null;
            Double respuestaRetroalimentacion = -1.0;
            if (resulset != null) {
                HashMap<String, Long> resultados = new HashMap<>();
                resultados.put("Tres", resulset.stream().filter(retroa -> retroa.equalsIgnoreCase("Tres")).count() * 3);
                resultados.put("Dos", resulset.stream().filter(retroa -> retroa.equalsIgnoreCase("Dos")).count() * 2);
                resultados.put("Uno", resulset.stream().filter(retroa -> retroa.equalsIgnoreCase("Uno")).count());
                Double resulRetroAlimentacion = Double.valueOf(resultados.get("Tres") + resultados.get("Dos") + resultados.get("Uno") / resulset.size());
                if (resulRetroAlimentacion > 2.5) {
                    respuestaRetroalimentacion = 1.0;
                }
                if (resulRetroAlimentacion <= 2.5 && resulRetroAlimentacion >= 1.5) {
                    respuestaRetroalimentacion = 0.5;
                }
                if (resulRetroAlimentacion < 1.5) {
                    respuestaRetroalimentacion = 0.0;
                }

                blvs.feedbackActivity(respuestaRetroalimentacion);
                infoServicio = new HashMap<>();
                infoServicio.put("SAY", "!Tendre en cuenta tus valoraciones para la proxima vez!");
                srb = ServiceRequestBuilder.buildRequest(VoiceServiceRequestType.SAY, infoServicio);
                ResPwaUtils.requestService(srb, blvs);
                
                ResPwaUtils.activateTopic(PepperTopicsNames.RETROTOPIC, parameters);

            } else {
                setTaskWaitingForExecution();
            }
        }

    }

    @Override
    public void interruptTask(Believes believes) {
        System.out.println("--- Interrupt Task Recibir Retroalimentacion ---");
        RobotAgentBelieves blvs = (RobotAgentBelieves) believes;
        if (blvs.getbEstadoInteraccion().isEstaHablando()) {
            ServiceDataRequest srb = ServiceRequestBuilder.buildRequest(VoiceServiceRequestType.STOPALL, null);
            ResPwaUtils.requestService(srb, blvs);
        }
    }

    @Override
    public void cancelTask(Believes believes) {
        System.out.println("--- Cancel Task Recibir Retroalimentacion ---");
        RobotAgentBelieves blvs = (RobotAgentBelieves) believes;
        if (blvs.getbEstadoInteraccion().isEstaHablando()) {
            ServiceDataRequest srb = ServiceRequestBuilder.buildRequest(VoiceServiceRequestType.STOPALL, null);
            ResPwaUtils.requestService(srb, blvs);
        }
    }

    @Override
    public boolean checkFinish(Believes believes) {

        RobotAgentBelieves blvs = (RobotAgentBelieves) believes;
        if (!blvs.getbEstadoInteraccion().isTopicoActivo(PepperTopicsNames.RETROTOPIC)) {
            return true;
        }
        return false;
    }

}
