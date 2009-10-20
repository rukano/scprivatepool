p = ProxySpace.push(s)

// make a trigger
~trig = { Impulse.ar(4) }

// demand gets a value timed by the trigger ~trig
~freq = { Demand.ar(~trig.ar, 0, Dseq([60,65,68,72].midicps, inf)) }

// stereo default
~sound.play

// use the demand values
~sound = { SinOsc.ar(~freq) * \amp.kr(0.1) }
~sound.set(\amp, 0.5)
~sound = { Pan2.ar(SinOsc.ar(~freq), \pan.kr(0)) * \amp.kr(0.1) }
~sound.set(\pan, 0.5)

// Tduty lets you choose trigger times (Trigger Duty)
// so you don't have to use Impulse (regular) or Dust (random)
~trig = { TDuty.ar(Dseq([1,1,1,5]/8, inf)) }
~trig = { TDuty.ar(Drand([1,1,2,5]/8, inf)) }

// filter the sound
~sound[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.6, 0.6) }

~click.play

// use the trigger for something else (not just demand)
~click = { Saw.ar(60) * EnvGen.ar(Env.perc(0, 0.05), ~trig.ar) }
~click[10] = \filter ->  { |in| DelayC.ar(in[0], 2, [0, 0.05]) }
~click[0] = { Saw.ar(\freq.kr(40)) * EnvGen.ar(Env.sine(0.05), ~trig.ar) }
~click[20] = \filter -> ( RLPF.ar(_, \ffrq.kr(1000)) )

ProxyMixer.new