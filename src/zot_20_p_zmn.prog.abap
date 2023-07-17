*&---------------------------------------------------------------------*
*& Report zot_20_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_zmn.


DATA: lt_zaman TYPE TABLE OF zot_20_t_zaman,
      ls_zaman TYPE zot_20_t_zaman.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  SELECT-OPTIONS id2 FOR ls_zaman-id.

SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  SELECT *
           INTO TABLE lt_zaman
           FROM zot_20_t_zaman
           WHERE id IN id2.

  LOOP AT lt_zaman INTO ls_zaman.

    DATA: gv_tarih1     TYPE dats,
          gv_tarih2     TYPE dats,
          gv_tarih_fark TYPE i,
          gv_saat_fark  TYPE i,
          gv_yil        TYPE i,
          gv_ay         TYPE i,
          gv_gun        TYPE i,
          gv_saat       TYPE i,
          gv_dk         TYPE i,
          gv_sn         TYPE i.



    gv_tarih1 = ls_zaman-ilktarih.
    gv_tarih2 = ls_zaman-sontarih.
    DATA(gv_saat1) = ls_zaman-ilksaat.
    DATA(gv_saat2) = ls_zaman-sonsaat.

    gv_tarih_fark = gv_tarih2 - gv_tarih1.
    gv_saat_fark = gv_saat2 - gv_saat1.


    IF gv_tarih1 > gv_tarih2.
      WRITE: 'Birinci tarih ikinci tarihten sonra olamaz'.

    ELSEIF gv_saat1 > gv_saat2.
      WRITE: 'Birinci saat ikincisinden sonra olamaz'.

    ELSEIF gv_tarih1 = gv_tarih2 AND gv_saat1 = gv_saat2.
      WRITE: 'Aynı Tarih!'.

    ELSE.

      IF gv_saat1 > gv_saat2.
        gv_tarih_fark = gv_tarih_fark - 1.
        gv_saat_fark = 86400 - gv_saat1 + gv_saat2.

      ELSE.
        gv_saat_fark = gv_saat2 - gv_saat1.

      ENDIF.

    ENDIF.

    gv_yil = gv_tarih_fark DIV 365.
    gv_tarih_fark = gv_tarih_fark MOD 365.
    gv_ay = gv_tarih_fark DIV 30.
    gv_tarih_fark = gv_tarih_fark MOD 365.
    gv_gun = gv_tarih_fark MOD 30.

    gv_sn = gv_saat_fark MOD 60.
    gv_dk = gv_saat_fark / 60 MOD 60.
    gv_saat = gv_saat_fark / 3600.


    WRITE: COND #( WHEN gv_yil NE 0 THEN |{ gv_yil } YIL| ELSE '0 YIL' ),
       COND #( WHEN gv_ay NE 0 THEN |{ gv_ay } AY| ELSE '0 AY' ),
       COND #( WHEN gv_gun NE 0 THEN |{ gv_gun } GUN| ELSE '0 GÜN' ),
       COND #( WHEN gv_saat NE 0 THEN |{ gv_saat } SAAT| ELSE '0 SAAT' ),
       COND #( WHEN gv_dk NE 0 THEN |{ gv_dk } DAKIKA| ELSE '0 DAKİKA' ),
       COND #( WHEN gv_sn NE 0 THEN |{ gv_sn } SANIYE | ELSE '0 SANİYE' ).



  ENDLOOP.

END-OF-SELECTION.
