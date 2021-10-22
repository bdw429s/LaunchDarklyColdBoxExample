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
					type : 'fileData',
					fileDataPaths : expandPath( '/config/flag-data.json' ),
					fileDataAutoUpdate : true
				} 
			}
		};

	}

}
