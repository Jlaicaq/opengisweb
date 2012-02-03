// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.gvnix;

import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.opengis.gvnix.Producto;
import org.opengis.gvnix.ogg.enumerated.enumTarea;
import org.springframework.stereotype.Component;

privileged aspect ProductoDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProductoDataOnDemand: @Component;
    
    private Random ProductoDataOnDemand.rnd = new SecureRandom();
    
    private List<Producto> ProductoDataOnDemand.data;
    
    public Producto ProductoDataOnDemand.getNewTransientProducto(int index) {
        Producto obj = new Producto();
        setDNI(obj, index);
        setDescripcion(obj, index);
        setID(obj, index);
        setNombre(obj, index);
        setTarea(obj, index);
        return obj;
    }
    
    public void ProductoDataOnDemand.setDNI(Producto obj, int index) {
        String DNI = "DNI_" + index;
        obj.setDNI(DNI);
    }
    
    public void ProductoDataOnDemand.setDescripcion(Producto obj, int index) {
        String Descripcion = "Descripcion_" + index;
        if (Descripcion.length() > 100) {
            Descripcion = Descripcion.substring(0, 100);
        }
        obj.setDescripcion(Descripcion);
    }
    
    public void ProductoDataOnDemand.setID(Producto obj, int index) {
        int ID = index;
        obj.setID(ID);
    }
    
    public void ProductoDataOnDemand.setNombre(Producto obj, int index) {
        String Nombre = "Nombre_" + index;
        obj.setNombre(Nombre);
    }
    
    public void ProductoDataOnDemand.setTarea(Producto obj, int index) {
        enumTarea Tarea = enumTarea.class.getEnumConstants()[0];
        obj.setTarea(Tarea);
    }
    
    public Producto ProductoDataOnDemand.getSpecificProducto(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Producto obj = data.get(index);
        return Producto.findProducto(obj.getId());
    }
    
    public Producto ProductoDataOnDemand.getRandomProducto() {
        init();
        Producto obj = data.get(rnd.nextInt(data.size()));
        return Producto.findProducto(obj.getId());
    }
    
    public boolean ProductoDataOnDemand.modifyProducto(Producto obj) {
        return false;
    }
    
    public void ProductoDataOnDemand.init() {
        data = Producto.findProductoEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Producto' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.opengis.gvnix.Producto>();
        for (int i = 0; i < 10; i++) {
            Producto obj = getNewTransientProducto(i);
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
