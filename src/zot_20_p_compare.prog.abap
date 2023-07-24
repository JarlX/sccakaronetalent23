*&---------------------------------------------------------------------*
*& Report zot_20_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_data1 TYPE char6,
              p_data2 TYPE char6,
              p_data3 TYPE char6,
              p_data4 TYPE char6,
              p_data5 TYPE char6.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA gt_term TYPE TABLE OF char6.
  DATA gt_last TYPE char6.
  DATA gt_same TYPE TABLE OF char6.
  DATA gt_diff TYPE TABLE OF char6.

  APPEND p_data1 TO gt_term.
  APPEND p_data2 TO gt_term.
  APPEND p_data3 TO gt_term.
  APPEND p_data4 TO gt_term.
  APPEND p_data5 TO gt_term.

 SORT gt_term ASCENDING.

  LOOP AT gt_term INTO DATA(ls_term).

    IF gt_last IS INITIAL.
      gt_last = ls_term.
    ELSE.
      IF ls_term CO gt_last.
        APPEND ls_term TO gt_diff.
      ELSE.
        APPEND ls_term TO gt_same.
      ENDIF.
      gt_last = ls_term.
    ENDIF.

  ENDLOOP.


FIND p_data1 IN P_data2.
IF sy-subrc <> 0.
WRITE: 'Succes'.

ENDIF.


  cl_demo_output=>write( gt_last ).
  cl_demo_output=>write( gt_diff ).
  cl_demo_output=>display(  ).
