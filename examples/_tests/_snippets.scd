// network boradcasting

unixCmd("ifconfig | grep broadcast | awk '{print $NF}'")
NetAddr.broadcastFlag = true;
NetAddr.langPort

// array methofs
.reject
.removeAllSuchThat{ |x| x.even }
.diferentiate

// number methods
.midiratio
.ring2

(1 / 4).asFraction
1e12 // (exp)
1.3e4
2r001
2r011
200.asBinaryDigits
215.asDigits(3)
0.5pi

1b	// flat
1s	// sharp

// classes
Scale
Tuning
Pdefn

// synth desc lib
SynthDescLib.global.browse;
SynthDescLib.global.synthDescs.at(\default);
SynthDescLib.global.synthDescs.at(\default).makeWindow; // nice!
SynthDescLib.global.synthDescs.keys; // all stored synths
SynthDef(..., {}, metadata: (specs: (cutoff: \freq, volume: \amp)))
