// my own personal class extensions...
// Juan A. Romero - 2009


////////////////// Numbers ////////////////////////

+ SimpleNumber {
	
	midirange { |lo=0,hi=1|
		^this.linlin(0,127,lo,hi)
	}

	ccrange { |lo=0,hi=1|
		^this.midirange(lo,hi)
	}
	
	// TODO: xrange !!	
	bpm {
		^this/60
	}
}

////////////////// JiT ////////////////////////

// Make a BIG Trigger Button from NodeProxy with \t_trig

+ NodeProxy {

	checkForTrigger {
		var test = false;
		
		// why at 0 ? check this out...
		// also look for t_ names... not only t_trig
		this.objects[0].synthDef.allControlNames.do{ |ctl|
			if(ctl.name == \t_trig) {
				test = true;
			};
		};
	^test;
	}

	// makes a button and if you bind it to a variable
	// you can acces the window and button instances and modify them
	
	makeTriggerButton { |size=200|
		var trigGUI;
		if ( this.checkForTrigger ) {
			trigGUI = ();
			trigGUI.window = Window("Node Trigger", Rect(100,100,size,size)).front;
			trigGUI.button = Button(trigGUI.window, (size@size))
				.states_([["TRIG ME!",Color.black,Color.white]])
				.font_(Font("Arial",(size/8).round))
//				.align_(\center)
				.action_({
					// mayber here... make other controller available?
					this.set(\t_trig, 1);
				});
			"Enjoy your triggering".postln;"";

			^trigGUI;
		} {
			"Need a NodeProxy with a 't_trig' argument".error;"";
			^this;
		}
	}
}

////////////////// STRING ////////////////////////

+ String {

// Read an audacity plotted spectrum file (via export)
// and gives you an array with [freq, amps] in [Hz, dB]


	audacitySpectrum {
		var file, info, lines, array;
		file = File(this, "r");		// open the file
		info = file.readAllString;	// read the info	
		file.close;				// close the file
		lines = info.findAll("\r");	// find all RETURNs (for indexing)

		// make the array
		array = (lines.size-1).collect{ |i|
			var string;
			(i < (lines.size-1)).if{
				string = info.copyRange(lines[i]+1, lines[i+1]-1); // copy a line
				string.split($\t).asFloat; // split tab and make floats
			}
		};

		"INFO: Now you have an array with [freq-in-hz, amp-in-db] items".postln;
		^array;
	}
}

////////////////// ARRAY ////////////////////////


+ Array {

	// array pairs as dictionary
	// to convert the arrays in Pbinds (.patternpairs)
	// to dictionaries or events

	asDict {
		var temp = Dictionary.new;
		this.size.even.if {
			(this.size/2).do{ |i|
				temp.put(this[i*2], this[i*2+1]);
			};
			^temp;
		} {
			"The size of the array should be even".error;
			^this;
		};
	}
	
	asEvent {
		var temp = ();
		this.size.even.if {
			(this.size/2).do{ |i|
				temp[this[i*2]] = this[i*2+1];
			};
			^temp;
		} {
			"The size of the array should be even".error;
			^this;
		};
	}

}

/////////// STRING ///////////////////

+ String {
	
	repeat { |num|
		var temp = "";
		num.do{
			temp = temp ++ this
		};
		^temp
	}	
	
}

// MasterFX
//
//+ MasterFX {
//	*activate {
//		ProxyChain.add(
//			\leakDC,  \filter -> { |in, leak=0.99|
//					LeakDC.ar(in, leak)
//			},
//			\rollClip, \filter -> { |in, clip=0.99, pole=0.2|
//				OnePole.ar(in.clip2(clip), pole ** 0.7);
//			},
//			\bitcrush, \filter -> { |in, bits=16, downsamp=2| 
//				var down;
//				in = in.round(0.5 ** bits);
//				down = Latch.ar(in, Impulse.ar(SampleRate.ir / downsamp.max(2))); 
//					// below 1/2 downsamp, do xfade:
//				blend(in, down, (downsamp - 1).clip(0, 1));
//			},
//			\limiter, \filter -> { |in, limDrive=1, ampLimit=0.8, postAmp=1 | 
//				Limiter.ar(in * limDrive, ampLimit) * postAmp;
//			}
//		);
//			// and specs for them fof gui control.
//		Spec.add(\leak, [0.5, 0.999, \exp]);
//		Spec.add(\clip, [0.0, 1, \amp]);
//		Spec.add(\pole, [0, 0.95, \lin]);
//		
//		Spec.add(\bits, [16, 1]);
//		Spec.add(\downsamp, [1, 100, \exp]);
//		
//		Spec.add(\limDrive, \ampx4);
//		Spec.add(\ampLimit, \amp);
//		Spec.add(\postAmp, \ampx4);
//		
//		MasterFX.new(
//			server: Server.default, 
//			numChannels: 2,
//			slotNames: [\leakDC, \bitcrush, \rollClip, \limiter], 
//			busIndex: 0
//		).gui(nSliders: 12);
//	}	
//}

