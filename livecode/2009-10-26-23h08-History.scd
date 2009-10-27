///////////////////////////////////////////////////
// History, as it was on Mon Oct 26 23:08:25 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:1.48 -  
p.fadeTime = 2

// - 0:0:2.46 -  
~ snd.play

// - 0:0:4.62 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Impulse.ar((0.5,0.99..4)))) }

// - 0:1:16.78 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,WhiteNoise.ar))) }

// - 0:1:26.94 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,PinkNoise.ar))) }

// - 0:1:45.22 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800)*MouseX.kr(1,2),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,PinkNoise.ar))) }

// - 0:1:57.28 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800)*MouseX.kr(1,2),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,PinkNoise.ar))) }

// - 0:2:2.59 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800)*MouseX.kr(1,2),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,PinkNoise.ar))) }

// - 0:2:10.36 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.01,0.1,PinkNoise.ar))) }

// - 0:2:39.5 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.001,0.1,PinkNoise.ar))) }

// - 0:2:44.51 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.1,0.1,PinkNoise.ar))) }

// - 0:2:50.26 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.05,0.1,PinkNoise.ar))) }

// - 0:2:58.7 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.01,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,PinkNoise.ar))) }

// - 0:3:8.26 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,PinkNoise.ar))) }

// - 0:3:16.54 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.01,PinkNoise.ar))) }

// - 0:3:30.95 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,PinkNoise.ar))) }

// - 0:3:53.9 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,Resonz.ar(PinkNoise.ar,800,0.1)))) }

// - 0:4:3.11 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.1)))) }

// - 0:4:20.41 -  
~tex.play

// - 0:4:45.57 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),0.5,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.1)))) }

// - 0:4:54.06 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),1,1.5], Decay2.ar(Impulse.ar((0.5,0.99..4)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.1)))) }

// - 0:5:49.71 -  
~tex = { Splay.ar(BPF.ar(WhiteNoise.ar,(400,442..800),0.01)) }

// - 0:6:6.57 -  
~tex = { Splay.ar(BPF.ar(WhiteNoise.ar,(400,442..800),0.001)) }

// - 0:6:11.56 -  
~tex = { Splay.ar(BPF.ar(WhiteNoise.ar,(400,442..800),0.001)) * 10 }

// - 0:6:26.43 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001))  }

// - 0:6:30.17 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001)) * 0.1 }

// - 0:6:36.22 -  
// sorry, loud

// - 0:6:48.74 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001, 0.01)) * 0.1 }

// - 0:6:55.66 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001, 0.01)) }

// - 0:7:8.02 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001, 0.05)) }

// - 0:7:12.85 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,(400,442..800),0.001, 0.02)) }

// - 0:7:44.7 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,1.1),0.001, 0.02)) }

// - 0:7:57.54 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,1.25),0.001, 0.02)) }

// - 0:8:2.67 -  
~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,1.1),0.001, 0.02)) }

// - 0:9:3.94 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,1.1),0.001, 0.02)) };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:9:21.36 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.9,1.25)),0.001, 0.02)) };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:9:40.03 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { Splay.ar(RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02)) };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:9:57.43 -  
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02).sum!2 };

// - 0:10:0.5 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02).sum!2 };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:10:13.45 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02).sum!2 * 0.5};
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:10:18.44 -  
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02).sum!2 * 0.5 };

// - 0:10:28.48 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(0.99,1.25)),0.001, 0.02).sum!2 * 0.2 };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:10:41.88 -  
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(1.001,1.333)),0.001, 0.02).sum!2 * 0.2 };

// - 0:10:44.23 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,120,exprand(1.001,1.333)),0.001, 0.02).sum!2 * 0.2 };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:11:10.89 -  
~snd = { Splay.ar(Klank.ar(`[(400,442..800),1,1.5], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.1)))) }

// - 0:11:40.74 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,exprand(1,4)*80,exprand(1.001,1.333)),0.001, 0.02).sum!2 * 0.2 };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:12:6.3 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,exprand(1,4)*80,exprand(1.01,1.333)),0.001, 0.02).sum!2 * 0.2 };
		rrand(3,10.0).wait;
	}
}).play
);

// - 0:12:11.93 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,exprand(1,4)*80,exprand(1.01,1.333)),0.001, 0.02).sum!2 * 0.2 };
		rrand(5,10.0).wait;
	}
}).play
);

// - 0:12:24.88 -  
(
Tdef(\tex, {
	inf.do{
		~tex = { RLPF.ar(WhiteNoise.ar,Array.geom(16,exprand(1,4)*80,exprand(1.2,1.333)),0.001, 0.02).sum!2 * 0.2 };
		rrand(5,10.0).wait;
	}
}).play
);

// - 0:12:42.02 -  
~out.play

// - 0:12:53.84 -  
~out = ~snd * ~tex

// - 0:13:9.78 -  
~out = { ~snd * ~tex }

// - 0:13:44.23 -  
~out = { FreeVerb.ar((~snd.ar + ~tex.ar).sum) }

// - 0:13:49.99 -  
~out = { FreeVerb.ar((~snd.ar + ~tex.ar).sum)!2 }

// - 0:14:0.33 -  
~out = { FreeVerb.ar((~snd.ar + ~tex.ar).sum,1,1)!2 }

// - 0:14:37.09 -  
~out = { FreeVerb.ar(RLPF.ar((~snd.ar + ~tex.ar).sum,1e3,0.5),1,1)!2 }

// - 0:14:56.55 -  
~out = { FreeVerb.ar(RLPF.ar((~snd.ar + ~tex.ar).sum,1e3,0.5,0.5),1,1)!2 }

// - 0:15:14.55 -  
~snd = { Splay.ar(Klank.ar(`[(55,67..120),1,1.5], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.1)))) }

// - 0:15:26.23 -  
~snd = { Splay.ar(Klank.ar(`[(55,67..120),1,1.5], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.5)))) }

// - 0:15:35.44 -  
~snd = { Splay.ar(Klank.ar(`[(55,67..120),1,1.5], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,0.8)))) }

// - 0:15:40.99 -  
~snd = { Splay.ar(Klank.ar(`[(55,67..120),1,1.5], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,1)))) }

// - 0:16:9.27 -  
~snd = { Splay.ar(Klank.ar(`[(55,67..120),2,2], Decay2.ar(Impulse.ar((0.9,1.5..8)),0.08,0.1,Resonz.ar(PinkNoise.ar,1600,1)))) }

// - 0:16:38.06 -  
~out = { FreeVerb.ar(RLPF.ar((~snd.ar + ~tex.ar).sum,1e3,0.5,0.5),1,1)!2 }

// - 0:16:44.95 -  
~out = { FreeVerb.ar(RLPF.ar((~snd.ar + ~tex.ar).sum,200,0.5,0.5),1,1)!2 }

// - 0:17:2.47 -  
~out = { FreeVerb.ar(RLPF.ar((~snd.ar + ~tex.ar).sum,200,0.5,0.1),1,1)!2 }

// - 0:17:19.52 -  
p.end(30)

