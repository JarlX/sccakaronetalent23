*&---------------------------------------------------------------------*
*& Report zot_20_p_sirali
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_sirali.

DATA: a TYPE i.


SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE t1.
  PARAMETERS: gv_max  TYPE i,
              gv_krlm TYPE n.

SELECTION-SCREEN END OF BLOCK block1.

START-OF-SELECTION.


  DO gv_max TIMES.
    a += 1.
    WRITE : a.
    IF a MOD gv_krlm EQ 0.
      WRITE: /.
    ENDIF.
  ENDDO.




END-OF-SELECTION.
