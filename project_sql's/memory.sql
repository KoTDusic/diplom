select distinct username from dba_users
alter session set "_oracle_script"=true;
drop user APEX_040200 cascade
select * from dba_tablespaces
select * from dba_users
drop user APEX_PUBLIC_USER cascade
ALTER USER xdb ACCOUNT UNLOCK;
ALTER USER apex_public_user ACCOUNT UNLOCK;
ALTER USER flows_files ACCOUNT UNLOCK;


select * from PDB_PLUG_IN_VIOLATIONS order by 1;  
select message,time from pdb_plug_in_violations;
//запуск pdb
ALTER PLUGGABLE DATABASE pdborcl open;

//удаление dbf файла оффлайн
alter database datafile 16 OFFLINE DROP;

execute dbms_epg.set_global_attribute('log-level',3);
alter user APEX_050000 account unlock;
select * from dba_users

SELECT TABLESPACE_NAME,STATUS, CONTENTS, LOGGING FROM SYS.DBA_TABLESPACES;

select * from DBA_DATA_FILES
-- where username='U1_PDW_PDB'
select * from dba_USERS
select * from dba_ts_quotas;
select * from dba_sys_privs where grantee='APEX_050000';
grant all privileges to ANONYMOUS with admin option 
grant all privileges to APEX_050000 with admin option 
grant all privileges to flows_files with admin option 
grant CREATE TABLESPACE to xdb;
grant CREATE TABLESPACE to apex_public_user;
grant CREATE TABLESPACE to flows_files;

alter user xdb account unlock;
alter user ANONYMOUS account unlock;
alter user apex_public_user account unlock;
alter user flows_files account unlock;

select * from dba_roles
grant APEX_ADMINISTRATOR_ROLE to APEX_040200
grant APEX_ADMINISTRATOR_ROLE to xdb;
grant APEX_ADMINISTRATOR_ROLE to apex_public_user;
grant APEX_ADMINISTRATOR_ROLE to flows_files;
select *
from dba_sys_privs
where grantee = 'ANONYMOUS'

select * from APEX_WORKSPACE_ACCESS_LOG

SELECT *
  FROM apex_dictionary
 WHERE column_id = 0
   AND apex_view_name LIKE '%LOG%'

select * from APEX_050000.WWV_FLOW_PROVISION_COMPANY ;
            select * from  APEX_050000.WWV_FLOW_COMPANIES;
            
            delete from APEX_050000.WWV_FLOW_PROVISION_COMPANY where company_name='PDW_SITE';
            
            
            

            
          select * from APEX_050000.WWV_FLOW_API