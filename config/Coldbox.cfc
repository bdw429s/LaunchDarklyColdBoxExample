component {

	function configure() {

		coldbox = {
			appName : 'LaunchDarkly ColdBox Example App',
			reinitPassword : ''

		};

		moduleSettings = {
			'LaunchDarklySDK' : {
				SDKKey : getSystemSetting( 'SDKKey' ),
				userProvider=()=>{
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
				}
			}
		};

	}

}
