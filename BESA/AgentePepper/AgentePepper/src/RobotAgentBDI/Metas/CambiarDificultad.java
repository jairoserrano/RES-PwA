/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RobotAgentBDI.Metas;

import BESA.BDI.AgentStructuralModel.GoalBDI;
import BESA.BDI.AgentStructuralModel.GoalBDITypes;
import BESA.BDI.AgentStructuralModel.StateBDI;
import BESA.Kernel.Agent.Event.KernellAgentEventExceptionBESA;
import Tareas.CambiarDificultad.EvaluarDesempeño;
import Tareas.CambiarDificultad.SeleccionarEstrategiaDificultad;
import Tareas.CambiarDificultad.SolicitarEstrategia;
import rational.RationalRole;
import rational.mapping.Believes;
import rational.mapping.Plan;

/**
 *
 * @author mafegarces
 */
public class CambiarDificultad extends GoalBDI{

    
        private static String descrip;

    public static CambiarDificultad buildGoal() {

        EvaluarDesempeño evaluarDesempeño = new EvaluarDesempeño();
        SeleccionarEstrategiaDificultad seleccionarEstrategiaD = new SeleccionarEstrategiaDificultad();
        SolicitarEstrategia solicitarEstrategia = new SolicitarEstrategia();

        Plan rolePlan= new Plan();

        rolePlan.addTask(evaluarDesempeño);
        rolePlan.addTask(seleccionarEstrategiaD);
        rolePlan.addTask(solicitarEstrategia);

        RationalRole cambiarDifRole = new RationalRole(descrip, rolePlan);
        CambiarDificultad b= new CambiarDificultad(0, cambiarDifRole, descrip, GoalBDITypes.DUTY);
        return b;
    }
    public CambiarDificultad(int id, RationalRole role, String description, GoalBDITypes type) {
        super(id, role, description, type);
        System.out.println("Meta CambiarDificultad created");
    }

    @Override
    public double evaluateViability(Believes believes) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad evaluateViability");
        return 0;
    }

    @Override
    public double detectGoal(Believes believes) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad detectGoal");
        return 0;
    }

    @Override
    public double evaluatePlausibility(Believes believes) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad evaluatePlausibility");
        return 0;
    }

    @Override
    public double evaluateContribution(StateBDI stateBDI) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad evaluateContribution");
        return 0;
    }

    @Override
    public boolean predictResultUnlegality(StateBDI agentStatus) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad predictResultUnlegality");
        return false;
    }

    @Override
    public boolean goalSucceeded(Believes believes) throws KernellAgentEventExceptionBESA {
        System.out.println("Meta CambiarDificultad goalSucceeded");
        return false;
    }
    
}
