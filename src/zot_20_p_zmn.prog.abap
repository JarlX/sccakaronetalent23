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

  DATA: lv_tarih1     TYPE dats,
        lv_tarih2     TYPE dats,
        lv_tarih_fark TYPE i,
        lv_saat_fark  TYPE i,
        lv_yil        TYPE i,
        lv_ay         TYPE i,
        lv_gun        TYPE i,
        lv_saat       TYPE i,
        lv_dk         TYPE i,
        lv_sn         TYPE i,
        lv_bool       TYPE boolean.

  LOOP AT lt_zaman INTO ls_zaman.


    lv_tarih1 = ls_zaman-ilktarih.
    lv_tarih2 = ls_zaman-sontarih.
    DATA(lv_saat1) = ls_zaman-ilksaat.
    DATA(lv_saat2) = ls_zaman-sonsaat.
    lv_bool = abap_false.

    lv_tarih_fark = lv_tarih2 - lv_tarih1.
    lv_saat_fark = lv_saat2 - lv_saat1.


    IF lv_tarih1 > lv_tarih2.
      lv_bool = abap_true.
      WRITE: | { ls_zaman-id }) |.
      WRITE: 'Birinci tarih ikinci tarihten sonra olamaz' color 3.
      WRITE :/.

    ELSEIF lv_saat1 > lv_saat2 AND lv_tarih1 EQ lv_tarih2.
      lv_bool = abap_true.
      WRITE: | { ls_zaman-id }) |.
      WRITE: 'Birinci saat ikincisinden sonra olamaz' color 3.
      WRITE :/.


    ELSEIF lv_tarih1 = lv_tarih2 AND lv_saat1 = lv_saat2.
      lv_bool = abap_true.
      WRITE: | { ls_zaman-id }) |.
      WRITE: 'Aynı Tarih!' color 3.
      WRITE :/.

    ELSE.

      IF lv_saat1 > lv_saat2.
        lv_tarih_fark = lv_tarih_fark - 1.
        lv_saat_fark = 86400 - lv_saat1 + lv_saat2.

        lv_yil = lv_tarih_fark DIV 365.
        lv_tarih_fark = lv_tarih_fark MOD 365.
        lv_ay = lv_tarih_fark DIV 30.
        lv_tarih_fark = lv_tarih_fark MOD 365.
        lv_gun = lv_tarih_fark MOD 30.

        lv_sn = lv_saat_fark MOD 60.
        lv_dk = lv_saat_fark / 60 MOD 60.
        lv_saat = lv_saat_fark / 3600.

        WRITE: | { ls_zaman-id }) |.
        WRITE:  COND #( WHEN lv_yil NE 0 THEN |{ lv_yil } YIL| ELSE '0 YIL' ),
          COND #( WHEN lv_ay NE 0 THEN |{ lv_ay } AY| ELSE '0 AY' ),
          COND #( WHEN lv_gun NE 0 THEN |{ lv_gun } GUN| ELSE '0 GÜN' ),
          COND #( WHEN lv_saat NE 0  THEN |{ lv_saat } SAAT| ELSE '0 SAAT' ),
          COND #( WHEN lv_dk NE 0  THEN |{ lv_dk } DAKIKA| ELSE '0 DAKİKA' ),
          COND #( WHEN lv_sn NE 0  THEN |{ lv_sn } SANIYE | ELSE '0 SANİYE' ).
          WRITE: /.

      ELSE.
        lv_saat_fark = lv_saat2 - lv_saat1.

        lv_yil = lv_tarih_fark DIV 365.
        lv_tarih_fark = lv_tarih_fark MOD 365.
        lv_ay = lv_tarih_fark DIV 30.
        lv_tarih_fark = lv_tarih_fark MOD 365.
        lv_gun = lv_tarih_fark MOD 30.

        lv_sn = lv_saat_fark MOD 60.
        lv_dk = lv_saat_fark / 60 MOD 60.
        lv_saat = lv_saat_fark / 3600.

        WRITE: | { ls_zaman-id }) |.
        WRITE:  COND #( WHEN lv_yil NE 0 AND lv_bool EQ abap_false THEN |{ lv_yil } YIL| ELSE '0 YIL' ),
           COND #( WHEN lv_ay NE 0 AND lv_bool EQ abap_false THEN |{ lv_ay } AY| ELSE '0 AY' ),
           COND #( WHEN lv_gun NE 0 AND lv_bool EQ abap_false THEN |{ lv_gun } GUN| ELSE '0 GÜN' ),
           COND #( WHEN lv_saat NE 0 AND lv_bool EQ abap_false THEN |{ lv_saat } SAAT| ELSE '0 SAAT' ),
           COND #( WHEN lv_dk NE 0 AND lv_bool EQ abap_false THEN |{ lv_dk } DAKIKA| ELSE '0 DAKİKA' ),
           COND #( WHEN lv_sn NE 0 AND lv_bool EQ abap_false THEN |{ lv_sn } SANIYE | ELSE '0 SANİYE' ).
        WRITE : /.


      ENDIF.

    ENDIF.

  ENDLOOP.

END-OF-SELECTION.
