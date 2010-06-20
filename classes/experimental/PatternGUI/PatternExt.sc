/*

This is just an attempt to make livecoding easier when fooling around wih list patterns
I know it's not well programmed, too much restrictions, etc... but it's for my private use and it approaches the way I would like to change things on the go.
At the moment it only changes the list in some list patterns and the string to array conversion is'nt good either.
It is just the beginning. The idea would be to build grids or sequencers for this lists, and modifythem via gui and then change them back to the pattern.
Experimental, and work in progress...

r

*/

// Replace list in Pattern

+ Pseq {
	changeList { |list|
		this.list = list;
		^this
	}
}

+ Pshuf {
	changeList { |list|
		this.list = list;
		^this
	}	
}

+ Prand {
	changeList { |list|
		this.list = list;
		^this
	}	
}

+ Pxrand {
	changeList { |list|
		this.list = list;
		^this
	}	
}

// Replace from existing Pattern

+ Pattern {
	
	checkForClass {
		(
			( this.class == Pbind ) or:
			( this.class == Pmono ) or:
			( this.class == PmonoArtic )
		).if { ^true } { ^false	}
	}

	checkForPattern {
		(
			( this.class == Pseq ) or:
			( this.class == Pshuf ) or:
			( this.class == Prand ) or:
			( this.class == Pxrand )
		).if { ^true } { ^false	}
	}
	
	changeListForKey { |key, list|
		var keyIndex, pattern;
		( this.checkForClass ).if {
			keyIndex = this.patternpairs.indexOf(key);
			pattern = this.patternpairs[keyIndex+1];
			( pattern.checkForPattern ).if {
				this.patternpairs[keyIndex+1].changeList(list);
			} {
				"Can only change the list of Pseq, Pshuf, Prand and Pxrand at the moment".error;			};
		} {
			"Can only change in Pbind, Pmono, and PmonoArtic".error;		}
	}
}




