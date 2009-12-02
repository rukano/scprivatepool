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

// more selective frequencies:
// TODO: relativize this... (maximum of a freq group)
(
var minFreq = 1000;
var thresh = -60;
var maxFreqStep = 4.0;
var freqs = p.flop[0];
var amps = p.flop[1];
var lastFreq = freqs[0];
var list = List.new;
freqs.do{ |freq, i|
	if ( freq > minFreq ) {
		if ( ((freq - lastFreq) > maxFreqStep) && (amps[i] > thresh) ) {
				list.add(p[i]);
				lastFreq = freq;
		};
	}
};
d = list.asArray;
"*********************".postln;
"total of % partials\n".postf(d.size);
"*********************".postln;
"";
)


// playit
play{SinOsc.ar(d.flop[0], 0, d.flop[1].dbamp * 0.05).sum * EnvGen.ar(Env.perc(0.001,8), doneAction:2)!2 }

// now you can scale the frequencies and amplitudes or transform whatever you want
play{SinOsc.ar(d.flop[0] * 0.5, 0, d.flop[1].dbamp.scramble * 0.1).sum * EnvGen.ar(Env.perc(0,8), doneAction:2)!2}