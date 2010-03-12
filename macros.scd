// SYNTHESIS
MacroExpander.put("splay", "~snd = { Splay.ar(SinOsc.ar(Array.series(12,120,100) )) * EnvGen.ar(Env.sine(0.25), \\t_trig.kr(1)) * \\amp.kr(0.1) }");
MacroExpander.put("sum", "~snd = { SinOsc.ar(Array.geom(4, 80, 1.5)  ).sum!2 * EnvGen.ar(Env.sine(0.25), \\t_trig.kr(1)) * \\amp.kr(0.1) }");
MacroExpander.put("samp", "~samp = { var buf = b.a; PlayBuf.ar(1, buf, BufRateScale.kr(buf) * \\rate.kr(1) , \\t_trig.kr(1), BufFrames.kr(buf) * \\start.kr(0))!2 * \\amp.kr(0.1) }");
MacroExpander.put("trig", "~trig = { Trig.kr(\\t_trig.kr(1), 0.01)}");
MacroExpander.put("bass", "~bass = { SinOsc.ar(\\freq.kr(120) * [1,1.15] ) * EnvGen.ar(Env.perc(0,0.2), \\t_trig.kr(1)) * \\amp.kr(0.1) }");
MacroExpander.put("clicks", "~clicks = { WhiteNoise.ar!2 * EnvGen.ar(Env.perc(0,0.01), \\t_trig.kr(1)) * \\amp.kr(0.1) }");
MacroExpander.put("imp", "~imp = { Splay.ar(Impulse.ar([1,2,3,4])) * \\amp.kr(0.1) }");
MacroExpander.put("synth-gate", "SynthDef(\\#0#, { |out, amp=0.1, freq=440, gate=1|\n\tvar snd;\n\tsnd = snd * EnvGen.ar(Env.asr(0.1,1,0.1), gate, doneAction:2);\n\tOffsetOut.ar(out, snd*amp);\n}).add;");
MacroExpander.put("synth-perc", "SynthDef(\\#0#, { |out, amp=0.1, freq=440, sustain=0.1|\n\tvar snd;\n\tsnd = snd * EnvGen.ar(Env.sine(sustain), doneAction:2);\n\tOffsetOut.ar(out, snd*amp);\n}).add;");

// FILTERS
MacroExpander.put("ring", "~#0#[#1#] = \\filter -> { |in| in ring1: SinOsc.ar(44) }");
MacroExpander.put("filter", "~#0#[#1#] = \\filter -> { |in| RLPF.ar(in, \\freq.kr(220), 0.1) }");
MacroExpander.put("delay", "~#0#[#1#] = \\filter -> { |in| DelayC.ar(in, 5, [0, 1]) }");
MacroExpander.put("reverb", "~#0#[#1#] = \\filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 0.99) }");
MacroExpander.put("comb", "~#0#[#1#] = \\filter -> { |in| CombC.ar(in, 5, 0.33, 2) }");
MacroExpander.put("eq", "~#0#[#1#] = \\filter -> { |in| MidEQ.ar(in, 220, 0.5, 6) }");
MacroExpander.put("comp", "~#0#[#1#] = \\filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) }");

// PATTERNS
MacroExpander.put("np", "(\n~#0#[0]= Pbind(\n\t\\instrument, \\#0#,\n\t\\scale, Scale.minor,\n\t\\octave, 4,\n\t\\degree, Pseq([0], inf),\n\t\\amp, Pseq([0.1], inf), \n\t\\dur, Pseq([1], inf)\n)\n)");
MacroExpander.put("pt", "(\nNPdef(~#0#, \n\tPbind(\n\t\t\\t_trig, 1, \n\t\t\\amp, Pseq([0.1], inf), \n\t\t\\dur, Pseq([1], inf)\n\t)\n).play\n)");
MacroExpander.put("pf", "(\nNPdef(~#0#, \n\tPbind(\n\t\t\\freq, Pseq([220], inf), \n\t\t\\amp, Pseq([0.1], inf), \n\t\t\\dur, Pseq([1], inf)\n\t)\n).play\n)");
MacroExpander.put("ptf", "(\nNPdef(~#0#,\n\tPbind(\n\t\t\\freq, Pseq([220], inf), \n\t\t\\t_trig, 1, \n\t\t\\amp, Pseq([0.1], inf), \n\t\t\\dur, Pseq([1], inf)\n\t)\n).play\n)");

// UTILITIES
MacroExpander.put("init", "p = ProxySpace.push(s);\np.fadeTime = 0.1;\ns.latency = nil;");
MacroExpander.put("tempo", "TempoClock.default.tempo = #0#; ~tempo = #0#;");
MacroExpander.put("tools", "~#0#.fadeTime = 0;\n~#0#.play;\n~#0#.stop;\n~#0#.set(\\amp, 0.1);");
MacroExpander.put("spec", "Spec.add(\\#0#, [min, max, \lin, step].asSpec)");
MacroExpander.put("sampler", "\"~/dev/__git/scprivatepool/livecode/benoit/samplergui.scd\".spath.load");
MacroExpander.put("commands", "MacroExpander.instance.dict.keys.dopostln");
MacroExpander.put("timer", "(0..16).do{|i| { postf(\"\\n***********\\nMinute: %\\n***********\\n\", i) }.defer(i*60) };\"\";");


// LIST MACROS
// MacroExpander.instance.dict.keys.do{ |cmd| ("\t* " ++ cmd.asString).postln };