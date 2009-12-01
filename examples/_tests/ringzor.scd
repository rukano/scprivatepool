p = ProxySpace.push(s)
~out.play
~out.fadeTime=3
(
Tdef(\loop, {
	loop{
		~out[0] = {
			var imp = Array.rand(9,1,10);
			var snd = Ringz.ar(
				Decay2.ar(
					Impulse.ar(imp) ++ Dust.ar(imp.keep(3)),
					rrand(0.05,0.5),
					rrand(0.5,3.0)
				),
				Array.rand(imp.size+3,99,9999),
				0.9,
				0.05
			).sum!2;
			snd = Compander.ar(snd,snd,0.1,0.4,0.9) * 1.25;
		};
		5.wait;
	}
}).play
)
~out[10] = \filter -> { |in| (in*0.7) + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.5) }
p.end(10)

ProxyMixer(p)
