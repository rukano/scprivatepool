ControlLoop {
	var <list, <prList;
	var <player;
	var <>stretch, <>scale, <>offset;
	var <>recording = false;
	var <>action;
		
	*new { |debug=true|
		^super.new.init(debug)
	}
	
	init { |debug|
		list = List.new;
		if (debug) { action = { |v| v.postln } } { action = { |v| v } };
		player = nil;
		stretch = 1;
		scale = 1;
		offset = 0;

		^this
	}
	
	add { |value|
		list.add([ Main.elapsedTime, value ])
	}

	startRecording { |addAction=false|
		list = List.new;
		if (addAction) { this.add(nil) };
		recording = true;
		^this
	}
	
	stopRecording { |addAction=true|
		if (addAction) { this.add(nil) };
		this.processList;
		recording = false;
		^this	
	}

	play {
		if ( player.isPlaying ) { player.stop };
		player = Task{	
			inf.do{ |i|
				var time, val;
				#time, val = prList.wrapAt(i);
				time.wait;
				if(val != nil) {
					action.value(val);
				}
			}
		};
		player.play;
		^player
	}
	
	stop {
		player.stop;
		^player
	}
		
	asBuffer {
		
	}
	
	processList{
		var a = list.flop;
		prList = [(a[0] - a[0][0]).differentiate, a[1]].flop;
		^prList
	}
}

