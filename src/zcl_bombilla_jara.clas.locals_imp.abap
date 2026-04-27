*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_demo_bombilla DEFINITION.
public section.
data:
    ubicacion type string,
    estado type string.

    methods:
     constructor
        IMPORTING i_sitio TYPE string
                  i_estado TYPE string,

         get_estado exportiNG o_estado type string,
         get_ubicacion exporting o_ubicacion type string,

         set_ubicacion importing i_ubicacion type string,

         encender importing i_encend type string,
         apagar importing i_encend type string.

    PROTECTED SECTION.
  PRIVATE SECTION.
endCLASS.

class zcl_demo_bombilla impLEMENTATION.
method constructor.
    ubicacion = i_sitio.
    estado = i_estado.
endmethod.

method get_estado.
    o_estado = estado.
endmethod.
method get_ubicacion.
    o_ubicacion = ubicacion.
endmethod.

method set_Ubicacion.
    ubicacion = i_Ubicacion.
endmethod.

method encender.
    if i_encend = 'encender'.
        Estado = 'encendido'.
    endif.
endmethod.

method apagar.
    if i_encend = 'apagar'.
        Estado = 'apagado'.
    endif.
endmethod.



endCLASS.
