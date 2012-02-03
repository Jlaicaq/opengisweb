package org.opengis.gvnix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import javax.validation.constraints.Max;
import java.util.Set;
import org.opengis.gvnix.Usuario;
import java.util.HashSet;
import javax.persistence.ManyToMany;
import javax.persistence.CascadeType;
import org.opengis.gvnix.domain.enumerated.Tarea;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idapero", identifierType = Integer.class)
public class Apero {

    @NotNull
    @Size(min = 1, max = 15)
    private String nombre;

    @NotNull
    @Min(1L)
    @Max(10L)
    private Integer tamanyo;

    @Size(min = 0, max = 100)
    private String descripcion;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "Dni")
    private Set<Usuario> dni = new HashSet<Usuario>();

    @Enumerated(EnumType.STRING)
    private Tarea tarea;
}