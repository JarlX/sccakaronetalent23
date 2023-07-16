*&---------------------------------------------------------------------*
*& Report zot_20_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_20_p_twitter.

*INCLUDE ZAB_I_DENEME.

DATA: lt_twitter TYPE TABLE OF zot_20_t_twtable,
      ls_twitter TYPE zot_20_t_twtable.


SELECTION-SCREEN BEGIN OF BLOCK block1 WITH FRAME TITLE title001.

  SELECTION-SCREEN BEGIN OF BLOCK block2 WITH FRAME TITLE title002.
    PARAMETERS: post_id TYPE i,
                post    TYPE char80.
  SELECTION-SCREEN END OF BLOCK block2.

  SELECTION-SCREEN BEGIN OF BLOCK block3 WITH FRAME TITLE title003.
    SELECTION-SCREEN:
    PUSHBUTTON 2(10) but1 USER-COMMAND cli1,
    PUSHBUTTON 22(10) but2 USER-COMMAND cli2,
    PUSHBUTTON 42(15) but3 USER-COMMAND cli3,
    PUSHBUTTON 62(25) but4 USER-COMMAND cli4.

  SELECTION-SCREEN END OF BLOCK block3.

SELECTION-SCREEN END OF BLOCK block1.

INITIALIZATION.
  title001 = 'Twitter'.
  title002 = 'Tweet Entry'.
  title003 = 'Aksiyon'.
  but1 = 'Tweet At'.
  but2 = 'Tweet Sil'.
  but3 = 'Tweet Değiştir'.
  but4 = 'Tweetleri Görüntüle '.


**********************************************************************

AT SELECTION-SCREEN.

*START-OF-SELECTION.

  CASE sy-ucomm.
    WHEN 'CLI1'.
     APPEND VALUE #( mandt = sy-mandt
                      tweet_no = post_id
                      tweet_desc = post ) TO lt_twitter.
      INSERT zot_20_t_twtable FROM TABLE lt_twitter.
      COMMIT WORK.

      WHEN 'CLI2'.
      DELETE FROM zot_20_t_twtable
        WHERE tweet_no = post_id.
      COMMIT WORK.

      WHEN 'CLI3'.
      ls_twitter-tweet_no = post_id.
      ls_twitter-tweet_desc = post.
      MODIFY zot_20_t_twtable
        FROM ls_twitter.
      COMMIT WORK.

      WHEN 'CLI4'.
      SELECT *
        FROM zot_20_t_twtable
        INTO TABLE @lt_twitter.
      LOOP AT lt_twitter INTO ls_twitter.
        cl_demo_output=>display( lt_twitter ).
        cl_demo_output=>display(  ).
      ENDLOOP.
  ENDCASE.

  end-OF-SELECTION.
