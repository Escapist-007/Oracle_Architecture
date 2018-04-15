/*
   Author : Md Moniruzzaman Monir
*/

  /*
    Common questions related to Data Dictionary :
      1. List all the 'users' of the database
      2. What are the currently running sessions in the database?
      3. How much total space is occupied by all the users? 
      etc.
      
    All these info related to database are stored in "Data Dictionary".
    
  */

                                    /*   #########  What is Data Dictionary?  ##########   */
/* 
   'Data Dictionary' is a set of some tables and views which contain information about the database. The tables are called 'Base Tables' which are under the 'SYS' user. There are 1200+ views which are 
    created on top of the base tables. Instead of documenting the base tables oracle has created the views and document them. There are mainly 4 types of views:
       
       1. Static Views          ( Starts with prefix "USER_" / "ALL_" / "DBA_" . ex: USER_TABLES, ALL_TABLES, DBA_TABLES )
       
       2. Dynamic Views         ( Starts with prefix "V$". ex: v$PARAMETER )
       
       3. Global Dynamic Views  ( Starts with prefix "GV$". ex: v$PARAMETER )
       
       4. Undocumented Views    ( ex: X$KSPPI )
       
    Data Dictionary is also called 'METADATA' ( Data about Data )

*/


                                 




