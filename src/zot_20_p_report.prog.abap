*&---------------------------------------------------------------------*
*& Report zot_20_p_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_report.

DATA: gv_matkl TYPE ekpo-matkl,
      gv_ebeln TYPE ekpo-ebeln,
      gv_bnfpo TYPE eban-bnfpo,
      gv_banfn TYPE eban-banfn.



SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE text001.

  SELECT-OPTIONS: sbnfpo FOR gv_bnfpo,
                  sbanfn FOR gv_banfn.

SELECTION-SCREEN END OF BLOCK block1.

SELECTION-SCREEN BEGIN OF BLOCK block2 WITH FRAME TITLE text002.

  SELECT-OPTIONS: smatkl FOR gv_matkl,
                  sebeln FOR gv_ebeln.

SELECTION-SCREEN END OF BLOCK block2.

SELECTION-SCREEN BEGIN OF BLOCK block3 WITH FRAME TITLE text003.

  PARAMETERS: satbtn RADIOBUTTON GROUP btns USER-COMMAND uc,
              sasbtn RADIOBUTTON GROUP btns.


SELECTION-SCREEN END OF BLOCK block3.


SELECT eban~matnr,
       eban~menge,
       eban~meins,
       eban~banfn,
       eban~bnfpo FROM eban INNER JOIN ekpo
       ON eban~banfn = ekpo~banfn AND eban~bnfpo = ekpo~bnfpo
       WHERE eban~banfn IN @sbanfn AND eban~bnfpo IN @sbnfpo
       INTO TABLE @DATA(lt_eban).

*LOOP AT lt_eban INTO  DATA(ls_eban).
*    IF ls_eban-menge < 10.
*         ls_eban-color = 'C511'.
*        MODIFY lt_eban FROM ls_eban.
*    ENDIF.
*ENDLOOP.



SELECT ekpo~matnr,
       ekpo~menge,
       ekpo~meins,
       ekpo~matkl,
       ekpo~ebeln FROM ekpo INNER JOIN eban
       ON ekpo~banfn = eban~banfn AND ekpo~bnfpo = eban~bnfpo
       WHERE ekpo~matkl IN @smatkl AND ekpo~ebeln IN @sebeln
       INTO TABLE @DATA(lt_ekpo).

START-OF-SELECTION.

  IF satbtn EQ abap_true.
    DATA(lt_sat) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR' seltext_m = 'Malzeme NO' )
                                            ( fieldname = 'MENGE' seltext_m = 'SAT Miktar' )
                                            ( fieldname = 'MEINS' seltext_m = 'Ölçü Miktar' )
                                            ( fieldname = 'BANFN' seltext_m = 'SAT NO' )
                                            ( fieldname = 'BNFPO' seltext_m = 'SAT Kalem NO' )
                                             ).
    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sat
      TABLES
        t_outtab           = lt_eban.


  ELSEIF sasbtn EQ abap_true.

    DATA(lt_sas) = VALUE slis_t_fieldcat_alv( ( fieldname = 'MATNR' seltext_m = 'Malzeme NO' )
                                             ( fieldname = 'MENGE' seltext_m = 'SAT Miktar' )
                                             ( fieldname = 'MEINS' seltext_m = 'Ölçü Miktar' )
                                             ( fieldname = 'MATKL' seltext_m = 'Malzeme Grubu' )
                                             ( fieldname = 'EBELN' seltext_m = 'Satın Alma Belge NO' )
                                              ).

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program = sy-repid
        it_fieldcat        = lt_sas
      TABLES
        t_outtab           = lt_ekpo.

  ENDIF.


AT SELECTION-SCREEN OUTPUT.
  IF satbtn = abap_true.
    LOOP AT SCREEN.
          screen-active = '0'.
          screen-invisible = '1'.
          MODIFY SCREEN.
    ENDLOOP.
  ELSEIF sasbtn = abap_true.
    LOOP AT SCREEN.
      CASE screen-group1.
        WHEN 'BLOCK1'.
          screen-active = '0'.
          screen-invisible = '1'.
          MODIFY SCREEN.
      ENDCASE.
    ENDLOOP.
  ENDIF.
