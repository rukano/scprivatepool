// take a folder with samples and load all the .aif samples there
// then controll the basic sample stuff from MIDI with CCResponders
// I use a BCR2000

q = ();
q.myRate = 1;
q.myPath = PathName("/Volumes/DATA/samples/futuremusic213/Dubstep_2/06(70BPM)");
q.buffers = ();
q.myPath.filesDo{ |aFile, i|
	var file = aFile.fileName;
	if(file.contains(".wav") || file.contains(".aif")){
		postf("Loading... %\n", file);
		q.buffers.put(file.asSymbol, Buffer.read(s, aFile.fullPath, action:{
				postf("*** file was loaded: %\n", file);
			}, bufnum:i)
		)
	}

};

p = ProxySpace.push(s);
~samplePlayer[0] = { Splay.ar(PlayBuf.ar(2, \buf.kr(0), BufRateScale.kr(\buf.kr(0)) * \rate.kr(1), \t_trig.tr, loop:1)) * \amp.kr(0.1).lag(0.1)};
~samplePlayer[5] = \filter -> {|in| LPF.ar(in, \freq.kr(2000).lag(0.1))};
~samplePlayer.play;

(


// start stop
CCResponder({ |src,chan,num,value|
	if(value==0){
		~samplePlayer.stop;
		postf("\n\n\t\t\t\t***SAMPLE STOPPED***\n\n");
	}{
		~samplePlayer.play;
		postf("\n\n\t\t\t\t---SAMPLE STARTED---\n\n");
	};
}, num:33);

// retrigger
CCResponder({ |src,chan,num,value|
	~samplePlayer.set(\amp, value/127);
}, num:1);

// retrigger
CCResponder({ |src,chan,num,value|
	postf("\n\t\t<<<<<TRIGGA>>>>>\n");
	~samplePlayer.set(\t_trig, 1);
}, num:65);

// invert rate
CCResponder({ |src,chan,num,value|
	q.myRate = q.myRate * (-1);
	~samplePlayer.set(\rate, q.myRate);
	postf("rate: %\n", q.myRate);
}, num:73);

// change sample
CCResponder({ |src,chan,num,value|
	var sample = value.linlin(0,127, 0,15).round;
	~samplePlayer.set(\buf, sample);
	postf("using sample: %\n", sample);
}, num:81);

// rate changer
CCResponder({ |src,chan,num,value|
	q.myRate = value.linlin(0,127, 0.0, 2.0);
	~samplePlayer.set(\rate, q.myRate);
//	postf("rate: %\n", q.myRate);
}, num:89);

// filter freq
CCResponder({ |src,chan,num,value|
	var mappedVal = value.linexp(0,127, 80,16000);
	~samplePlayer.set(\freq, mappedVal);
//	postf("\tfilter freq: %\n", mappedVal);
}, num:97);


s.latency = nil;


)

/**
CCResponder.removeAll
(
CCResponder({ |src,chan,num,value|
	[src,chan,num,value].postln
});
)
**/



