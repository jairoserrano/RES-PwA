/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RobotAgentBDI.Believes;




import BDInterface.RESPwABDInterface;
import ResPwAEntities.Actividadpwa;
import ResPwAEntities.Cancion;
import ResPwAEntities.Cuento;
import ResPwAEntities.Registroactividad;
import ResPwAEntities.RegistroactividadPK;
import RobotAgentBDI.ResPwAStrategy;
import RobotAgentBDI.ResPwAActivity;
import SensorHandlerAgent.SensorData;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import rational.data.InfoData;
import rational.mapping.Believes;

/**
 *
 * @author mafegarces
 */
public class BEstadoActividad implements Believes{
    
    private long tiempoInicioActividad;
    private ResPwAActivity actividadActual;
    private String estadoInit=null;
    private boolean actividadEnCurso;
    private boolean mejoraEmocional;
    private ResPwAStrategy estrategia;
    private Cancion cancionActual;
    private Cuento cuentoActual;
    private String cedula;
    private RobotAgentBelieves blvs=null;

    public BEstadoActividad(String cedula,RobotAgentBelieves blvs)
    {
        this.cedula=cedula;
        this.blvs=blvs;
    }
    
    @Override
    public boolean update(InfoData si) {
        System.out.println("BEstadoActividad update Received: "+si);
        SensorData infoRecibida= (SensorData)si;
        if(infoRecibida.getDataP().containsKey("actividadEnCurso"))
        {
            actividadEnCurso= Boolean.valueOf((String)infoRecibida.getDataP().get("actividadEnCurso"));
            if(actividadEnCurso)
            {
                tiempoInicioActividad=System.currentTimeMillis();
                estadoInit=blvs.getbEstadoEmocionalPwA().getEmocionPredominante().toString();
            }
            else{
                
                tiempoInicioActividad=0;
                createNewInteResgistry();
            }
        }
        return true;
    }

    public long getTiempoInicioActividad() {
        return System.currentTimeMillis()-tiempoInicioActividad;
    }

    public void setTiempoInicioActividad(long tiempoInicioActividad) {
        this.tiempoInicioActividad = tiempoInicioActividad;
    }

    public ResPwAActivity getActividadActual() {
        return actividadActual;
    }

    public void setActividadActual(ResPwAActivity actividadActual) {
        this.actividadActual = actividadActual;
    }

    public boolean isFinalizoActividad() {
        return actividadEnCurso;
    }

    public Cancion getCancionActual() {
        return cancionActual;
    }

    public void setFinalizoActividad(boolean finalizoActividad) {
        this.actividadEnCurso = finalizoActividad;
    }

    public boolean isMejoraEmocional() {
        return mejoraEmocional;
    }

    public void setMejoraEmocional(boolean mejoraEmocional) {
        this.mejoraEmocional = mejoraEmocional;
    }

    public ResPwAStrategy getEstrategia() {
        return estrategia;
    }

    public void setEstrategia(ResPwAStrategy estrategia) {
        this.estrategia = estrategia;
    }

    public long calcTiempoActividad() {
        Timestamp ts = Timestamp.valueOf(LocalDateTime.now());  
        long time = (ts.getTime() - tiempoInicioActividad)/1000;
        return time;
    }

    public void setCancionActual(Cancion cancionActual) {
        this.cancionActual = cancionActual;
    }

    public void setCuentoActual(Cuento cuentoActual) {
        this.cuentoActual = cuentoActual;
    }

    public Cuento getCuentoActual() {
        return cuentoActual;
    }

    public void createNewInteResgistry(){
        RegistroactividadPK ractPK= new RegistroactividadPK(Date.valueOf(LocalDate.now()),actividadActual.getTipo());
        Registroactividad ract= new Registroactividad(ractPK);
        List<Actividadpwa> list= RESPwABDInterface.getActivities();
        list.stream().filter((apwa) -> (apwa.getNombre().equalsIgnoreCase(actividadActual.toString()))).forEachOrdered((apwa) -> {
            ract.setActividadpwaId(apwa);
        });
        ract.setEstadoinicial(cedula);
        ract.setEstadofinal(cedula);
        ract.setPerfilpwaCedula(blvs.getbPerfilPwA().getPerfil());
        RESPwABDInterface.createRegistroAct(ract);
    }
}
