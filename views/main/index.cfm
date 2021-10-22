<cfoutput>
<div class="jumbotron mt-sm-5 p-4">
	<div class="row">
		<div class="col-lg-5 col-md-6">
			<p class="text-center">
				<cfif getInstance( 'LD@LaunchDarklySDK' ).variation( 'activate-cool', false ) >
					<img src="includes/images/funny-cat.jpeg" height="300" class="m-2 mt-2" alt="logo"/>
				<cfelse>
					<img src="includes/images/ColdBoxLogo2015_300.png" class="m-2 mt-2" alt="logo"/>
				</cfif>
				<a class="btn btn-primary" href="https://coldbox.ortusbooks.com" target="_blank" title="Read our ColdBox Manual" rel="tooltip">
					<strong><i class="fab fa-readme"></i> Read The Docs!</strong>
				</a>
			</p>
		</div>

		<div class="col-lg-7 col-md-6">
			<h1 class="display-3">
				#prc.welcomeMessage#
			</h1>
			<div class="badge badge-info mb-2">
				<strong>#getColdBoxSetting( "version" )# (#getColdBoxSetting( "suffix" )#)</strong>
			</div>
			<p class="lead">
				Welcome to modern ColdFusion (CFML) development.  You can now start building your application with ease, we already did the hard work
				for you.
			</p>
		</div>
	</div>
</div>

<cfif session.keyExists( 'user' ) >
	<h2>Logged in as #session.user.name#</h2>
<cfelse>
	<h2>Not Logged in</h2>
</cfif>

<a href="#event.buildLink( 'main.login', 'user=brad' )#">Login as Brad</a><br>
<a href="#event.buildLink( 'main.login', 'user=luis' )#">Login as Luis</a><br>
<a href="#event.buildLink( 'main.logout' )#">Logout</a><br>


<h2>Experimental Features</h2>
<cfset data = getInstance( 'LD@LaunchDarklySDK' ).variationDetail( 'experimental-features', {} )>
<cfdump var="#data.value#">
Variation #data.variationIndex# was chosen because: #data.reason.detail#


</cfoutput>