*&---------------------------------------------------------------------*
*& Report zot_20_p_asal_sayi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_asal_sayi.

DATA: z TYPE i,
      t TYPE i VALUE 2.

SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE t1.
    PARAMETERS: p_min TYPE i,
                p_max TYPE i.



SELECTION-SCREEN END OF BLOCK block1.

START-OF-SELECTION.

WHILE p_min < p_max.
            z = 0.
    WHILE t < p_min.
        IF t MOD p_min EQ 0.
            z += 1.
            WRITE 'ASAL DEĞİL'.
        ENDIF.
    ENDWHILE.
    p_min += 1.
ENDWHILE.

END-OF-SELECTION.
