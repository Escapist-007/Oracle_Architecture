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


                                   /*   #########   STATIC VIEW DEMO   ##########   */

/* 
   Static views contain information about various database objects (ex: tables, procedures, privileges, users, indexes, functions, sysnonyms etc.).
   Contents of these views are changed by DDL operation, ex: If the structure of any object is changed like a table is dropped or a column is added etc.
   3 types of static views :
   
   1. USER_ 
        Display only the information about current user objects. Ex: USER_TABLES
  
   2. ALL_
        Display information about current user objects and other objects the user has privileges on. Ex: ALL_TABLES
  
   3. DBA_
        Display information about all user objects. ( Should have a SELECT_CATALOG_ROLE role ). 
        
        Ex: DBA_TABLES, DBA_TAB_COLUMNS, DBA_CONSTRAINTS, DBA_INDEXES (Important to see all the indexes), DBA_TABLESPACES, DBA_DATA_FILES, DBA_OBJECTS, DBA_SEGMENTS, DBA_EXTENTS, DBA_VIEWS,
        DBA_SYNONYMS, DBA_FREE_SPACE, DBA_TRIGGERS, DBA_SYS_PRIVS, DBA_TAB_PRIVS etc.
*/










































