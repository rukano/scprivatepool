(
c.remove;
c = CCResponder({ |src,chan,num,value|
	(num==15).if{ ~snd.set(\t_trig, 1) };
	(num==4).if{ ~ratio.set(\t_trig, 1) };
	[src,chan,num,value].postln;
}, nil, nil, nil, nil);
)

p = ProxySpace.push(s)
~snd.play
~snd[0] = { SinOsc.ar(Demand.kr(\t_trig.kr,0,Dseq([100,158,269,335,445,446,448,468,499]* ~ratio.kr,inf)))!2 * \amp.kr(1) * EnvGen.ar(Env.perc(0.01, 0.25), \t_trig.kr) }
~snd.set(\t_trig, 1)

s.latency = nil

~ratio = { Demand.kr(\t_trig.kr,0,Dseq(Array.geom(6,0.25,1.5),inf)) }
~ratio.fadeTime = 0.1