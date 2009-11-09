// shortest.pop.song
// as posted in the sc-user mailings list

// still looking for the names of the original authors...

// original
{Splay.ar(Ringz.ar(Impulse.ar([2, 1, 4], [0.1, 0.11, 0.12]), [0.1, 0.1, 0.5])) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2)}.play

// quik remix
{Splay.ar(FSinOsc.ar([0.11,11,111,1111],0,Ringz.ar(Impulse.ar([8, 0.5,1, 16], [0.1, 0.11, 0.01, 0.0011]), [0.11, 0.055, 0.022,0.044]))) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2)}.play

// + Bass line
{Limiter.ar(Splay.ar(Ringz.ar(Impulse.ar([6, 2, 1, 4, 6], [0.16, 0.1, 0.11, 0.12, 0.16]), [64, 0.1, 0.1, 0.5, 60])) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2))}.play

// Kaiji Haino
{Limiter.ar(Splay.ar(DelayC.ar(Ringz.ar(Impulse.ar([2, 3, 6, 4, 6], [0.56, 0.51, 0.71, 0.62, 0.16]), [4.6, 10.1, 0.51, 0.5, 10]).distort),1, 0.8) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2))}.play

// And a bit more traditional metal:
{Limiter.ar(Splay.ar(DelayC.ar(Ringz.ar(Impulse.ar([2, 4, 6], [0.56, 0.51, 0.41]), [24.6, 10.1, 0.51]).distort.cubed),1,1) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2))}.play

// industrial remix
{Splay.ar(Saw.ar([11,110,55.25,10],Ringz.ar(Impulse.ar(LFPulse.kr(0.25,[0.25,0.25,0.5,0.5],10,10),[1, 0.1,0.1,1]),[2,0.5,0.25,0.4])))*EnvGen.kr(Env([1,1,0],[120,10]),doneAction:2)}.play

// more freejazz style
{Limiter.ar(Splay.ar(DelayC.ar(Ringz.ar(Impulse.ar([2, 3, 6, 4, 6]*SinOsc.ar(0.1).range(0.8, 1.2), [0.56, 0.51, 0.71, 0.62, 0.16]), [4.6, 10.1, 0.51, 0.5, 10]).distort),1, 0.8) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2))}.play

// Far from 140 chars but no so far from Kšln in the Fifties:
{Limiter.ar(Splay.ar(AllpassN.ar(Pulse.ar([LFNoise0.kr(5, 70).midicps, LFNoise0.kr(10, 120).midicps, LFNoise0.kr(2, 20).midicps])*Splay.ar(Ringz.ar(Impulse.ar([2, 1, 4], [0.1, 0.11, 0.12]), [0.1, 0.1, 0.5])) * EnvGen.kr(Env([1, 1, 0], [120, 10]), doneAction: 2)), 4, LFSaw.kr(0.1, mul: [1,2,3], add:2)))}.play
