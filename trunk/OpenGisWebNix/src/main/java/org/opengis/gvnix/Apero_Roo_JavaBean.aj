// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.gvnix;

import java.lang.Integer;
import java.lang.String;
import org.opengis.gvnix.Usuario;
import org.opengis.gvnix.enumerated.Tarea;

privileged aspect Apero_Roo_JavaBean {
    
    public String Apero.getNombre() {
        return this.nombre;
    }
    
    public void Apero.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public Integer Apero.getTamanyo() {
        return this.tamanyo;
    }
    
    public void Apero.setTamanyo(Integer tamanyo) {
        this.tamanyo = tamanyo;
    }
    
    public String Apero.getDescripcion() {
        return this.descripcion;
    }
    
    public void Apero.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public Usuario Apero.getUsuario() {
        return this.usuario;
    }
    
    public void Apero.setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public Tarea Apero.getTarea() {
        return this.tarea;
    }
    
    public void Apero.setTarea(Tarea tarea) {
        this.tarea = tarea;
    }
    
}
