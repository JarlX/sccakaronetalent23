*&---------------------------------------------------------------------*
*& Report zot_20_p_fibonachi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_fibonachi.

DATA:
  gv_ilk    TYPE i VALUE 0,
  gv_ikinci TYPE i VALUE 1,
  gv_toplam TYPE i,
  gv_sayici TYPE i.

SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE t1 .
  PARAMETERS: gv_max  TYPE i,
              gv_krlm TYPE n.


  WHILE gv_toplam < gv_max.
    gv_toplam = gv_ilk + gv_ikinci.
    gv_ilk = gv_ikinci.
    gv_ikinci = gv_toplam.
    IF gv_toplam > gv_max.
      EXIT.
    ELSE.
      WRITE gv_toplam.
    ENDIF.
    gv_sayici += 1.
    IF gv_sayici MOD gv_krlm EQ 0.
      WRITE /.
    ENDIF.


  ENDWHILE.

SELECTION-SCREEN END OF BLOCK block1.

INITIALIZATION.
  t1 = 'FIBONACHI'.
