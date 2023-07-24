*&---------------------------------------------------------------------*
*& Report zot_20_p_ogr_not
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_ogr_not.


DATA(lt_ogr) = VALUE zot_20_tt_ogr_not( (  ogrenci_id = '001'
                                           ogrenci_ad = 'Salih Can Çakar'
                                           dog_tarihi = '01.01.1111'
                                           ogr_bolumu = 'EEM'

                                           ogr_notlar = VALUE zot_20_s_sinif(
                                           sinif1 = VALUE zot_20_s_ders(
                                           ders1 = VALUE zot_20_s_not(
                                           vize1 = 50 vize2 = 60 final = 70 butunleme = 60 ) ) )
                                       ) ).
cl_demo_output=>display( lt_ogr ).
