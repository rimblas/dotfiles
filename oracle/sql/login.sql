set termout off
set sqlprompt "_user'@'_connect_identifier> "
-- set sqlprompt "@|green SQL>|@@|white _user'|@@|green @|@@|white _connect_identifier  |@"
-- set sqlprompt "_user'@'_connect_identifier  "
-- set sqlprompt "@|green SQL>|@@|white _user'|@@|green @|@@|white _connect_identifier> |@"
set sqlformat ansiconsole
set pagesize 25
col created_by format a10
col updated_by format a10
col last_updated_by format a10
col last_updated_on format a10
alter session set NLS_DATE_FORMAT='DD-MON-YYYY HH:MI:SS AM';
script sqlprompt.js
script SetSchema.js
set termout on
