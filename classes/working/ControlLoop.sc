ControlLoop {
	var <list, <array;
	var <player;
	var <>stretch, <>scale, <>offset;
	var <>recording = false;
	var <>action;
	var <>bus;
	var <duration;
	var <>startAction, <>stopAction, <>thru = true;
		
	*new { |debug=true|
		^super.new.init(debug)
	}
	
	init { |debug|
		list = List.new;
		if (debug) { action = { |v| v.postln } } { action = { |v| v } };
		startAction = { "+++".postln };
		stopAction = { "---".postln };
		stretch = 1;
		scale = 1;
		offset = 0;

		^this
	}
	
	add { |val|
		list.add([ Main.elapsedTime, val ]);
		if (thru) { action.value(val) };		
	}

	startRecording { |addAction=false|
		list = List.new;
		if (addAction) { this.add(nil) };
		startAction.value;
		recording = true;
		^this
	}
	
	stopRecording { |addAction=true|
		if (addAction) { this.add(nil) };
		this.processList;
		stopAction.value;
		recording = false;
		^this	
	}

	play {
		if ( player.isPlaying ) { player.stop };
		player = Task{	
			inf.do{ |i|
				var time, val;
				#time, val = array.wrapAt(i);
				(time * stretch).wait;
				if(val != nil) {
					val = val * scale + offset;
					action.value(val);
					if (bus != nil) { bus.set(val) }
				}
			}
		};
		^player.play;
	}
	
	stop {
		^player.stop;
	}
	
	reset {
		^player.reset	
	}
	
//	asBuffer {
//		var temp = List.new;
//		var values = array.flop[1].replace(nil, 0);
//		var times = (array.flop[0] * Server.default.sampleRate).floor.rotate(-1);
//		values.do{ |v,i| temp.add(v ! times[i]) };
//		^Buffer.loadCollection(Server.default, temp.flatten);
//	}
		
	valuesBuffer {
		var temp = array.flop[1].select(_.notNil);
		^Buffer.loadCollection(Server.default, temp);
	}
	
	makeBus {
		bus = bus ? Bus.control(Server.default, 1);
		^this
	}
	
	removeBus {
		bus = nil	
	}
	
	processList{
		var a = list.flop;
		var scaledList = a[0] - a[0][0];
		duration = scaledList.last;
		array = [(scaledList).differentiate, a[1]].flop;
		^array
	}
}

