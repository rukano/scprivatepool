+ String {

	// normalized ascii
	seqN {
		^( this.ascii/128 )
	}

	// replaces the spaces of a string with zeroes
	// other chars are converted to ascii
	seq0 {
		var list = List.new;
		this.collect{ |char|
			if (char == $ )
				{ list.add(0) }
				{ list.add(char.ascii) }
		};
		^list.asArray
	}

	// replaces the spaces of a string with \r
	// other chars are converted to ascii normalized!
	seq0N {
		var list = List.new;
		this.collect{ |char|
			if (char == $ )
				{ list.add(0) }
				{ list.add(char.ascii/128) }
		};
		^list.asArray
	}

	// replaces the ~ of a string with \r
	// other chars are converted to ascii
	seqP {
		var list = List.new;
		this.collect{ |char|
			if (char == $~)
				{ list.add(\r) }
				{ list.add(char.ascii) }
		};
		^list.asArray
	}

	// replaces the ~ of a string with \r
	// other chars are converted to ascii normalized
	seqPN {
		var list = List.new;
		this.collect{ |char|
			if (char == $~)
				{ list.add(\r) }
				{ list.add(char.ascii/128) }
		};
		^list.asArray
	}

	// accepts only alpha numeric!
	// replaces the rest with pauses!
	seqI {
		^this.digit.collect{ |char| char ?? \r };
	}

	// accepts note names! (sorry, no alterations!)
	seqM {
		var list = List.new;
		this.collect{ |char|
			list.add(
				case
				{ char == $c }   { 0 }
				{ char == $d }   { 1 }
				{ char == $e }   { 2 }
				{ char == $f }   { 3 }
				{ char == $g }   { 4 }
				{ char == $a }   { 5 }
				{ char == $b }   { 6 }
				{ char == $h }   { 6 } // support for germans!
				{ \r }
			)
		};
		^list.asArray
	}
}