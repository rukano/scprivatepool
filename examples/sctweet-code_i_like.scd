/* by Nathaniel Virgo (headcube */

Pbind(\dur,0.3,\sustain,1.5,\k,Pstutter(16,Pfunc{rrand(4,10)*10}),\freq,Pfunc{|e|exprand(50,500).round(e.k)},\amp,Pgbrown(0.01,0.1)).play

Ndef(\,{x=DelayL.ar(n=Ndef(\);n.ar,2,LFNoise0.kr(0.03*_!20)+1)+Blip.ar(0.5);LeakDC.ar(LPF.ar(x+x.mean*0.15,4e3)).sin});play{Splay.ar(n.ar)}

/* by micromoog */

play{LFCub.ar(LFSaw.kr(LFPulse.kr(1/4,1/4,1/4)*2+2,1,-20,50))+(WhiteNoise.ar(LFPulse.kr(4,0,LFPulse.kr(1,3/4)/4+0.05))/8)!2}//#supercollider

play{BPF.ar(VarSaw.ar(LFNoise1.kr(3,40,200),0,0.25)+PinkNoise.ar(0.1),LFNoise2.kr(12,700,1000),0.3)!2};//#supercollider
say what?

4.do({{PanB2.ar(Gendy1.ar(1,1,1,1,rrand(150,250),500,0.1)*LFNoise1.kr(1,0.25,0.75),LFNoise1.kr(1))}.play})//#supercollider
BEES BEES BEES

play{a=VarSaw.ar(SinOsc.ar(1/20,7/3,80,80),0,LFNoise1.kr(1,1/2,1/2))*Line.ar(0,1)!2;CombN.ar(a,2,2,20,1,a).softclip}//#supercollider
rumble

play{VarSaw.ar((Hasher.ar(Latch.ar(SinOsc.ar((1..4)!2),Impulse.ar([5/2,5])))*300+300).round(60),0,LFNoise2.ar(2,1/3,1/2))/5}//#supercollider

{BPF.ar(DynKlang.ar(`[[3,5,[4,6]]],Demand.kr(Impulse.kr(1/3),0,Dseq([9,8,6,4],inf))*7).floor,LFPar.ar(1,2,911,999))/3}.play;//#supercollider

play{a=LFNoise1;SinOsc.ar(round(VarSaw.ar(a.kr(10,0.1),0,1)*a.kr(1!2!2,400),a.kr(1/50,32,76))).tanh}//#supercollider
