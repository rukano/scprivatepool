q = ();

// or a path to a directory with soundfiles (change the format)
q.buffer = "/Volumes/DATA/samples/futuremusic213/Dubstep_5/No_FX/" ++ "*.wav".pathMatch;

// give it as an array of Buffers
q.buffer.collect{ |path| Buffer.read(s, path) };

// test if something's there
q.buffer[2].play

(					// play random samples
Tdef(\randomPlayer, {
	inf.do{
		q.buffer[q.buffer.size.rand].play;
		0.25.wait;
	}
}).play

)

Tdef(\randomPlayer).stop
