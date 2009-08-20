p = ProxySpace.push(s)

~input = { SoundIn.ar(1).dup }
~effects = { ~input.ar }
~effects[10] = \filter -> { |in| CombC.ar(in, 1, 1/80, 1) }
~effects[100] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 1, 1, 1) }



~output = { ~effects.ar }
~output.play
p.clear

StageLimiter.activate