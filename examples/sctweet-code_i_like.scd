/* by Nathaniel Virgo (headcube */

Pbind(\dur,0.3,\sustain,1.5,\k,Pstutter(16,Pfunc{rrand(4,10)*10}),\freq,Pfunc{|e|exprand(50,500).round(e.k)},\amp,Pgbrown(0.01,0.1)).play


/* by Nathaniel Virgo (headcube */

Ndef(\,{x=DelayL.ar(n=Ndef(\);n.ar,2,LFNoise0.kr(0.03*_!20)+1)+Blip.ar(0.5);LeakDC.ar(LPF.ar(x+x.mean*0.15,4e3)).sin});play{Splay.ar(n.ar)}