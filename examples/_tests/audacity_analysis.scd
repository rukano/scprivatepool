// TODO: make a class for this!
// TODO: individual envelopes... ?

(
// read the file
f = File("audacity_analysis_bell.txt".resolveRelative,"r");
g = f.readAllString;
f.close;

r = g.findAll("\r");		// find all RETURNs (for indexing)

p = (r.size-1).collect{ |i|
	var string;
	(i < (r.size-1)).if{
		string = g.copyRange(r[i]+1, r[i+1]-1);	// copy a line
		string.split($\t).asFloat;				// slipt tab and make floats
	}
};
)

// Threshold, we don't want 2046 SinOscs
d = p.select({ |pair| pair[1] > -20.0 })

// playit
play{SinOsc.ar(d.flop[0], 0, d.flop[1].dbamp * 0.05).sum * EnvGen.ar(Env.perc(0,8), doneAction:2)!2}

// now you can scale the frequencies and amplitudes or transform whatever you want
play{SinOsc.ar(d.flop[0] * 0.1, 0, d.flop[1].dbamp.scramble * 0.05).sum * EnvGen.ar(Env.perc(0,8), doneAction:2)!2}
