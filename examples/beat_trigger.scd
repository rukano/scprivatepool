// triggers a sample while singing... after silence, stops the sample

b = Buffer.read(s, "/Volumes/DATA/samples/misc/RnB_Beat.aif");

SynthDef(\beat, { |buf|
	var snd = PlayBuf.ar(2, buf, BufRateScale.kr(buf), loop:1, doneAction:2);
	OffsetOut.ar(0, snd);
}).store;

SynthDef(\ampTracker, { |thresh=0.05, rate=22|
	var in = SoundIn.ar(0);
	var amp = Amplitude.kr(in);
	SendTrig.kr(Impulse.kr(rate), 100, amp.excess(thresh));
}).play;

q = ();
q.lastTrig = 0;
q.waitTime = 1;
q.beat = nil;
q.zeroList = List.new;
q.zeroCount = 20;

x = OSCresponder(s.addr, '/tr', {|time,resp,msg|
	if( msg[3] != 0 ){
		if(q.beat.isPlaying.not){
			q.beat = Synth(\beat, [\buf, b]);
			q.beat.register;
		};
		q.zeroList.clear;
	}{
		if(q.zeroList.size <= q.zeroCount){
			q.zeroList.add(0);
		}{
			if(q.beat.isPlaying){
				q.beat.free;
			}
		}
	}
}).add;
