component {

	function configure() {

		coldbox = {
			appName : 'LaunchDarkly ColdBox Example App',
			reinitPassword : '',
			customErrorTemplate : '/coldbox/system/exceptions/Whoops.cfm'

		};

		moduleSettings = {
			'LaunchDarklySDK' : {
				SDKKey : getSystemSetting( 'SDKKey', '' ),
				userProvider : ()=>{
					if( session.keyExists( 'user' ) ) {
						return {
							key : session.user.id,
							name : session.user.name,
							role : session.user.role,
							email : session.user.email
						};
					} else {
						// Anonymous
						return {};
					}
				},
				datasource : {
					// Comment out the next three lines and provide an SDKKey env var to hook this 
					// sample app up to your own LaunchDarkly account intead of the JSON data.
					// You will need to re-create the same flags and variations for the app to work
					type : 'fileData',
					fileDataPaths : expandPath( '/config/flag-data.json' ),
					fileDataAutoUpdate : true
				} 
			}
		};

	}

}
