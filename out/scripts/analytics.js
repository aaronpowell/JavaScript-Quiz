// Google Analytics
if ( typeof _gat !== 'undefined' ) {
	var pageTracker = _gat._getTracker("UA-20152461-3");
	pageTracker._initData();
	if ( Modernizr ) {
		pageTracker._setCustomVar(1, "html5.csstransforms", Modernizr.csstransforms ? "yes" : "no" , 2 );
		pageTracker._setCustomVar(2, "html5.draganddrop", Modernizr.draganddrop ? "yes" : "no", 2 );
		pageTracker._setCustomVar(3, "html5.history", Modernizr.history ? "yes" : "no", 2 );
		pageTracker._setCustomVar(4, "html5.localstorage", Modernizr.localstorage ? "yes" : "no", 2 );
		pageTracker._setCustomVar(5, "html5.flexbox", Modernizr.flexbox ? "yes" : "no", 2 );
	}
	pageTracker._trackPageview();
}

