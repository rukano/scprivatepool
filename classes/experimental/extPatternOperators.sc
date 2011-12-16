+ SimpleNumber {
	
	// usage:
	// 1!!.test(3, \bla);
	
	!! { |number, key = \test|
		[this, number, key].postln;
		^this
	}	
}