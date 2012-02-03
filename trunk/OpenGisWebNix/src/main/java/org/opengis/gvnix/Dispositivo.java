package org.opengis.gvnix;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooEntity(identifierColumn = "idDispositivo")
public class Dispositivo {

    @NotNull
    private String modelo;

    @NotNull
    @Size(max = 20)
    private String numserie;

    private Boolean disponible;

    private Boolean activo;
}
