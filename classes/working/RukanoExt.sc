+ SimpleNumber {
	
	midirange { |lo=0,hi=1|
		^this.linlin(0,127,lo,hi)
	}

	ccrange { |lo=0,hi=1|
		^this.midirange(lo,hi)
	}
	
	// TODO: xrange !!	

}