<!--- very important make sure they logged in! --->
<cfinclude template="login-check.cfm">
<div class="pull-right">
	<cfif session.isAdmin>
		<a href="admin/" class="btn btn-danger btn-large">Bank Admin</a>
	</cfif>
	<a href="profile.cfm" class="btn btn-default btn-large">Profile</a>
	<a href="logout.cfm" class="btn btn-default btn-large">Logout</a>
</div>


<h1>Unprotected XSS <cfoutput>#session.username#</cfoutput></h1> \
<h1>Protected XSS using Format method <cfoutput>#htmlcodeformat(session.username)#</cfoutput></h1>
<h1>Protected XSS using Encode method<cfoutput>#EncodeForHTML(session.username)#</cfoutput></h1>
<h1>Made up or customs method.  Should flag as an unprotected XSS<cfoutput>#madeupEncodeTheHTML(session.username)#</cfoutput></h1>
<cfquery name="user">SELECT balance FROM users WHERE id = #session.userID#</cfquery>
<div class="lead">Your current account balance is: <strong><cfoutput>#dollarFormat(user.balance)#</cfoutput></strong></div>
<h3>Key A717-0123-4567-8901 Secret J123-4034-FD65-4C-# </h3>
<h3>SSN 264-35-0975 </h3>
<h3>MasterCard 5123450000000008 </h3>
<h3>MasterCard Formatted 5123-4500-0000-0008 </h3>