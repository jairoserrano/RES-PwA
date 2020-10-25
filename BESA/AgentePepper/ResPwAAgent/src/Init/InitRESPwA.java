package Init;

import PepperPackage.PepperSendable;
import BESA.BDI.AgentStructuralModel.GoalBDI;
import BESA.ExceptionBESA;
import BESA.Kernel.System.AdmBESA;
import EmotionalAnalyzerAgent.EmotionalAnalyzerAgent;
import PepperPackage.PepperAdapter;
import PepperPackage.PepperEAStrategy;
import RobotAgentBDI.RobotAgentBDI;
import RobotAgentBDI.Metas.AnimarElogiarPwA;
import RobotAgentBDI.Metas.Bailar;
import RobotAgentBDI.Metas.CambiarCancion;
import RobotAgentBDI.Metas.CambiarEnriquecimientoHistoria;
import RobotAgentBDI.Metas.CancelarActividad;
import RobotAgentBDI.Metas.Conversacion;
import RobotAgentBDI.Metas.ConversarEmpaticamente;
import RobotAgentBDI.Metas.EntrarModoKaraoke;
import RobotAgentBDI.Metas.GenerarReporteInteraccion;
import RobotAgentBDI.Metas.LogIn;
import RobotAgentBDI.Metas.MantenerAtencionPwA;
import RobotAgentBDI.Metas.PausarInteraccion;
import RobotAgentBDI.Metas.PedirAyuda;
import RobotAgentBDI.Metas.ReanudarActividad;
import RobotAgentBDI.Metas.RecargarBateria;
import RobotAgentBDI.Metas.ReiniciarActividad;
import RobotAgentBDI.Metas.SeleccionarCuentoGusto;
import SensorHandlerAgent.SensorHandlerAgent;
import ServiceAgentResPwA.RobotSPAgent;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author juans
 * Cuidador--> crea perfil y crea pwas

Autenticar.
1. Pepper se acerca.
2. Si identifica la cara, lo saluda e inicia sesion.
3. Le avisa que no lo conoce y que hable con su cuidador para poder hacerle un perfil.
Conversacion Casual.
"Hola, como estas hoy" y muestra en tablet
 y espera respuesta oral. 
Como estas como te fue hoy.
Y luego, lo escucha por un rato.
y le dice que hagan una actividad. 

Luego empieza la sesion. 

 */
public class InitRESPwA {
    
    public static String aliasRobotAgent= "RobotAgent";
    public static String aliasEAAgent= "EAAgent";
    public static String aliasSHAAgent= "SHAAgent";
    public static String aliasSPAgent= "SPAgent";
    private static int PLANID =0;
    
    public static void main(String[] args) {
       try {
            AdmBESA.getInstance();
            System.out.println("Iniciando RES-PwA");
            RobotAgentBDI RABDI= new RobotAgentBDI(aliasRobotAgent,createRobotAgentGoals());
            EmotionalAnalyzerAgent EAA= new EmotionalAnalyzerAgent(aliasEAAgent, new PepperEAStrategy());
            SensorHandlerAgent SHA= new SensorHandlerAgent(aliasSHAAgent);
            RobotSPAgent SPA= RobotSPAgent.buildRobotSPAgent(aliasSPAgent, new PepperAdapter());
            startAllAgents(RABDI,EAA,SHA,SPA);
        } catch (ExceptionBESA ex) {
            Logger.getLogger(InitRESPwA.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (Exception ex) {
            Logger.getLogger(InitRESPwA.class.getName()).log(Level.SEVERE, null, ex);
        }
  
    }
    
    public static int getPlanID(){
        return ++PLANID;
    }
    
    private static List<GoalBDI> createRobotAgentGoals()
    {
        List<GoalBDI> RAGoals= new ArrayList<>();
        //Crear Metas
        Bailar bailarGoal= Bailar.buildGoal();
//        AnimarElogiarPwA animarGoal=  AnimarElogiarPwA.buildGoal();
//        CambiarCancion cambiarCancionrGoal=  CambiarCancion.buildGoal();
//        CambiarEnriquecimientoHistoria cambiarEnriquecimientoHistoriaGoal=  CambiarEnriquecimientoHistoria.buildGoal();
//        CancelarActividad CancelarActividadGoal=  CancelarActividad.buildGoal();
//        Conversacion conversacionGoal = Conversacion.buildGoal();
//        ConversarEmpaticamente conversarEmpaticamenteGoal=  ConversarEmpaticamente.buildGoal();
//        EntrarModoKaraoke entrarModoKaraokeGoal=  EntrarModoKaraoke.buildGoal();
//
//        GenerarReporteInteraccion generarReporteInteraccionGoal=  GenerarReporteInteraccion.buildGoal();
//        LogIn logInGoal = LogIn.buildGoal();
//        MantenerAtencionPwA mantenerAtencionPwAGoal=  MantenerAtencionPwA.buildGoal();
//        PausarInteraccion pausarInteraccionGoal=  PausarInteraccion.buildGoal();
//        ReanudarActividad reanudarActividadGoal=  ReanudarActividad.buildGoal();
//        RecargarBateria recargarBateriaGoal=  RecargarBateria.buildGoal();
//        PedirAyuda pedirAyudaGoal= PedirAyuda.buildGoal();
//        ReiniciarActividad reiniciarActividadGoal=  ReiniciarActividad.buildGoal();
//        SeleccionarCuentoGusto seleccionarCuentoGustoGoal=  SeleccionarCuentoGusto.buildGoal();
        //Agregar a Lista
        RAGoals.add(bailarGoal);
//        RAGoals.add(animarGoal);
//        RAGoals.add(cambiarCancionrGoal);
//        RAGoals.add(cambiarEnriquecimientoHistoriaGoal);
//        RAGoals.add(CancelarActividadGoal);
//        RAGoals.add(conversacionGoal);
//        RAGoals.add(conversarEmpaticamenteGoal);
//        RAGoals.add(entrarModoKaraokeGoal);
//        RAGoals.add(generarReporteInteraccionGoal);
//        RAGoals.add(logInGoal);
//        RAGoals.add(mantenerAtencionPwAGoal);
//        RAGoals.add(pausarInteraccionGoal);
//        RAGoals.add(reanudarActividadGoal);
//        RAGoals.add(recargarBateriaGoal);
//        RAGoals.add(pedirAyudaGoal);
//        RAGoals.add(reiniciarActividadGoal);
//        RAGoals.add(seleccionarCuentoGustoGoal);
               // CambiarDificultad cambiarDificultadGoal=  CambiarDificultad.buildGoal();
                //EstimularEmocionalmente estimularEmocionalmenteGoal=  EstimularEmocionalmente.buildGoal();
        //        RAGoals.add(cambiarDificultadGoal);
                //RAGoals.add(estimularEmocionalmenteGoal);
        return RAGoals;
    }


    private static void startAllAgents(RobotAgentBDI RABDI, EmotionalAnalyzerAgent EAA, SensorHandlerAgent SHA, RobotSPAgent SPA) throws ExceptionBESA {
        RABDI.start();
        RABDI.startTimers();
        SPA.start();
        EAA.start();
        SHA.start();
        SHA.subscribeServices();
        RABDI.notifyInformationFlow();

    }

}