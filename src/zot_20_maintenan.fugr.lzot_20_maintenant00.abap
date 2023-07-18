*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_20_T_MATERIA................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_MATERIA              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_MATERIA              .
CONTROLS: TCTRL_ZOT_20_T_MATERIA
            TYPE TABLEVIEW USING SCREEN '0008'.
*...processing: ZOT_20_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_P_AILE               .
CONTROLS: TCTRL_ZOT_20_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_20_T_P_ATUR.................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_P_ATUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_P_ATUR               .
CONTROLS: TCTRL_ZOT_20_T_P_ATUR
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_20_T_P_ETUR.................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_P_ETUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_P_ETUR               .
CONTROLS: TCTRL_ZOT_20_T_P_ETUR
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_20_T_P_ITUR.................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_P_ITUR               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_P_ITUR               .
CONTROLS: TCTRL_ZOT_20_T_P_ITUR
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_20_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_P_MAST               .
CONTROLS: TCTRL_ZOT_20_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_20_T_TWTABLE................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_TWTABLE              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_TWTABLE              .
CONTROLS: TCTRL_ZOT_20_T_TWTABLE
            TYPE TABLEVIEW USING SCREEN '0006'.
*...processing: ZOT_20_T_ZAMAN..................................*
DATA:  BEGIN OF STATUS_ZOT_20_T_ZAMAN                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_20_T_ZAMAN                .
CONTROLS: TCTRL_ZOT_20_T_ZAMAN
            TYPE TABLEVIEW USING SCREEN '0007'.
*.........table declarations:.................................*
TABLES: *ZOT_20_T_MATERIA              .
TABLES: *ZOT_20_T_P_AILE               .
TABLES: *ZOT_20_T_P_ATUR               .
TABLES: *ZOT_20_T_P_ETUR               .
TABLES: *ZOT_20_T_P_ITUR               .
TABLES: *ZOT_20_T_P_MAST               .
TABLES: *ZOT_20_T_TWTABLE              .
TABLES: *ZOT_20_T_ZAMAN                .
TABLES: ZOT_20_T_MATERIA               .
TABLES: ZOT_20_T_P_AILE                .
TABLES: ZOT_20_T_P_ATUR                .
TABLES: ZOT_20_T_P_ETUR                .
TABLES: ZOT_20_T_P_ITUR                .
TABLES: ZOT_20_T_P_MAST                .
TABLES: ZOT_20_T_TWTABLE               .
TABLES: ZOT_20_T_ZAMAN                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
