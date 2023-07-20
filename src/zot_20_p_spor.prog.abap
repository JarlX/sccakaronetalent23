*&---------------------------------------------------------------------*
*& Report zot_20_p_spor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_spor.


TYPES: BEGIN OF gty_teams,
         teamid      TYPE zot_20_t_teams-team_id,
         teamname    TYPE zot_20_t_teams-team_name,
         teamcountry TYPE zot_20_t_teams-team_country,
         box         TYPE zot_20_t_teams-box_id,
       END OF gty_teams.

TYPES: BEGIN OF gty_groups,
         group1 TYPE zot_20_t_teams,
         group2 TYPE zot_20_t_teams,
         group3 TYPE zot_20_t_teams,
         group4 TYPE zot_20_t_teams,
       END OF gty_groups.


DATA: lt_team    TYPE TABLE OF gty_teams,
      lt_box     TYPE TABLE OF gty_teams,
      ls_team    TYPE gty_teams,
      lt_grouptb TYPE TABLE OF gty_groups,
      ls_grouptb TYPE gty_groups.


SELECT team_id,team_name,team_country,box_id FROM zot_20_t_teams INTO TABLE @lt_box.

DATA lv_drawno TYPE i.
DATA lv_group_counter TYPE i VALUE 1.

WHILE lines( lt_box ) > 0.
  DO 4 TIMES.
    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_min = 1
        ran_int_max = lines( lt_box )
      IMPORTING
        ran_int     = lv_drawno.

    READ TABLE lt_box INTO ls_team INDEX lv_drawno.
    IF sy-subrc = 0.
      DELETE lt_box INDEX lv_drawno.

      READ TABLE lt_team INTO ls_team WITH KEY teamcountry = ls_team-teamcountry.
      IF sy-subrc NE 0.

        IF sy-index EQ 1.
          READ TABLE lt_grouptb INTO ls_team-teamname WITH KEY group1-box_id = ls_team-box.
          IF sy-subrc NE 0.
            ls_grouptb-group1-team_name = ls_team-teamname.
          ENDIF.
        ELSEIF sy-index EQ 2.
          READ TABLE lt_grouptb INTO ls_team-teamname WITH KEY group2-box_id = ls_team-box.
          IF sy-subrc NE 0.
            ls_grouptb-group2-team_name = ls_team-teamname.
          ENDIF.
        ELSEIF sy-index EQ 3.
          READ TABLE lt_grouptb INTO ls_team-teamname WITH KEY group3-box_id = ls_team-box.
          IF sy-subrc NE 0.
            ls_grouptb-group3-team_name = ls_team-teamname.
          ENDIF.
        ELSEIF sy-index EQ 4.
          READ TABLE lt_grouptb INTO ls_team-teamname WITH KEY group4-box_id = ls_team-box.
          IF sy-subrc NE 0.
            ls_grouptb-group4-team_name = ls_team-teamname.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDDO.
  APPEND ls_grouptb TO lt_grouptb.

  cl_demo_output=>line(  ).
  cl_demo_output=>write( lt_grouptb[ sy-index ]-group1-team_name ).
  cl_demo_output=>write( lt_grouptb[ sy-index ]-group2-team_name ).
  cl_demo_output=>write( lt_grouptb[ sy-index ]-group3-team_name ).
  cl_demo_output=>write( lt_grouptb[ sy-index ]-group4-team_name ).
  cl_demo_output=>line(  ).
ENDWHILE.

*cl_demo_output=>display( lt_grouptb[1] ).





cl_demo_output=>display(  ).
