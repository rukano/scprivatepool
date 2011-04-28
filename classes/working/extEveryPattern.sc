+ SequenceableCollection {
	andEvery { |num, new, repeats=inf, typeA, typeB|
		var patB;
		var pTypeB = typeB ? Pseq;
		var pTypeA = typeA ? Pseq;

 		if ( new.isKindOf(Pattern) ) {
			patB = new;
		} {
			patB = pTypeB.new(new);
		};

 		^Pseq([ Pn(pTypeA.new(this), num ), patB ], repeats);
 	}
}

+ Pattern {
	andEvery { |num, new, repeats=inf, typeB|
		var patB;
		var pTypeB = typeB ? Pseq;

 		if ( new.isKindOf(Pattern) ) {
			patB = new;
		} {
			patB = pTypeB.new(new);
		};

 		^Pseq([ Pn(this, num), patB ], repeats);
 	}
}
