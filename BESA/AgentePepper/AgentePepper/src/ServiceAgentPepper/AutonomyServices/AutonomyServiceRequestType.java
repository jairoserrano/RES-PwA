/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServiceAgentPepper.AutonomyServices;

/**
 *
 * @author juans
 */
public enum AutonomyServiceRequestType {
    HOLA(" ");
    
    private String serviceType;
    
    private AutonomyServiceRequestType(String serv)
    {
        serviceType=serv;
    }
    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }
    
}
