// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ogg;

import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import ogg.Usuarios;
import org.springframework.stereotype.Component;

privileged aspect UsuariosDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UsuariosDataOnDemand: @Component;
    
    private Random UsuariosDataOnDemand.rnd = new SecureRandom();
    
    private List<Usuarios> UsuariosDataOnDemand.data;
    
    public Usuarios UsuariosDataOnDemand.getNewTransientUsuarios(int index) {
        Usuarios obj = new Usuarios();
        setApellidos(obj, index);
        setCP(obj, index);
        setDNI(obj, index);
        setDireccion(obj, index);
        setEMAIL(obj, index);
        setFechaNacimiento(obj, index);
        setNombre(obj, index);
        setPassword(obj, index);
        setPoblacion(obj, index);
        setProvincia(obj, index);
        setTelefono(obj, index);
        return obj;
    }
    
    public void UsuariosDataOnDemand.setApellidos(Usuarios obj, int index) {
        String Apellidos = "Apellidos_" + index;
        if (Apellidos.length() > 50) {
            Apellidos = Apellidos.substring(0, 50);
        }
        obj.setApellidos(Apellidos);
    }
    
    public void UsuariosDataOnDemand.setCP(Usuarios obj, int index) {
        String CP = "CPx_" + index;
        if (CP.length() > 5) {
            CP = CP.substring(0, 5);
        }
        obj.setCP(CP);
    }
    
    public void UsuariosDataOnDemand.setDNI(Usuarios obj, int index) {
        String DNI = "DNIxxxx_" + index;
        if (DNI.length() > 10) {
            DNI = DNI.substring(0, 10);
        }
        obj.setDNI(DNI);
    }
    
    public void UsuariosDataOnDemand.setDireccion(Usuarios obj, int index) {
        String Direccion = "Direccion_" + index;
        if (Direccion.length() > 30) {
            Direccion = Direccion.substring(0, 30);
        }
        obj.setDireccion(Direccion);
    }
    
    public void UsuariosDataOnDemand.setEMAIL(Usuarios obj, int index) {
        String EMAIL = "EMAIL_" + index;
        if (EMAIL.length() > 40) {
            EMAIL = EMAIL.substring(0, 40);
        }
        obj.setEMAIL(EMAIL);
    }
    
    public void UsuariosDataOnDemand.setFechaNacimiento(Usuarios obj, int index) {
        String FechaNacimiento = "FechaNacimiento_" + index;
        if (FechaNacimiento.length() > 30) {
            FechaNacimiento = FechaNacimiento.substring(0, 30);
        }
        obj.setFechaNacimiento(FechaNacimiento);
    }
    
    public void UsuariosDataOnDemand.setNombre(Usuarios obj, int index) {
        String Nombre = "Nombre_" + index;
        if (Nombre.length() > 30) {
            Nombre = Nombre.substring(0, 30);
        }
        obj.setNombre(Nombre);
    }
    
    public void UsuariosDataOnDemand.setPassword(Usuarios obj, int index) {
        String Password = "Password_" + index;
        if (Password.length() > 16) {
            Password = Password.substring(0, 16);
        }
        obj.setPassword(Password);
    }
    
    public void UsuariosDataOnDemand.setPoblacion(Usuarios obj, int index) {
        String Poblacion = "Poblacion_" + index;
        if (Poblacion.length() > 30) {
            Poblacion = Poblacion.substring(0, 30);
        }
        obj.setPoblacion(Poblacion);
    }
    
    public void UsuariosDataOnDemand.setProvincia(Usuarios obj, int index) {
        String Provincia = "Provincia_" + index;
        if (Provincia.length() > 20) {
            Provincia = Provincia.substring(0, 20);
        }
        obj.setProvincia(Provincia);
    }
    
    public void UsuariosDataOnDemand.setTelefono(Usuarios obj, int index) {
        String Telefono = "Telefono_" + index;
        if (Telefono.length() > 15) {
            Telefono = Telefono.substring(0, 15);
        }
        obj.setTelefono(Telefono);
    }
    
    public Usuarios UsuariosDataOnDemand.getSpecificUsuarios(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        Usuarios obj = data.get(index);
        return Usuarios.findUsuarios(obj.getId());
    }
    
    public Usuarios UsuariosDataOnDemand.getRandomUsuarios() {
        init();
        Usuarios obj = data.get(rnd.nextInt(data.size()));
        return Usuarios.findUsuarios(obj.getId());
    }
    
    public boolean UsuariosDataOnDemand.modifyUsuarios(Usuarios obj) {
        return false;
    }
    
    public void UsuariosDataOnDemand.init() {
        data = Usuarios.findUsuariosEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Usuarios' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ogg.Usuarios>();
        for (int i = 0; i < 10; i++) {
            Usuarios obj = getNewTransientUsuarios(i);
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
