///////////////////////////////////////////////////
// History, as it was on Sun Sep 27 00:40:01 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:3.26 -  
~ snd.play

// - 0:0:9.77 -  
~snd.fadeTime = 2

// - 0:1:11.87 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:17.73 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:23.41 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:28.48 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:33.64 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:38.68 -  
~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:1:55.35 -  
	~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:2:4.46 -  
	~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800))) * \amp.kr(0.1) }

// - 0:2:12.49 -  
	~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800), mul:0.1)) * \amp.kr(0.1) }

// - 0:2:20.29 -  
	~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800), mul:0.1)) * \amp.kr(0.1) }

// - 0:2:23.98 -  
	~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800), mul:0.25)) * \amp.kr(0.1) }

// - 0:2:57.83 -  
(
Tdef(\texture, {
	inf.do{
		~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800), mul:0.25)) * \amp.kr(0.1) };
		rrand(4,8).wait;
	}
}).play
);

// - 0:3:6.28 -  
~snd.fadeTime = 5

// - 0:3:14.06 -  
(
Tdef(\texture, {
	inf.do{
		~snd = { Splay.ar(SinOsc.ar(Array.rand(16, 100, 800), mul:0.25)) * \amp.kr(0.1) };
		rrand(5,12).wait;
	}
}).play
);

// - 0:3:20.77 -  
~ping.play

// - 0:5:26.83 -  
(
~ping = {
	var trig = Dust.kr(3);
	FSinOsc.ar(
		Demand.kr(trig, 0, Drand([110,220,330,440], inf))
	) * 
	\amp.kr(0.1)
}
);

// - 0:5:45.31 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar(
		Demand.kr(trig, 0, Drand([110,220,330,440], inf))
	) * 
	\amp.kr(0.1)
}
);

// - 0:5:54.52 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar(
		Demand.kr(trig, 0, Drand([110,220,330,440], inf))
	) * 
	\amp.kr(0)
}
);

// - 0:6:43.07 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,2] * Demand.kr(trig, 0, Drand([110,220,330,440], inf)) ) * 
	\amp.kr(0) *
	EnvGen.kr(Env.sine(0.1), trig);
}
);

// - 0:6:54.37 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,2] * Demand.kr(trig, 0, Drand([110,220,330,440], inf)) ) * 
	\amp.kr(0.1) *
	EnvGen.kr(Env.sine(0.1), trig);
}
);

// - 0:7:1.77 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,2] * Demand.kr(trig, 0, Drand([110,220,330,440], inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.sine(0.1), trig);
}
);

// - 0:7:13.27 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand([110,220,330,440], inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.sine(0.1), trig);
}
);

// - 0:7:34.59 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand([110,220,330,440], inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.1), trig);
}
);

// - 0:7:42.57 -  
(
~ping = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand([110,220,330,440]*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.1), trig);
}
);

// - 0:8:3.87 -  
(
~ping[0] = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340), inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.1), trig);
}
);

// - 0:8:12.98 -  
(
~ping[0] = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*10, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.1), trig);
}
);

// - 0:8:18.42 -  
(
~ping[0] = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.1), trig);
}
);

// - 0:9:4.09 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.1, 2) }

// - 0:9:25.02 -  
~ping.fadeTime = 5

// - 0:9:30.88 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.05, 4) }

// - 0:9:43.58 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.025, 1) }

// - 0:9:53.92 -  
~ping.fadeTime = 10

// - 0:10:4.58 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.1, 4) }

// - 0:10:29.41 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.05, 2) }

// - 0:10:43.54 -  
(
~ping[0] = {
	var trig = Dust.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:11:16.25 -  
(
~ping[0] = {
	var trig = TDuty.kr(Dseq([1,1,1,5]));
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:11:22.03 -  
~ping.fadeTime = 5

// - 0:11:42.87 -  
(
~ping[0] = {
	var trig = TDuty.kr(Dseq([1,1,1,5]/8));
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:12:15.89 -  
(
~ping[0] = {
	var trig = Impulse.kr(1);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,245..340)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:12:49.65 -  
(
~ping[0] = {
	var trig = Impulse.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*2, inf)) ) * 
	\amp.kr(0.05) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:13:11.76 -  
(
~ping[0] = {
	var trig = Impulse.kr(3);
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*2, inf)), mul:0.25 ) * 
	\amp.kr(0.1) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:13:52.27 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([0.3], inf));	
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*2, inf)), mul:0.25 ) * 
	\amp.kr(0.1) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:14:6.41 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5]/5, inf));	
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*2, inf)), mul:0.25 ) * 
	\amp.kr(0.1) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:14:18.73 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5]/5, inf));	
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*2, inf)), mul:0.25 ) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:14:24.37 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5]/5, inf));	
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400)*4, inf)), mul:0.25 ) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:14:29.99 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.01, 1) }

// - 0:14:36.05 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.1, 1) }

// - 0:14:50.85 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5]/5, inf));	
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.25 ) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:15:4.88 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/5, inf));
	SinOsc.ar( [1,1.001] * Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.25 ) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:15:55.35 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/5, inf));
	Splay.ar(
		SinOsc.ar( [1,1.33,1.5,1.75,2] *
			Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:16:44.11 -  
~ping[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1]) }

// - 0:16:50.84 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.1, 1) }

// - 0:16:57.59 -  
~ping[20] = \filter -> { |in| FreeVerb2.ar(in[0], in[1]) }

// - 0:18:41.93 -  
(
Tdef(\texture, {
	inf.do{
		~snd = {
			var array = Array.rand(16, 100, 800);
			Splay.ar( SinOsc.ar(array, mul:0.25) ) *
			\amp.kr(0.1) *
			LFNoise2.ar(Array.rand(array.size, 0.1, 4)).range(0,1);
		};
		rrand(5,12).wait;
	}
}).play
);

// - 0:19:24.9 -  
(
Tdef(\texture, {
	inf.do{
		~snd = {
			var array = Array.rand(16, 100, 800);
			Splay.ar( SinOsc.ar(array, mul:0.25) * LFNoise2.ar(Array.rand(array.size, 0.1, 4)).range(0,1);) *
			\amp.kr(0.1)
		};
		rrand(5,12).wait;
	}
}).play
);

// - 0:19:54.02 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/5, inf));
	Splay.ar(
		SinOsc.ar( [0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.01, 0.05), trig);
}
);

// - 0:20:8.59 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/5, inf));
	Splay.ar(
		SinOsc.ar( [0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.01), trig);
}
);

// - 0:20:28.63 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.25, 5) }

// - 0:20:46.6 -  
~ping[20] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.7, 0.7) }

// - 0:20:59.35 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.1, 5) }

// - 0:21:15.15 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/8, inf));
	Splay.ar(
		SinOsc.ar( [0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((225,255..400).scramble*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.01), trig);
}
);

// - 0:21:31.5 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/8, inf));
	Splay.ar(
		SinOsc.ar( [0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((120,180..800)*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.01), trig);
}
);

// - 0:21:50.09 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/8, inf));
	Splay.ar(
		SinOsc.ar( [0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((120,180..800)*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.025), trig);
}
);

// - 0:22:12.57 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/8, inf));
	Splay.ar(
		SinOsc.ar( [0.3,0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((120,180..800)*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.025), trig);
}
);

// - 0:22:36.06 -  
(
~ping[0] = {
//	var trig = Impulse.kr(3);
	var trig = TDuty.kr(Dseq([1,1,1,5,3,3,1,1,1,2,1]/8, inf));
	Splay.ar(
		SinOsc.ar( [0.3,0.5,1,1.33,1.5,1.75,2,4,5,6] *
			Demand.kr(trig, 0, Drand((80,160..800)*4, inf)), mul:0.1 )
	) * 
	\amp.kr(0.2) *
	EnvGen.kr(Env.perc(0.001, 0.025), trig);
}
);

// - 0:22:48.33 -  
~ping[10] = \filter -> { |in| CombC.ar(in, 5, 0.33, 5) }

// - 0:22:53.87 -  
~ping[20] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.7, 0.9) }

// - 0:23:35.79 -  
~ping[11] = \filter -> { |in| CombC.ar(in, 5, 0.1, 1) }

// - 0:23:40.94 -  
~ping[12] = \filter -> { |in| CombC.ar(in, 5, 1, 5) }

// - 0:23:50.81 -  
~p.end(30)
