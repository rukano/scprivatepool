// execute in order (live coding...)

p = ProxySpace.push(s);

~out = {~out1.ar + ~out2.ar};

~out1.play;
~out1 = { CombC.ar(Impulse.ar([0.5, 0.333]*1), 2, LFNoise0.kr(10).range(0.001, 0.075), 2) }


~rev.play;
~rev = { FreeVerb2.ar(~out.ar[0], ~out.ar[1], 1, 1, 1) }

~rev2.play;
~rev2 = { FreeVerb2.ar(RLPF.ar(~rev.ar[0], SinOsc.kr(0.01).range(88,2222), 0.1) * 0.5, RLPF.ar(~rev.ar[1], SinOsc.kr(0.1).range(500,1000), 0.5) * 0.5, 1, 1, 1)  }

~out2.play;
~out2 = { Pulse.ar([
	Duty.kr(Drand([1,2,1,3,1,2,1,2,1]/100, inf), 0, Drand(Array.geom(10, 34, 1.1), inf)),
	Duty.kr(Drand([1,2,1,3,1,2,1,2,1]/100, inf), 0, Drand(Array.geom(10, 34, 1.15), inf))
]) * 0.1
}

~bin.play;
~bin = { FreeVerb2.ar(SinOsc.ar(55), SinOsc.ar(56), 0, 0.1, 0.1) * 0.5 }


/*
~bin.play
~bin.fadeTime = 0.5
~out2.clear
~out2.play
~out2.stop
~rev2.fadeTime = 0.5
~rev.stop
~rev2.play
~rev.fadeTime = 0.1
~out.play
~out.fadeTime = 0.1
~out.stop
~rev.play
*/