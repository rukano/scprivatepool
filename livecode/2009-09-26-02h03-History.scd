///////////////////////////////////////////////////
// History, as it was on Sat Sep 26 02:03:39 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:2.79 -  
~snd.play

// - 0:0:13.66 -  
~snd.fadeTime = 10

// - 0:0:39.62 -  
~snd = { GrayNoise.ar * SinOsc.kr(0.05) * 0.1 }

// - 0:0:47.41 -  
~snd = { GrayNoise.ar!2 * SinOsc.kr(0.05) * 0.1 }

// - 0:1:6.03 -  
~snd = { GrayNoise.ar!2 * SinOsc.kr(0.05).range(0.001, 1) * 0.1 }

// - 0:2:2.88 -  
~snd = { BPF.ar(GrayNoise.ar!2, Rand(250,2000)) * SinOsc.kr(0.05).range(0.001, 1) * 0.1 }

// - 0:2:18.43 -  
~snd = { BPF.ar(GrayNoise.ar!2, Rand(250,2000), 0.1) * SinOsc.kr(0.05).range(0.001, 1) * 0.1 }

// - 0:4:4.02 -  
(
fork{
	100.do{
	10.do{ |i|
		~snd[i] = {
			BPF.ar(GrayNoise.ar!2, Rand(250,2000), 0.15) * SinOsc.kr(0.05).range(0.001, 1) * 0.05
		}
	};
	12.wait;
	}
}
);

// - 0:4:56.3 -  
p.end(10)

// - 0:5:7.47 -  
CmdPeriod.run

