///////////////////////////////////////////////////
// History, as it was on Tue Oct 27 17:34:15 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:4.3 -  
~snd.play

// - 0:2:8.47 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,2],0.1,0.1)) }

// - 0:2:15.64 -  
p.fadeTime = 2

// - 0:2:23.54 -  
~freq = 200

// - 0:2:30.76 -  
~freq = 250

// - 0:2:35.47 -  
~freq = 300

// - 0:2:38.79 -  
~freq = 120

// - 0:3:10.95 -  
~freq = { Duty.kr(0.1,0,Dseq([200,100])) }

// - 0:3:24.64 -  
~freq = { Duty.kr(1,0,Dseq([200,100])) }

// - 0:3:31.87 -  
~freq = { Duty.kr(1,0,Dseq([200,100],inf)) }

// - 0:3:44.04 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,2],0.1,0.5)) }

// - 0:3:51.79 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,2],0.01,0.5)) }

// - 0:4:4.92 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,1.5,2,2.5,3],0.01,0.5)) }

// - 0:4:14.24 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,1.501,2.001,2.5,3],0.01,0.5)) }

// - 0:4:41.28 -  
~freq = { Duty.kr(1,0,Dseq([200,100,300,235],inf)) }

// - 0:4:58.81 -  
~freq = { Duty.kr(0.79,0,Dseq([200,100,300,235],inf)) }

// - 0:5:21.17 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,1.501,2.001,2.5,3],\rq.kr(0.1),0.5)) }

// - 0:7:15.28 -  
NPxdef(~snd, Pbind(\rq, Pseq([1,0.5,0.1,0.01],inf)));

// - 0:7:27.24 -  
Pdef(\snd).play

// - 0:7:36.94 -  
NPdef(~snd, Pbind(\rq, Pseq([1,0.5,0.1,0.01],inf)));

// - 0:7:38.36 -  
Pdef(\snd).play

// - 0:7:51.27 -  
// something's wrong

// - 0:8:2.25 -  
Pdef(\snd).stop

// - 0:8:6.67 -  
Pdef(\snd).clear

// - 0:8:8.88 -  
NPdef(~snd, Pbind(\rq, Pseq([1,0.5,0.1,0.01],inf)));

// - 0:8:9.98 -  
Pdef(\snd).clear

// - 0:8:11.5 -  
NPdef(~snd, Pbind(\rq, Pseq([1,0.5,0.1,0.01],inf)));

// - 0:8:14.04 -  
Pdef(\snd).play

// - 0:8:25.06 -  
~snd = { Splay.ar( Resonz.ar( Pulse.ar(~freq),~freq*[1,1.501,2.001,2.5,3],\rq.kr(0.1).lag,0.5)) }

// - 0:8:54.57 -  
~freq = { Duty.kr(0.79,0,Dseq([200,100,300,235]/2,inf)) }

// - 0:9:4.01 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1],inf)));

// - 0:9:5.46 -  
Pdef(\snd).play

// - 0:9:29.19 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1,0.5],inf)));

// - 0:9:53.02 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1,0.5],inf), \dur, 0.1));

// - 0:10:1.85 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1,0.5],inf), \dur, 0.05));

// - 0:10:10.68 -  
// yey! dubsteppy

// - 0:10:55.38 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1,0.5],inf), \dur, Prand([Pn(0.1,8), Pn(0.01,8)],inf)));

// - 0:11:38.74 -  
NPdef(~snd, Pbind(\rq, Pseq([0.1,0.5],inf), \dur, Prand([Pn(0.1,16), Pn(0.01,16), Pn(0.5,16)],inf)));

// - 0:11:52.33 -  
NPdef(~snd, Pbind(\rq, Pseq([0.01,0.5],inf), \dur, Prand([Pn(0.1,16), Pn(0.01,16), Pn(0.5,16)],inf)));

// - 0:12:22.74 -  
// doesnt sounds good but yould be a good way for live dance music

// - 0:12:43.23 -  
~freq = { \freq.kr(200) }

// - 0:12:49.06 -  
~freq = { \freq.kr(100) }

// - 0:13:47.41 -  
NPdef(~freq, Pbind(\freq, Pseq([50,100],inf), \dur, 0.5))

// - 0:13:54.48 -  
Pdef(\freq).play

// - 0:14:14.77 -  
NPdef(~freq, Pbind(\freq, Pseq([50,100,120,125],inf), \dur, 0.5))

// - 0:14:31.27 -  
NPdef(~freq, Pbind(\freq, Pseq([50,100,120,125].mirror1,inf), \dur, 0.5))

// - 0:14:40.74 -  
NPdef(~snd, Pbind(\rq, Pseq([0.01,0.5],inf), \dur, Prand([Pn(0.1,16), Pn(0.01,16), Pn(0.5,16)],inf)));

// - 0:14:41.06 -  
NPdef(~freq, Pbind(\freq, Pseq([50,100,120,125].mirror1,inf), \dur, 0.5))

// - 0:14:51.52 -  
NPdef(~snd, Pbind(\rq, Pseq([0.01,0.5],inf), \dur, Prand([Pn(0.1,8), Pn(0.01,16), Pn(0.5,4)],inf)));

// - 0:14:58.72 -  
NPdef(~snd, Pbind(\rq, Pseq([0.01,0.5],inf), \dur, Pseq([Pn(0.1,8), Pn(0.01,16), Pn(0.5,4)],inf)));

// - 0:15:17.42 -  
p.clear(10)

