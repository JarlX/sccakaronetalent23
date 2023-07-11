*&---------------------------------------------------------------------*
*& Report zot_20_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_calculator.

DATA:p_total TYPE i.


SELECTION-SCREEN BEGIN OF BLOCK block1  WITH FRAME TITLE title001.
  PARAMETERS: p_val1 TYPE i,
              p_val2 TYPE i.

SELECTION-SCREEN END OF BLOCK block1.



SELECTION-SCREEN BEGIN OF BLOCK block2  WITH FRAME TITLE title002.

  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
              p_cikar RADIOBUTTON GROUP g1,
              p_carp  RADIOBUTTON GROUP g1,
              p_bol   RADIOBUTTON GROUP g1.


SELECTION-SCREEN END OF BLOCK block2.

INITIALIZATION.
  title001 = 'HESAP MAKİNESİ'.
  title002 = 'İŞLEMLER'.

START-OF-SELECTION.

  CASE 'X'.
    WHEN p_topla.
    p_total = p_val1 + p_val2.
    WHEN
        p_cikar. p_total = p_val1 - p_val2.
    WHEN
        p_carp.  p_total = p_val1 * p_val2.
    WHEN
         p_bol.
        TRY.
           p_total = p_val1 / p_val2.
        CATCH cx_sy_zerodivide.
            cl_demo_output=>write( |Sıfıra bölme yapılamaz!| ).
ENDTRY.
  ENDCASE.

  cl_demo_output=>write( p_total ).
  cl_demo_output=>display(  ).

END-OF-SELECTION.
