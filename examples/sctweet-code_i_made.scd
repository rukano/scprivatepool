play{Splay.ar(Ringz.ar(Decay2.ar(Impulse.ar([2,3]),0.0001,0.01),Array.geom(9,40,1.75)*LFDNoise3.ar(4,0.1),0.9,0.1))} // #supercollider #sc
play{Ringz.ar(Decay2.ar(TDuty.ar(Dseq([1,1,2,1,1,2,1,4]/8,inf)),0.00001,0.1),Array.geom(12,50,1.7)*LFDNoise3.kr(0.5,0.01),1,0.01).sum!2} #sc
play{Ringz.ar(Decay2.ar(TDuty.ar(Dseq([1,1,2,1,1,2,1,4]/10,inf)),0,0.001),Array.geom(12,50,1.1)*LFNoise2.kr(0.5,0.02,1),1,0.01).sum!2}// #sc
play{a=LFNoise0;b=FBSineC.ar(a.kr(4,2e4,2e4),a.kr(10,16,17),1,1.005,0.7)!2;Latch.ar(b,Impulse.ar(a.kr(0.5,5e3,4e3)))*a.kr(5,0.4,0.5)}// #sc
play{RLPF.ar(Latch.ar(SinOsc.ar([100,100.5])!2,Impulse.ar(Duty.kr(Dseq([2,1]/4,inf),0,Drand((67,67.2..70),inf)))),800)} // #sc _dubsteppy_
play{CombN.ar(Splay.ar(Pulse.ar(Gendy3.kr([1,2,4,6])+LFNoise0.ar(4,6,Gendy3.kr(5,freq:[10,99])))*Gendy2.ar([0,1],maxfreq:[55,99])),3,0.4,2)}
play{x=LFDNoise3;Blip.ar(x.kr(1,[400,100],500),x.kr([1,2],6,5))*Gendy3.ar(1,1,1,1,x.kr(1,99,91),1,0.1)*x.ar(0.5,0.5,0.5)}// #sc
t=("come out to show them "!999).join;Speech.init(2);[98,99].do{|r,i|Speech.setSpeechVoice(i,3).setSpeechRate(i,r).channels[i].speak(t)};
t=("it's gonna rain "!999).join;Speech.init(2);[98,99].do{|r,i|Speech.setSpeechVoice(i,3).setSpeechRate(i,r).channels[i].speak(t)};// #sc sr
a=UGen.subclasses;fork{loop{u=a.choose;try{play{u.ar*EnvGen.ar(Env.perc(0.1,1),doneAction:2)!2}};1.wait}}//#sc #supercollider !!!NOT SAFE!!!
f=_.speak;fork{loop{f.("hi scott");2.wait;Speech.channels[0].voice_(20.rand)}} // #sc #supercollider // now with tag
f={|i,o,d|play{Saw.ar(XLine.kr(i,o,d,1,0,2))!2*EnvGen.kr(Env.sine(d))}};fork{loop{t=rrand(1e3,9e3);f.(t,t/4,rrand(0.1,1));9.rand.wait}}//#sc
play{a=[1,1.01,2,2.02,3.5,4.01,5.501];SinOsc.ar(Duty.kr(0.2,0,Dseq([10,11,0,12.2,0,0,10,0]+39,inf).midicps)*(a++(a*2))).sum!2/2}//DAF #sc
play{SinOsc.ar(Duty.kr(0.2,0,Dseq([0,5,0,15,0,12,0,0,12,0,12,0,12,10,0,12]+47,inf).midicps)*[1,1.01,2,2.02,3.5,4.01,5.501]).sum!2}// DAF #sc
b=Buffer.read(s,"*/*v".pathMatch@0);play{x=SinOsc;ring4(ar(TGrains,2,kr(Impulse,ar(x,[1,3],0,10,[9,20])),b,1,ar(x,1/9),0.01),ar(x,1e3))*9}
b=Buffer.read(s,"*/*v".pathMatch[0]);play{TGrains.ar(2,Impulse.kr([9,19]*LFNoise0.kr(2,1,1)),b,LFNoise0.kr(1,(1..4),2),0,1/10).sum*10}//#sc
play{var cpm=60;SinOsc.ar(700)!2*ToggleFF.ar(TDuty.ar(Dseq([1,1,1,1,1,2, 2,1,2,1,2,2, 1,1,1,1,1,3]/1e3*(6e3/cpm),inf)))} // S.O.S @ #sc
play{SinOsc.ar(Latch.ar(SinOsc.ar(1.75,0,1e2,2e2),Impulse.ar((1,1.1..2)*2)).lag(0.1)/2*(1,1.25..8)).sum**3!2}// #supercollider (last one)
play{ SinOsc.ar(Latch.ar(SinOsc.ar(1.75,0,1e2,2e2),Impulse.ar([1,1.0001])).lag(0.1)*(1,1.25..8)).sum**3!2 } // #supercollider
play{Splay.ar(SinOsc.ar(Latch.ar(SinOsc.ar(1.3,0,4e2,5e2),Impulse.ar([1,1.0001])*[1,2,3,4]).lag(0.05)))} // #supercollider (nicer)
play{SinOsc.ar(Latch.ar(SinOsc.ar(1.3,0,4e2,5e2),Impulse.ar([1,1.0001])).lag(0.05))} // #supercollider /* simple but hypnotizing */
play{x=LFNoise2.kr(22,5,9);CombC.ar(Splay.ar(Gendy3.ar([4,2],[0.5,1],[1/9,1/4]*x,[1/2,1/8]*x,(9,49..199))),5,[0.13,0.1],[x/2,x/2.1])} // #sc
{x=TRand.kr(30,XLine.kr(2e4,30,99,1,1,2),Impulse.kr((1..9))).cpsmidi.round.midicps;Splay.ar(SinOsc.ar(x))*AmpComp.kr(x,10)}.play // #sc
fork{loop{d=rrand(1,9);play{f=200.rand+60;Splay.ar(SinOsc.ar(XLine.kr(f,(f,f+1..f+f),d,1,0,2),0,0.1))};d.wait}}//cpu expense #supercollider
play{RLPF.ar(Demand.ar(Impulse.ar(20000),0,Dxrand([Dseq((1,0.005..0)),Dseq([1]++(0!555)),Dseq((0!999))],inf)),Line.kr(100,3000,80),0.1)!2}
play{SinOsc.ar(Latch.ar(LFSaw.ar(0.3,1,100,300).cpsmidi.round.midicps*[1,2],Impulse.ar(4)))} // tonal scales #supercollider
play{a=(1,0.97..0.005);GVerb.ar(Decay2.ar(TDuty.ar(Dseq(a++(a/2)++(a/4)++(a/8))),XLine.kr(0.05,0.001,15),0.1,0.05)*9,4,1)}//#supercollider
play{t=TDuty.kr(Dseq([1,1,4,2,2]/8,inf));Resonz.ar(Crackle.ar!2,Demand.kr(t,0,Dseq([250,8e3],inf)),Demand.kr(t,0,Dwhite(0.01,0.5,inf)))}
play{t=TDuty.kr(Dseq([1,1,4,2,2]/8,inf));Resonz.ar(WhiteNoise.ar!2,Demand.kr(t,0,Dseq([250,8e3],inf)),Demand.kr(t,0,Dwhite(0.01,0.5,inf)))}
play{t=Impulse.ar((1,1.3..4)/2).sum;Decay2.ar(t,0.05,0.2,Splay.ar(SinOsc.ar(Demand.ar(t,0,Drand((120,180..800),inf)))*ToggleFF.ar(t)))}
play{t=Impulse.ar((1,1.3..4)/2).sum;Decay2.ar(t,0.001,0.2,Splay.ar(SinOsc.ar(Demand.ar(t,0,Drand((120,145..400),inf)))*ToggleFF.ar(t)+t))}
play{BPF.ar(SoundIn.ar(0),Array.geom(16,120,1.5),0.005,2).sum.dup} // kind of EZ resonator / vocoder for the mic #supercollider
play{FreeVerb.ar(CombC.ar(SoundIn.ar(0).softclip,1,1/120,1),0.4,1,1).dup}//easy hall/resonator fx for my lap steel guitar #supercollider
play{SinOsc.ar(Latch.ar(SinOsc.kr(0.75).range(0,12).round.midiratio*[200,400*SinOsc.kr(0.01).range(1,4)],TDuty.kr(Dseq([1,2]/8,inf))))} //ye
play{t=TDuty.kr(Drand(([1,2,3]/8),inf));SinOsc.ar(Demand.kr(t,0,Drand((50,53..71).midicps,inf))*[1,1.5]*LFPulse.kr(0.5).range(1,2)).dup}
play{GVerb.ar(Decay2.ar(TDuty.ar(Dwrand([2,4,8,16]/16,[7,1,1,1]/10,inf)),0.02,0.05,SinOsc.ar(LFDNoise3.kr(40,199,150))).tanh,1,0.5)} // #sc
play{d=Duty;f=d.kr(1/[1,2,4],0,Dseq([0,3,7,12,17]+24,inf));GVerb.ar(Blip.ar(f.midicps*[1,4,8],LFNoise1.kr(1/4,3,4)).sum,200,8)}
play{d=Duty;f=d.kr(1/[1,2,3],0,Dseq([0,3,7,12,8]+36,inf));GVerb.ar(Blip.ar(f.midicps*[1,2,3],LFNoise1.kr(1,8,8)).sum,99,4)}
9.do{|i|Pbind(\scale,#[0,3,5,7,10],\octave,3.rand+3,\dur,(12.rand+1)/5,\degree,Pn(Plazy{Pseq(18.partition(8.rand+2)-1,4)})).play}
play{t=Impulse.kr(6);f=lag(Demand.kr(t,0,Drand(midicps((10,13..40)),inf)));RLPF.ar(Pulse.ar(f),1+Decay2.kr(t)*LFNoise2.kr(2,8,9)*f,1/9)!2}
play{a=Decay2.ar(Impulse.ar(1/2),0.01,0.2,0.5)*SinOsc.ar(LFNoise2.kr(1,99,299))!2;4.do{a=a+CombN.ar(a,4,rrand(0.1,3).round(0.125),4,1/4)};a}


// --- Solo hackpackt for using all ugens in sctweets:

// Line
l=Line;fork{loop{play{Splay.ar(SinOsc.ar({x=rrand(1,7)*99;l.kr(x,x/(0.25,0.5..4).choose,9)}!9,0,1/9)*l.ar(1,0,9,0.5,0.5,2))};1.wait}}// #sc

// IEnvGen
play{a={rrand(-1,1.0)}!1e3;e=InterplEnv(a,[1e-3],a*3);IEnvGen.ar(e,LFSaw.kr(LFCub.kr(8,0,300,300),0,e.times.sum)*LFNoise2.kr(99,1,10))!2}

// Logistic
play{Splay.ar(Logistic.ar(LFCub.kr([1,2,4,8],0,1.9,2),LFNoise0.kr(1/[16,12,8,4],400,999).round(150)))}// #supercollider #sc <3 chaotic noise

play{Splay.ar(Logistic.ar(LFPar.kr([1,2,4,8,16]/8,0,1.9,2),LFNoise0.kr(1/[2,4,8,16],3000,4000).round(50)))} // #sc #supercollider 8-bit sfx

play{Splay.ar(Logistic.ar(LFCub.kr([1,2,4,6],0,1.5,2),LFNoise0.kr(1/[2,2,4,4],250,300).round(50))).lag(LFCub.kr(1/8,0.001,0.003))}

// LinRand
fork{loop{r=rrand(-9,9);9.do{play{Pan2.ar(SinOsc.ar(LinRand(40,900,r))*EnvGen.ar(Env.sine(9),1,0.1,0,1,2),rrand(-1,1.0))}};rrand(6,8).wait}}

// LocalIn/LocalOut
play{l=LocalIn.ar+Decay2.ar(Impulse.ar(3),3e-2,0.05,LFCub.ar(LFNoise2.kr(19,500,600)));l=DelayN.ar(l,1,1/2);LocalOut.ar(l/3);l!2}

// KeyState
play{GVerb.ar(Blip.ar({|i|DegreeToKey.kr(LocalBuf.newFrom((0,3..24)),i,i%3+5,1,36).midicps}!50,5,KeyState.kr((0..49))*5e-3).sum!2,100,8)}

// LFSaw
play{l=LFSaw;l.ar(l.kr(l.kr([1,3],0,4,[5,6]),l.kr(1/[4,8]),l.kr(1,0,99,100),l.kr(1/2,0,50,l.kr(1/4,1/3,50,100))))/2} // #sc LFSaw galore

// LFTri
play{l=LFTri;l.ar(l.kr(1/4,1/1.5,l.kr(1,0,10,10),{|i|50+i}!8+l.kr(1/3,0,3,40)),0,l.kr((1..8),0,0.2).excess(0.01)*({|i|16-i/20}!16)).sum!2}

// LFCub
play{l=LFCub;Splay.ar(l.ar(l.kr(9.1,0,100,(200,300..500)),0,(l.kr(9,0,1,l.kr(1/[2,3,5,7],0,0.5,0))>(l.kr(1/2,0,0.4,0.5))).lag/2))} // #sc

// LFParty
play{Splay.ar(LFCub.ar(LFTri.kr([1,1.1],0,LFPar.kr(1/7,0,10),{(100,150..500).choose}!5),0,LFSaw.kr(4/[1,3,4,6,8])**LFPar.kr(1/8,0,9,16)))}

// FreeVerb
play{f=FreeVerb;x=Decay2.ar(Impulse.ar([3,4]),1/99,1/9,LFCub.ar({rrand(40,400)}!4,0,0.1)).sum;5.do{x=f.ar(x,LFTri.kr(1/16,0,1/4,0.3))};x!2}

// PitchShift
play{o=LFCub.kr(1/[24,7,13,18]);PitchShift.ar(LFPulse.ar(o[0]*50+100,0,0.1).lag(1/1000),o[3]*0.299+0.3,o[2]*8+8,o[1],o[0]*0.1+0.1)!2} // #sc

play{o=LFCub.kr(1/[4,7,13,19]);PitchShift.ar(LFPar.ar(o@0*1e3+1e3,0,0.1).lag(1/1000),o@3*0.299+0.3,o@2*2+2,o@1,o[0]*0.1+0.1)!2}

play{o=LFPulse.kr(1/[4,7,13,19]);PitchShift.ar(LFPar.ar(o@0*1e3+1e3,0,0.1).lag(1/1000),o@3*0.299+0.3,o@2*2+2,o@1,o[0]*0.1+0.1)!2}

// BitAnd
play{l=LFSaw;Clip.ar(BitAnd.ar(LFTri.ar(l.kr(1/[8,9],0,25,25).round(1),0,50,50).poll,l.kr(1/[7,5],0,25,25)).poll,-1,1)} // #sc glitchy 8-bity