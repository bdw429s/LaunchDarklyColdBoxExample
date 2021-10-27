component  {
	property name="LD" inject="LD@LaunchDarklySDK";

	function index( event, rc, prc ) {

		// Generate 1000 random users
		prc.user = {
			"Key" : "User #randrange( 1, 1000 )#"
		};

		var viewName = LD.variation( 'product-page', 'index', prc.user );
		event.setView( "products/#viewName#" );

		/*
		* SIMULATE USER RESPONSE TO VARIATIONS
		*/

		// Original page generates $45-$55 
		prc.dollarsSold = 50 + randrange( -5, 5 );
		// Begging page reduces sales by up to 75%
		if( viewName == 'beg' ) {
			prc.dollarsSold -= prc.dollarsSold * ( randrange( 1, 75 )/100 )
		}
		// puppy page increases sales by up to 75%
		if( viewName == 'puppy' ) {
			prc.dollarsSold += prc.dollarsSold * ( randrange( 1, 75 )/100 )
		}

		LD.track( eventName='Dollars Sold', metricValue=prc.dollarsSold, user=prc.user );

	}

}
