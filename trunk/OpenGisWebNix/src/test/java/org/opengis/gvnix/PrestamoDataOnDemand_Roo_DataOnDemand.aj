// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.gvnix;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.gvnix.Dispositivo;
import org.opengis.gvnix.Prestamo;
import org.opengis.gvnix.Usuario;
import org.springframework.stereotype.Component;

privileged aspect PrestamoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PrestamoDataOnDemand: @Component;
    
    private Random PrestamoDataOnDemand.rnd = new SecureRandom();
    
    private List<Prestamo> PrestamoDataOnDemand.data;
    
    public Prestamo PrestamoDataOnDemand.getNewTransientPrestamo(int index) {
        Prestamo obj = new Prestamo();
        setDispositivo(obj, index);
        setFin(obj, index);
        setInicio(obj, index);
        setUsuario(obj, index);
        return obj;
    }
    
    public void PrestamoDataOnDemand.setDispositivo(Prestamo obj, int index) {
        Dispositivo dispositivo = null;
        obj.setDispositivo(dispositivo);
    }
    
    public void PrestamoDataOnDemand.setFin(Prestamo obj, int index) {
        Calendar Fin = Calendar.getInstance();
        obj.setFin(Fin);
    }
    
    public void PrestamoDataOnDemand.setInicio(Prestamo obj, int index) {
        Calendar Inicio = Calendar.getInstance();
        obj.setInicio(Inicio);
    }
    
    public void PrestamoDataOnDemand.setUsuario(Prestamo obj, int index) {
        Usuario usuario = null;
        obj.setUsuario(usuario);
    }
    
    public Prestamo PrestamoDataOnDemand.getSpecificPrestamo(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Prestamo obj = data.get(index);
        return Prestamo.findPrestamo(obj.getId());
    }
    
    public Prestamo PrestamoDataOnDemand.getRandomPrestamo() {
        init();
        Prestamo obj = data.get(rnd.nextInt(data.size()));
        return Prestamo.findPrestamo(obj.getId());
    }
    
    public boolean PrestamoDataOnDemand.modifyPrestamo(Prestamo obj) {
        return false;
    }
    
    public void PrestamoDataOnDemand.init() {
        data = Prestamo.findPrestamoEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Prestamo' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.gvnix.Prestamo>();
        for (int i = 0; i < 10; i++) {
            Prestamo obj = getNewTransientPrestamo(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}