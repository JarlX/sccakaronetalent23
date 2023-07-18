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


cl_demo_output=>display( gt_material ).

DATA gt_materialunique TYPE HASHED TABLE OF zot_20_t_materia WITH UNIQUE KEY matnr.

gt_materialunique = VALUE #( BASE gt_materialunique (
                                        matnr = '1'
                                         maktx ='İphone'
                                         matkl = 'C'
                                         menge = 1
                                         meins = 'ST')
                                         (
                                         matnr = '2'
                                         maktx = 'Samsung'
                                         matkl = 'C'
                                         menge = 1
                                         meins = 'ST'
                                          )
                                          (
                                          matnr = '3'
                                         maktx = 'Xiaomi'
                                         matkl = 'C'
                                         menge = 1
                                         meins = 'ST' )
                                         (
                                         matnr = '4'
                                         maktx = 'Huawei'
                                         matkl = 'C'
                                         menge = 1
                                         meins = 'ST'
                                          )
                                          (
                                          matnr = '5'
                                         maktx = 'Oppo'
                                         matkl = 'C'
                                         menge = 1
                                         meins = 'ST'
                                           ) ).

LOOP AT gt_material INTO DATA(ls_material).
  READ TABLE gt_materialunique WITH KEY meins = ls_material-meins TRANSPORTING NO FIELDS.
      IF sy-subrc = 0.
        ls_material-menge += 10.
      ENDIF.
  MODIFY gt_material FROM ls_material TRANSPORTING menge.
ENDLOOP.


DATA gt_materialcon TYPE TABLE OF zot_20_t_materia.
APPEND LINES OF gt_material  TO gt_materialcon.
APPEND LINES OF gt_materialunique TO gt_materialcon.



cl_demo_output=>display( gt_materialcon ).
