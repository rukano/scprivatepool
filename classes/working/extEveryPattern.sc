/*
Pattern and Array extension to describe changes after n repeats.
*Inspired* by Tidal by Alex McLean. Is not a port.

Example:
(
Pbind(
	\octave, [3,4,5],
	\legato, 0.5,
	\scale, Scale.minorPentatonic,
	\degree, Place([0,[2,1]], 2).andEvery(3, Pwhite(4,8,8)),
	\dur, [1,1,1,1].andEvery(3, [1,1,0.5,0.5,0.5,0.5]) / 4
).play
)
*/

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
