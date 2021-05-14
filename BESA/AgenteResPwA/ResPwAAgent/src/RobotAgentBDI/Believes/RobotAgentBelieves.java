/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RobotAgentBDI.Believes;

import BDInterface.RESPwABDInterface;
import EmotionalAnalyzerAgent.EmotionalData;
import ResPwAEntities.Antecedente;
import ResPwAEntities.Cancion;
import ResPwAEntities.Cuento;
import ResPwAEntities.Perfilpwa;
import ResPwaUtils.Imagen;
import Retroalimentacion.Modelo.ModeloRetroalimentacion;
import RobotAgentBDI.ResPwAActivity;
import SensorHandlerAgent.SensorData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import rational.data.InfoData;
import rational.mapping.Believes;

/**
 *
 * @author juans
 */
public class RobotAgentBelieves implements Believes {

    private BEstadoInteraccion bEstadoInteraccion;
    private BEstadoEmocionalPwA bEstadoEmocionalPwA;
    private BEstadoActividad bEstadoActividad;
    private BPerfilPwA bPerfilPwA;
    private BEstadoRobot bEstadoRobot;
    private Map<String, List<String>> imgCuentos; //nomCuento //Lista de Strings -> url
    private List<Imagen> imgsPerfil;

    public RobotAgentBelieves(String cedula) {
        bEstadoEmocionalPwA = new BEstadoEmocionalPwA();
        bEstadoInteraccion = new BEstadoInteraccion();
        bEstadoRobot = new BEstadoRobot();
        imgCuentos = new HashMap<>();
        imgsPerfil = new ArrayList<>();
        bEstadoActividad = new BEstadoActividad(cedula, this);
        bPerfilPwA = new BPerfilPwA(this);
        bPerfilPwA.setPerfil(getPerfilBD(cedula));
//        FBaseUtils.initResPwa(this);
    }

    //AQUI SE MANDA LO DE INFORMATIONFLOW
    //Aqui se accede a BD y se pide info de otros believes. 
    @Override
    public boolean update(InfoData si) {
        if (si != null && si instanceof EmotionalData) {
            EmotionalData se = (EmotionalData) si;
            System.out.println("Emotional RobotAgentBelieves update Received: " + se.getInfo());
            if (se.getEmoEv() != null) {
                bEstadoRobot.update(se);
            }
            bEstadoEmocionalPwA.update(si);
        } else if (si != null) {
            SensorData infoRecibida = (SensorData) si;
            System.out.println("RobotAgentBelieves update Received: " + infoRecibida.getDataP());
            switch (infoRecibida.getDataType()) {
                case ACTIVITY:
                    bEstadoActividad.update(si);
                    break;
                case INTERACTION:
                    bEstadoInteraccion.update(si);
                    break;
                case ROBOT:
                    bEstadoRobot.update(si);
                    break;
                case PROFILE:
                    bPerfilPwA.update(si);
                    break;
                default:
                    break;
            }
        }

        return true;
    }

    public void feedbackActivity(double voiceFeedback) {
        double emotionFeedback = 0.0;
        ResPwAActivity activity = bEstadoActividad.getActividadActual();
        Object activityInCourse = null;
        List<Antecedente> antecedents = RESPwABDInterface.getActecedents();
        //        emotionFeedback = bEstadoEmocionalPwA.getFeedbackEmotion();
        List<Antecedente> antecedentsForFeedback = getAntecedentsForFeedback(emotionFeedback, voiceFeedback, antecedents);
        


        switch (activity) {
            case CUENTERIA:
                activityInCourse = (Cuento) bEstadoActividad.getCuentoActual();

                ModeloRetroalimentacion<Cuento> modeloRetroCuento = new ModeloRetroalimentacion<Cuento>((Cuento) activityInCourse);
                modeloRetroCuento.activityFeedback(antecedentsForFeedback);
                break;

            case MUSICOTERAPIA:
                activityInCourse = (Cancion) bEstadoActividad.getCancionActual();
                ModeloRetroalimentacion<Cancion> modelRetroCancion = new ModeloRetroalimentacion<Cancion>((Cancion) activityInCourse);
                modelRetroCancion.activityFeedback(antecedentsForFeedback);
                break;
        }

    }

    private List<Antecedente> getAntecedentsForFeedback(double emotionFeedback, double voiceFeedback, List<Antecedente> antecedents) {

        List<Antecedente> antecedentsForFeedback = new ArrayList<>();
        for (int i = 0; i < antecedents.size(); i++) {
            if (antecedents.get(i).getEtiqueta().equals("EMOTIONFEEDBACK") && antecedents.get(i).getValor() == emotionFeedback) {
                antecedentsForFeedback.add(antecedents.get(i));
            } else {
                if (antecedents.get(i).getEtiqueta().equals("VOICEFEEDBACK") && antecedents.get(i).getValor() == voiceFeedback) {
                    antecedentsForFeedback.add(antecedents.get(i));
                }
            }
        }
        
        return antecedentsForFeedback;
    }

    public Object getActivityInCourse() {
        ResPwAActivity activity = bEstadoActividad.getActividadActual();
        Object activityInCourse = null;

        switch (activity) {
            case CUENTERIA:
                activityInCourse = (Cuento) bEstadoActividad.getCuentoActual();
                break;

            case MUSICOTERAPIA:
                activityInCourse = (Cancion) bEstadoActividad.getCancionActual();
                break;
        }

        return activityInCourse;

    }

    private Perfilpwa getPerfilBD(String cedula) {
        //conectarConBD
        return getFromDB(cedula);
    }

    Perfilpwa getFromDB(String cedula) {
        Perfilpwa perfil = RESPwABDInterface.getProfile(cedula);
        return perfil;
    }

    public BEstadoInteraccion getbEstadoInteraccion() {
        return bEstadoInteraccion;
    }

    public void setbEstadoInteraccion(BEstadoInteraccion bEstadoInteraccion) {
        this.bEstadoInteraccion = bEstadoInteraccion;
    }

    public BEstadoEmocionalPwA getbEstadoEmocionalPwA() {
        return bEstadoEmocionalPwA;
    }

    public void setbEstadoEmocionalPwA(BEstadoEmocionalPwA bEstadoEmocionalPwA) {
        this.bEstadoEmocionalPwA = bEstadoEmocionalPwA;
    }

    public BEstadoActividad getbEstadoActividad() {
        return bEstadoActividad;
    }

    public void setbEstadoActividad(BEstadoActividad bEstadoActividad) {
        this.bEstadoActividad = bEstadoActividad;
    }

    public BPerfilPwA getbPerfilPwA() {
        return bPerfilPwA;
    }

    public void setbPerfilPwA(BPerfilPwA bPerfilPwA) {
        this.bPerfilPwA = bPerfilPwA;
    }

    public BEstadoRobot getbEstadoRobot() {
        return bEstadoRobot;
    }

    public void setbEstadoRobot(BEstadoRobot bEstadoRobot) {
        this.bEstadoRobot = bEstadoRobot;
    }

    public Map<String, List<String>> getImgCuentos() {
        return imgCuentos;
    }

    public void setImgCuentos(Map<String, List<String>> imgCuentos) {
        this.imgCuentos = imgCuentos;
    }

    public List<Imagen> getImgsPerfil() {
        return imgsPerfil;
    }

    public void setImgsPerfil(List<Imagen> imgsPerfil) {
        this.imgsPerfil = imgsPerfil;
    }

    public List<Imagen> getImagexTag(String tag) {
        List<Imagen> imagenes = new ArrayList<>();

        for (Imagen i : imgsPerfil) {
            for (String t : i.getTags()) {
                if (t.equalsIgnoreCase(tag)) {
                    imagenes.add(i);
                }
            }
        }
        return imagenes;
    }

    @Override
    public Believes clone() throws CloneNotSupportedException {
        return this;
    }

}
