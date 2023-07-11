*&---------------------------------------------------------------------*
*& Report zot_20_data_objects
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_data_objects.

DATA: gv_ogrenci_adi TYPE c LENGTH 10,
      gv_ogrenci_soyadi TYPE char12,
      gv_tarih TYPE sy-datum.

gv_ogrenci_adi = 'Salih Can'.
gv_ogrenci_soyadi = 'Çakar'.
gv_tarih = sy-datum.

CL_DEMO_OUTPUT=>WRITE( gv_ogrenci_adi ).
CL_DEMO_OUTPUT=>WRITE( gv_ogrenci_soyadi ).
CL_DEMO_OUTPUT=>WRITE( gv_tarih ).

CL_DEMO_OUTPUT=>DISPLAY( |Öğrencinin Adı: { gv_ogrenci_adi }| ).

TYPES: gty_char TYPE c LENGTH 50.

DATA: gv_new TYPE gty_char.


*IF
DATA : gv_langu TYPE sy-langu.
       gv_langu = sy-langu.

       if gv_langu = 'T'.
        CL_DEMO_OUTPUT=>WRITE( 'BU DİL TÜRKÇEDİR' ).
       elseif gv_langu EQ 'E'.
       CL_DEMO_OUTPUT=>WRITE( 'BU DİL İNGİLİZCE' ).
       else.
       CL_DEMO_OUTPUT=>WRITE( 'BAŞKA BİR DİL' ).
       endif.

       CL_DEMO_OUTPUT=>DISPLAY(  ).


*SWTICH

CASE gv_langu.
    WHEN 'T'.
        CL_DEMO_OUTPUT=>WRITE( 'BU DİL TÜRKÇE-2' ).
    WHEN 'E'.
        CL_DEMO_OUTPUT=>WRITE( 'BU DİL İNGİLİZCE-2' ).
    WHEN OTHERS.
        CL_DEMO_OUTPUT=>WRITE( 'BİLİNMEYEN BİR DİL' ).
ENDCASE.

    CL_DEMO_OUTPUT=>DISPLAY(  ).









*WHILE











************************************************************************

DATA: lv_number1 TYPE i,
      lv_number2 TYPE i,
      lv_number3 TYPE i,
      lv_number4 TYPE i,
      lv_number5 TYPE i,
      lv_number6 TYPE i.

      lv_number1 = 14.
      lv_number2 = 10.
      lv_number3 = lv_number1 + lv_number2.
      lv_number4 = lv_number1 - lv_number2.
      lv_number5 = lv_number1 * lv_number2.
      lv_number6 = lv_number1 / lv_number2.

CL_DEMO_OUTPUT=>WRITE( |"TOPLAMA": { lv_number3 }| ).
CL_DEMO_OUTPUT=>WRITE( |"FARK": { lv_number4 }| ).
CL_DEMO_OUTPUT=>WRITE( |"ÇARPMA": { lv_number5 }| ).
CL_DEMO_OUTPUT=>WRITE( |"BÖLME": { lv_number6 }| ).

CL_DEMO_OUTPUT=>DISPLAY(  ).
