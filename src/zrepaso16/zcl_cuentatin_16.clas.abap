CLASS zcl_cuentatin_16 DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_swipeable16 .
    DATA mv_nombre           TYPE string.
    DATA mv_swipes_realizados TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cuentatin_16 IMPLEMENTATION.


  METHOD zif_swipeable16~hacer_swipe.
  ENDMETHOD.
ENDCLASS.
