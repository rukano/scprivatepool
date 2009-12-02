(
~out[0] = {
	var harm = 24;
	var step = 120;
	var root = 40;
	var snd;
	snd = SinOsc.ar(
		Array.fill(harm, { |i| root + ((i+1)*step) * rrand(0.75,1.25) }),
		0,
		Array.fill(harm, { |i| (1 - (i/harm)).abs }) * 0.05
	);
	snd = snd *	harm.collect { |i|
		EnvGen.ar(
			Env.perc(
				((1-(i/harm)).abs * (rrand(0.9,1.1)) * 0.1),
				(1-(i/(harm*2))).abs * 12 * (rrand(0.9,1.1)),
				1,
				linrand(-18.0,-8.0)
			),
			\t_trig.kr(1)
		)
	};
	snd.sum!2
}
)

~out[10] = \filter -> { |in| (in*0.8) + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.2) }

~out.set(\t_trig, 1)


~out.play

