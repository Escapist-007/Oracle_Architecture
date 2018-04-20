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


                                   /*   #########   STATIC VIEW DEMO   ##########  */

/* 
   Static views contain information about various database objects (ex: tables, procedures, privileges, users, indexes,     functions, sysnonyms etc.).
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



   SHOW USER;  -- Make sure the user has SELECT_CATALOG_ROLE role in order to query from the 'DBA_' views
  
  -- All the tables owned (created) by the current user     ###### USER_ #####
  
   DESC USER_TABLES;
   
   SELECT
      TABLE_NAME,
      TABLESPACE_NAME,
      STATUS,
      INSTANCES
   FROM
      USER_TABLES;

  -- All the tables owned (created) by the current user + the tables on which the current user has privileges.  ###### ALL_ #####
  
    DESC ALL_TABLES;
  
    SELECT
       OWNER, 
       TABLE_NAME,
       TABLESPACE_NAME,
       STATUS,
       INSTANCES
    FROM
       ALL_TABLES;
    
    -- See tables from a specific tablespace 
    
    SELECT
       OWNER, 
       TABLE_NAME,
       TABLESPACE_NAME,
       STATUS,
       INSTANCES
    FROM
       ALL_TABLES
    WHERE TABLESPACE_NAME  = 'USERS';

  -- All tables in the Database.  [Need SELECT_CATALOG_ROLE role]       ###### DBA_ #####
  
   DESC DBA_TABLES;

   SELECT
     OWNER, 
     TABLE_NAME,
     TABLESPACE_NAME,
     STATUS,
     INSTANCES
   FROM
     DBA_TABLES;
     
     --            ######         COMMON DBA_ VIEWS        #####
     
  --- List all the USERS in the database
  
    DESC DBA_USERS;
    
    SELECT
      USERNAME,
      USER_ID, 
      PASSWORD,       -- null / encrypted
      ACCOUNT_STATUS, -- user is locked or open
      LOCK_DATE,
      EXPIRY_DATE,
      DEFAULT_TABLESPACE
   FROM 
      DBA_USERS;

   -- Checking the blocksize of all tablespaces (Important)
  
   DESC DBA_TABLESPACES;
   
   SELECT
     TABLESPACE_NAME,
     BLOCK_SIZE
   FROM
      DBA_TABLESPACES;  
    
   SELECT
     FILE_NAME 
   FROM
     DBA_DATA_FILES;


                            /*   #########   DYNAMIC VIEW DEMO   ##########   */

/*
   Dynamic performance views contain about current sessions, database, transactions, logs etc. These views are updated at startup time. They are continually updated during the life of a instance.
   
   Example: V$PARAMETER, 
            V$DATABASE (info about database name, id, archive_log_mode etc.), 
            V$INSTANCE, V$SESSION, V$LOCK, V$TRANSACTION, 
            V$LOGFILE (info about online REDO log files),
            V$LOG, V$ARCHIVED_LOG etc.

*/

  DESC V$ARCHIVED_LOG;
  
  SELECT NAME FROM V$ARCHIVED_LOG; -- SHOW ALL THE ARCHIVED REDO LOG FILE

  DESC V$DATABASE;
  
  SELECT           -- SHOW INFO ABOUT THE DATABASE
    DBID,
    NAME,
    OPEN_MODE,
    LOG_MODE,
    DATAGUARD_BROKER,
    GUARD_STATUS
  FROM
    V$DATABASE;
    
  
  DESC V$SESSION

  -- List all the running sessions
  
  SELECT 
    SID, 
    USERNAME 
  FROM 
    V$SESSION;  -- The processes having no username is related to background process 



 -- https://wpollock.com/Oracle/Views.htm  [List of commonly used views]



     /*   #########   MISCELLANEOUS VIEW DEMO   ##########   */
     
/* 
   SESSION_PRIVS --> contains system privileges which are active for current user and session
   
   DICTIONARY  --> contains info about all data dictionary tables and views (***)
   
   DICT_COLUMNS  --> contains info about all columns related to data dictionary tables and views
   
   TABLE_PRIVILEGES --> contains current object privileges for current user and session
*/
