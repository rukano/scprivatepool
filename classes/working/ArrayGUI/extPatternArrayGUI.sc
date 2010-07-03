/*
Test Code...

p = Pbind(\degree, Pseq([0,2], inf))
p.play
l = p.patternpairs[1]
l.replaceList([0,1,2])
l.makeArrayGUI(\matrix)

*/


+ ListPattern {

	replaceList { |newList|
		this.list = newList;
		^this
	}
	
/*
	// its a piece of shit! it wont work!!!

	makeArrayGUI { |type, cols, rows, spec|

		// how to replace code? look for the code?
		// hard hard...
		case
			{ type == \sliders } {
				^ArraySliders(this.list.asArray, cols, rows, spec, this)
			}
			{ type == \matrix } {
				^ArrayMatrix(this.list.asArray, cols, rows, spec, this)
			}
			{ ^nil }
	}
*/	
}

+ Pattern {
	// look for pbind, pmono, etc
	// pattern pairs, key
}

