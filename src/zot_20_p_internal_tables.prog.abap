*&---------------------------------------------------------------------*
*& Report zot_20_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_internal_tables.

DATA gt_material TYPE TABLE OF zot_00_t_materia.

SELECT *
        FROM zot_00_t_materia
        INTO TABLE gt_material.


DATA gt_materialunique TYPE SORTED TABLE OF zot_00_t_materia WITH UNIQUE KEY matnr.

gt_materialunique = VALUE #( BASE gt_materialunique (
                                        matnr = '1'
                                         maktx ='İphone'
                                         matkl = 'C'
                                         menge = 20
                                         meins = 'ST')
                                         (
                                         matnr = '2'
                                         maktx = 'Samsung'
                                         matkl = 'C'
                                         menge = 7
                                         meins = 'ST'
                                          )
                                          (
                                         matnr = '3'
                                         maktx = 'Xiaomi'
                                         matkl = 'C'
                                         menge = 15
                                         meins = 'ST' )
                                         (
                                         matnr = '4'
                                         maktx = 'Huawei'
                                         matkl = 'C'
                                         menge = 12
                                         meins = 'ST'
                                          )
                                          (
                                          matnr = '5'
                                         maktx = 'Oppo'
                                         matkl = 'C'
                                         menge = 6
                                         meins = 'ST'
                                           ) ).

LOOP AT gt_material INTO DATA(ls_material).
  READ TABLE gt_materialunique WITH KEY meins = ls_material-meins TRANSPORTING NO FIELDS.
  IF sy-subrc = 0.
    ls_material-menge += 10.
  ENDIF.
  MODIFY gt_material FROM ls_material TRANSPORTING menge.
ENDLOOP.


DATA gt_materialcon TYPE TABLE OF zot_00_t_materia.
APPEND LINES OF gt_material  TO gt_materialcon.
APPEND LINES OF gt_materialunique TO gt_materialcon.


TYPES: BEGIN OF gty_material,
         matkl TYPE zot_00_t_materia-matkl,
         menge TYPE zot_00_t_materia-menge,
       END OF gty_material.

DATA: gt_materialcollect TYPE TABLE OF gty_material,
      gs_materialcollect TYPE gty_material.

LOOP AT gt_materialcon INTO DATA(ls_materialcollect).
  CLEAR gs_materialcollect.
  gs_materialcollect = VALUE #( matkl = ls_materialcollect-matkl menge = ls_materialcollect-menge ).
  COLLECT gs_materialcollect INTO gt_materialcollect.

ENDLOOP.


DELETE gt_materialcon WHERE menge LT 10.

DATA: gt_materialasc TYPE TABLE OF  zot_00_t_materia,
      gt_materialdsc TYPE TABLE OF zot_00_t_materia.



SORT gt_materialcon ASCENDING BY menge.
APPEND LINES OF gt_materialcon TO gt_materialasc.

SORT gt_materialcon DESCENDING By menge.
APPEND LINES OF gt_materialcon TO gt_materialdsc.




cl_demo_output=>display( gt_materialcon ).
cl_demo_output=>display( gt_materialcollect ).
cl_demo_output=>display( gt_materialasc ).
cl_demo_output=>display( gt_materialdsc ).
