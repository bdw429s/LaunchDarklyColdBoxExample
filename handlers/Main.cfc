component  {
	property name="LD" inject="LD@LaunchDarklySDK";

	function index( event, rc, prc ) {
		prc.welcomeMessage = LD.variation( 'welcome-message', 'Sup!' );
		event.setView( "main/index" );
	}

	function login( event, rc, prc ) {
		param rc.user='';
		if( rc.user == 'brad' ) {
			session.user = {
				'id' : 5,
				'name' : 'Brad Wood',
				'role' : 'user',
				'email' : 'brad@bradwood.com'
			};
		} else if( rc.user == 'luis' ) {
			session.user = {
				'id' : 10,
				'name' : 'Luis Majano',
				'role' : 'admin',
				'email' : 'lmajano@ortussolutions.com'
			};
		}
		relocate( '' );
	}

	function logout( event, rc, prc ) {
		session.delete( 'user' );		
		relocate( '' );
	}

}
