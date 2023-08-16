/*  execute a sql and get the first column of the first row as a return*/
// var dbUser = util.executeReturnOneCol('select sys_context( ''userenv'', ''current_user'' ) from dual');
var dbInstance = util.executeReturnOneCol('select sys_context( \'userenv\', \'service_name\' ) from dual');

/*  based on the connection change my SQL prompt*/
// if ( dbInstance.toUpperCase() == 'APEX_PROD01') {
if ( dbInstance.toUpperCase().indexOf('PROD') !== -1 ) {
 // sqlcl.setStmt('set sqlprompt "🎯 @|INTENSITY_BOLD _user|@@|white @|@@|bg_red _connect_identifier|@@|INTENSITY_BOLD > |@"');
 sqlcl.setStmt('set sqlprompt "SQL>@|INTENSITY_BOLD _user|@@|white @|@@|bg_red _connect_identifier|@@|INTENSITY_BOLD > |@"');
} else if ( dbInstance.toUpperCase().indexOf('UAT') !== -1 ) {
 // sqlcl.setStmt('set sqlprompt "👉 @|white _user|@@|white @|@@|yellow _connect_identifier |@@|white > |@"');
 sqlcl.setStmt('set sqlprompt "SQL>@|white _user|@@|white @|@@|yellow _connect_identifier |@@|white > |@"');
} else {
 sqlcl.setStmt('set sqlprompt "@|green SQL>|@@|white _user|@@|green @|@@|white _connect_identifier> |@"');

}

sqlcl.run();